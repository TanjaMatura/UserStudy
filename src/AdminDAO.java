

/* Admin DAO um Admins zu speichenr, zu laden und stuff
 *
 * 
 */

import java.io.*;
import java.util.ArrayList;

public class AdminDAO{
	private String pfad;

	/* ------------ Konstruktor  ------------ */
	public AdminDAO(String pfad){
		this.pfad=pfad;
	}

	
	/* ------------ Komplexere Methoden ------------ */
	
	
	//sucht den Admin über username (mehr habenw ir eh nicht löl)
	public Admin getAdminbyUsername(String username){
		ArrayList<Admin> userList=null;
		try{
			File file=new File(pfad);
			if(file.exists()){
				ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
				userList=(ArrayList<Admin>)ois.readObject();
				ois.close();
				for(int i=0;i<userList.size();i++){
					String savedUsername=(userList.get(i)).getUsername();
					if(savedUsername.equals(username)){
						return userList.get(i);
					}
				}
			}
			else{
				throw new IllegalArgumentException("Datei existiert nicht!");
			}
		}
		catch(Exception e){}
		return null;
	}

	//speichert dne Admin
	public void saveAdmin(Admin user){
		try{
			//zuerst schauen wir ob es dne user schon gibt
			File file=new File(pfad);
			if(file.exists()){
				ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
				ArrayList<Admin> userListIn=(ArrayList<Admin>)ois.readObject();
				ois.close();
				
				int abbruchVariable=0;
				for(int i=0;i<userListIn.size();i++){
					String username1=(userListIn.get(i)).getUsername();
					String username2=user.getUsername();
					if(username1.equals(username2)){
						abbruchVariable=1;
						break;
					}
				}
				//wenn wir den user nicht finden fügen wir ihn der userList hinzu und speichenr ab	
				if(abbruchVariable==0){
					userListIn.add(user);
					ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(pfad));
					oos.writeObject(userListIn);
					oos.close();
				}
				else{
					throw new IllegalArgumentException("Dieser Username ist schon besetzt!");
				}	
			}
			else{
				//wenn die file nicht existiert legenw ir eine neue an
				ArrayList<Admin> userList=new ArrayList<Admin>();
				userList.add(user);
				ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(pfad));
				oos.writeObject(userList);
				oos.close();
			}
		}
		catch(IOException e){}
		catch(ClassNotFoundException e){}
		catch(IllegalArgumentException userE){
			System.out.println(userE.getMessage());
		}
	}
	
	//updatet dne Admin (funktioniert eigentlihc nur mit passwort
		public void updateAdmin(Admin user){
			try{
				//zuerst schauen wir ob es dne user schon gibt
				File file=new File(pfad);
				if(file.exists()){
					ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
					ArrayList<Admin> userListIn=(ArrayList<Admin>)ois.readObject();
					ois.close();
					
					int abbruchVariable=0;
					int position=0;
					for(int i=0;i<userListIn.size();i++){
						String username1=(userListIn.get(i)).getUsername();
						String username2=user.getUsername();
						if(username1.equals(username2)){ //found you!
							abbruchVariable=1;
							position =i;
							userListIn.set(position, user);
							break;
						}
					}
					//wenn wir den user nicht finden haben wir n problem	
					if(abbruchVariable==0){
						throw new IllegalArgumentException("User existiert nicht!");
					}
					if(abbruchVariable==1){ //wir haben was gefundne und speichern
						ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(pfad));
						oos.writeObject(userListIn);
						oos.close();
					}
					
				}
				else{
					//wenn die file nicht existiert weinen wir in einer ecke
					throw new IllegalArgumentException("File existiert nicht!");
				}
			}
			catch(IOException e){}
			catch(ClassNotFoundException e){}
			catch(IllegalArgumentException userE){
				System.out.println(userE.getMessage());
			}
		}

	//löschte einen Admin (falls wir das bruachen is es da)
	public void deleteAdmin(Admin user){
		ArrayList<Admin> userList=null;
		try{
			File file=new File(pfad);
			if(file.exists()){
				ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
				userList=(ArrayList<Admin>)ois.readObject();
				ois.close();

				int abbruchVariable=0;
				int position=0;
				for(int i=0;i<userList.size();i++){
					String savedUsername=(userList.get(i)).getUsername();
					String username=user.getUsername();
					if(savedUsername.equals(username)){
						abbruchVariable=1;
						position=i;
						break;
					}
				}
				if(abbruchVariable==1){
					userList.remove(position);
					ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(pfad));
					oos.writeObject(userList);
					oos.close();
				}
				else{
					throw new IllegalArgumentException("Es gibt keinen Benutzer mit diesem username!");
				}
			}
			else{
				throw new IllegalArgumentException("Datei existiert nicht!");
			}
		}
		catch(IOException e){}
		catch(ClassNotFoundException e){}
		catch(IllegalArgumentException userE){
			System.out.println(userE.getMessage());
		}
	}

	public ArrayList getUserList(){
		ArrayList<Admin> userList=null;
		try{
			File file=new File(pfad);
			if(file.exists()){
				ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
				userList=(ArrayList<Admin>)ois.readObject();
				ois.close();
			}
			else{
				throw new IllegalArgumentException("Datei existiert nicht!");
			}
		}
		catch(Exception e){}
		return userList;
	}

}