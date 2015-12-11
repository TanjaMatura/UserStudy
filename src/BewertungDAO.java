
/* Bewertung DAO um Bewertungs zu speichenr, zu laden und stuff
 *
 * 
 */

import java.io.*;
import java.util.ArrayList;

public class BewertungDAO{
	private String pfad;

	/* ------------ Konstruktor  ------------ */
	public BewertungDAO(String pfad){
		this.pfad=pfad;
	}

	
	/* ------------ Komplexere Methoden ------------ */
	
	
	//sucht den Bewertung über ID (mehr habenw ir eh nicht löl)
	public Bewertung getBewertungbyID(String ID){
		ArrayList<Bewertung> bewertungList=null;
		try{
			File file=new File(pfad);
			if(file.exists()){
				ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
				bewertungList=(ArrayList<Bewertung>)ois.readObject();
				ois.close();
				for(int i=0;i<bewertungList.size();i++){
					String savedID=(bewertungList.get(i)).getID();
					if(savedID.equals(ID)){
						return bewertungList.get(i);
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

	//speichert eine Bewertung
	public void saveBewertung(Bewertung bewertung){
		try{
			//zuerst schauen wir ob es dne bewertung schon gibt
			File file=new File(pfad);
			if(file.exists()){
				ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
				ArrayList<Bewertung> bewertungListIn=(ArrayList<Bewertung>)ois.readObject();
				ois.close();
				
				int abbruchVariable=0;
				for(int i=0;i<bewertungListIn.size();i++){
					String ID1=(bewertungListIn.get(i)).getID();
					String ID2=bewertung.getID();
					if(ID1.equals(ID2)){
						abbruchVariable=1;
						break;
					}
				}
					
				if(abbruchVariable==0){
					bewertungListIn.add(bewertung);
					ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(pfad));
					oos.writeObject(bewertungListIn);
					oos.close();
				}
				else{
					throw new IllegalArgumentException("Diese ID gibt es schon!");
				}	
			}
			else{
				//wenn die file nicht existiert legenw ir eine neue an
				ArrayList<Bewertung> bewertungList=new ArrayList<Bewertung>();
				bewertungList.add(bewertung);
				ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(pfad));
				oos.writeObject(bewertungList);
				oos.close();
			}
		}
		catch(IOException e){}
		catch(ClassNotFoundException e){}
		catch(IllegalArgumentException bewertungE){
			System.out.println(bewertungE.getMessage());
		}
	}
	
	

	//löscht eine Bewertung 
	public void deleteBewertung(Bewertung bewertung){
		ArrayList<Bewertung> bewertungList=null;
		try{
			File file=new File(pfad);
			if(file.exists()){
				ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
				bewertungList=(ArrayList<Bewertung>)ois.readObject();
				ois.close();

				int abbruchVariable=0;
				int position=0;
				for(int i=0;i<bewertungList.size();i++){
					String savedID=(bewertungList.get(i)).getID();
					String ID=bewertung.getID();
					if(savedID.equals(ID)){
						abbruchVariable=1;
						position=i;
						break;
					}
				}
				if(abbruchVariable==1){
					bewertungList.remove(position);
					ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(pfad));
					oos.writeObject(bewertungList);
					oos.close();
				}
				else{
					throw new IllegalArgumentException("Es gibt keine Bewertung mit dieser ID!");
				}
			}
			else{
				throw new IllegalArgumentException("Datei existiert nicht!");
			}
		}
		catch(IOException e){}
		catch(ClassNotFoundException e){}
		catch(IllegalArgumentException bewertungE){
			System.out.println(bewertungE.getMessage());
		}
	}

	public ArrayList getbewertungList(){
		ArrayList<Bewertung> bewertungList=null;
		try{
			File file=new File(pfad);
			if(file.exists()){
				ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
				bewertungList=(ArrayList<Bewertung>)ois.readObject();
				ois.close();
			}
			else{
				throw new IllegalArgumentException("Datei existiert nicht!");
			}
		}
		catch(Exception e){}
		return bewertungList;
	}

}
