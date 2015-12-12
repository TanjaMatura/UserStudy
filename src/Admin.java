

/* Admin Klasse... Wir rbauchen eigentlihc nur username, password, 
 * statistik methoden, datenbank manipulation
*/
public class Admin {
	private String username; 
	private String password;  

	
					
	
	/* ------------ Konstruktor  ------------ */
	
	public Admin(String username, String password){
		this.username = username; 
		this.password = password; 
		
	}

	/* ------------ Getter ------------ */
	
	public String getUsername(){ return username; }
	public String getPassword(){ return password; }
	
	/*------------- Setter ------------- */
	
	public void setUsername(String newName) {
		
		this.username = newName;
	}
	
	public void setPassword(String newPw) {
	
		this.password = newPw;
	}
	
	/* ------------ Komplexere Methoden ------------ */
	
	/*------------- Datenbankmanipulation ------------- */
	public void addVideo(String url, String name, String length, String marke, String kategorie){
		Video neuesVid = new Video(url, name, length, marke, kategorie);
		//Datenbank relevanter Code
		VideoDAO vDAO = new VideoDAO("\\video");
		vDAO.saveVideo(neuesVid);
	}
	public void removeVideo(Video video){
		//Datenbank relevanter Code
		VideoDAO vDAO = new VideoDAO("\\video");
		vDAO.deleteVideo(video);
	}
	
	

}