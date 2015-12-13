

import java.util.ArrayList;

/*      - Ja/Nein: Array mit zwei Plätzen, die zählen wie oft was jeweils ausgewählt wurde
*   	- Abstufung: Auch Arrays mit 5 bzw 10 Plätzen, je nachdem wie viele Antwortmöglichkeiten wir haben.
*   				 Den Mittelwert usw können wir uns dann direkt aus dem Array berechnen, wir haben auch 
*   				 automatisch gespeichert, wie viele Antworten schon gegeben wurden, welche wie oft usw. 
*   	- N/A: Ok eigentlich brauchen wir in jedem Array einen Platz mehr, falls gar keine Antwort ausgewählt wurde ^^  
*/
public class Video {
	private String id;
	private String url; 
	private String name; 
	private String marke; 
	private String length; // TIME values in 'HH:MM:SS' format
	private String kategorie;
	//private boolean promis; 
	//private int sekunden; 
	private int anzahlBewertungen; 
	private int angeboten; 
	private int ausgewaehlt; 
	
	
	
	/* ------------ Konstruktor  ------------ */
	
	//Konstruktur zum anlegen (keine id)
	public Video(String url, String name, String length, String marke, String kategorie){
		this.id = id; 
		this.url = url; 
		this.name = name;
		this.length = length;
		this.marke = marke;
		this.kategorie = kategorie; 
		anzahlBewertungen = 0; 
		angeboten = 0; 
		ausgewaehlt = 0;
		MySqlDAO mySqlDAO = new MySqlDAO();
		try {
			this.id = Integer.toString(mySqlDAO.getVideoList().size()+1);	
		}
		catch(Exception e){
			this.id = Integer.toString(1);
		}
	}
	
	
	//Konstruktor für Datenauslese
	
	public Video(String id, String url, String name, String length, String marke, String kategorie, String pickcount, String available){
		this.id = id; 
		this.url = url; 
		this.name = name;
		this.length = length;
		this.marke = marke;
		this.kategorie = kategorie; 
		anzahlBewertungen = 0; 
		this.angeboten = Integer.parseInt(available); 
		this.ausgewaehlt = Integer.parseInt(pickcount); 
	}

	/* ------------ Getter ------------ */
	
	public String getId(){ return id; }
	public String getURL(){ return url; }
	public String getName(){ return name; }
	public String getLength(){ return length; }
	public String getMarke(){ return marke; }
	public String getKategorie(){ return kategorie; }
	
	public int getAnzahlBewertungen(){ return anzahlBewertungen; }
	public int getAnzahlAngeboten(){ return angeboten; }
	public int getAnzahlAusgewaehlt(){ return ausgewaehlt; }
	public double getPickRatio(){ return angeboten/ausgewaehlt; }
	
	
}
