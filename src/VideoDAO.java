


/* VideoDAO hauptsächlich von VideoDAO kopiert
 *
 * 
 */

import java.io.*;
import java.util.ArrayList;

public class VideoDAO{
	private String pfad;

	/* ------------ Konstruktor  ------------ */
	public VideoDAO(String pfad){
		this.pfad=pfad;
	}

	
	/* ------------ Komplexere Methoden ------------ */
	
	
	//sucht den Video über url (mehr habenw ir eh nicht löl)
	public Video getVideobyUrl(String url){
		ArrayList<Video> videoList=null;
		try{
			File file=new File(pfad);
			if(file.exists()){
				ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
				videoList=(ArrayList<Video>)ois.readObject();
				ois.close();
				for(int i=0;i<videoList.size();i++){
					String savedUrl=(videoList.get(i)).getURL();
					if(savedUrl.equals(url)){
						return videoList.get(i);
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

	//speichert dne Video
	public void saveVideo(Video video){
		try{
			//zuerst schauen wir ob es dne video schon gibt
			File file=new File(pfad);
			if(file.exists()){
				ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
				ArrayList<Video> videoListIn=(ArrayList<Video>)ois.readObject();
				ois.close();
				
				int abbruchVariable=0;
				for(int i=0;i<videoListIn.size();i++){
					String url1=(videoListIn.get(i)).getURL();
					String url2=video.getURL();
					if(url1.equals(url2)){
						abbruchVariable=1;
						break;
					}
				}
				//wenn wir den video nicht finden fügen wir ihn der videoList hinzu und speichenr ab	
				if(abbruchVariable==0){
					videoListIn.add(video);
					ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(pfad));
					oos.writeObject(videoListIn);
					oos.close();
				}
				else{
					throw new IllegalArgumentException("Dieser url ist schon besetzt!");
				}	
			}
			else{
				//wenn die file nicht existiert legenw ir eine neue an
				ArrayList<Video> videoList=new ArrayList<Video>();
				videoList.add(video);
				ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(pfad));
				oos.writeObject(videoList);
				oos.close();
			}
		}
		catch(IOException e){}
		catch(ClassNotFoundException e){}
		catch(IllegalArgumentException videoE){
			System.out.println(videoE.getMessage());
		}
	}
	
	

	//löschte einen Video (falls wir das bruachen is es da)
	public void deleteVideo(Video video){
		ArrayList<Video> videoList=null;
		try{
			File file=new File(pfad);
			if(file.exists()){
				ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
				videoList=(ArrayList<Video>)ois.readObject();
				ois.close();

				int abbruchVariable=0;
				int position=0;
				for(int i=0;i<videoList.size();i++){
					String savedurl=(videoList.get(i)).getURL();
					String url=video.getURL();
					if(savedurl.equals(url)){
						abbruchVariable=1;
						position=i;
						break;
					}
				}
				if(abbruchVariable==1){
					videoList.remove(position);
					ObjectOutputStream oos=new ObjectOutputStream(new FileOutputStream(pfad));
					oos.writeObject(videoList);
					oos.close();
				}
				else{
					throw new IllegalArgumentException("Es gibt kein Video mit dieser url!");
				}
			}
			else{
				throw new IllegalArgumentException("Datei existiert nicht!");
			}
		}
		catch(IOException e){}
		catch(ClassNotFoundException e){}
		catch(IllegalArgumentException videoE){
			System.out.println(videoE.getMessage());
		}
	}

	public ArrayList getVideoList(){
		ArrayList<Video> videoList=null;
		try{
			File file=new File(pfad);
			if(file.exists()){
				ObjectInputStream ois=new ObjectInputStream(new FileInputStream(pfad));
				videoList=(ArrayList<Video>)ois.readObject();
				ois.close();
			}
			else{
				throw new IllegalArgumentException("Datei existiert nicht!");
			}
		}
		catch(Exception e){}
		return videoList;
	}

}