

/* Admin Klasse... Wir rbauchen eigentlihc nur username, password, 
 * statistik methoden, datenbank manipulation
*/
public class Admin {
	private String id;
	private String username; 
	private String password;
	private String age;
	private String gender;

	
					
	
	/* ------------ Konstruktor  ------------ */
	
	public Admin(String username, String password, String age, String gender){
		this.username = username; 
		this.password = password; 
		this.age = age;
		this.gender = gender;
		MySqlDAO mySqlDAO = new MySqlDAO();
		try {
			this.id = Integer.toString(mySqlDAO.getUserList().size()+1);	
		}
		catch(Exception e){
			this.id = Integer.toString(1);
		}
		
	}
	//für laden von der database
	public Admin(String id, String username, String password, String age, String gender){
		this.id = id;
		this.username = username; 
		this.password = password; 
		this.password = password; 
		this.age = age;
		this.gender = gender;
		
	}

	/* ------------ Getter ------------ */
	
	public String getId(){ return id; }
	public String getUsername(){ return username; }
	public String getPassword(){ return password; }
	public String getAge(){ return age; }
	public String getGender(){ return gender; }
	
	/*------------- Setter ------------- */
	
	public void setUsername(String newName) {
		
		this.username = newName;
	}
	
	public void setPassword(String newPw) {
	
		this.password = newPw;
	}
	
	/* ------------ Komplexere Methoden ------------ */
	
	/*------------- Datenbankmanipulation ------------- */
	public void addVideo(String url, String name, String length, String marke, String kategorie) throws Exception{
		Video neuesVid = new Video(url, name, length, marke, kategorie);
		//Datenbank relevanter Code
		MySqlDAO vDAO = new MySqlDAO();
		vDAO.saveVideo(neuesVid);
	}
	public void removeVideo(Video video) throws Exception{
		//Datenbank relevanter Code
		MySqlDAO vDAO = new MySqlDAO();
		try{
		vDAO.removeVideobyUrl(video.getURL());
		}catch (Exception e) {
		      throw e;
		    }
	}
	
	

}