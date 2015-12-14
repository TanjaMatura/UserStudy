package src; 
/* Bewertung-Klasse 
 * Repraesentiert eine ausgefuellte Befragung
 */

public class Bewertung {
	private String id;
	private String uid;
	//private String geschlecht; 		// männlich, weiblich, was anderes
	//private String altersgruppe; 	// 5 Altersgruppen
	private String videourl; 
	//private String videoname; 
	
	
	// Ja/Nein (NA)
		private String schongesehen; 
		private String plottwist; 
		private String catchphrase; 
		private String gerngesehen;  
		private String ueberzeugung; 
		private String aufmerksamkeit; 
		private String markebekannt ; 
		
		// Abstufung (kein NA, da es Mittelstufe = Neutral gibt)
		private int produktfixierung; 
		private int lachenweinen; 
		
		private int froehlichtraurig; 
		private int lustigernst; 
		private int altmodischmodern; 
		private int kreativunkreativ; 
		private int liebenswertfies; 
		private int sympathischunsympathisch; 
		
		private String zielgruppe; 
		
		private int bewertungen;
/* ------------ Konstruktor  ------------ */
	
	public Bewertung(String userID, String videourl, String videoname, int produktfixierung, int lachenweinen, 
			int froehlichtraurig, int lustigernst, int altmodischmodern, int kreativunkreativ, int liebenswertfies, int sympathischunsympathisch, 
			String zielgruppe, int bewertungen){
		
		this.uid = userID; 
		this.videourl = videourl;
		this.produktfixierung = produktfixierung; 
		this.lachenweinen = lachenweinen; 
		this.froehlichtraurig = froehlichtraurig; 
		this.lustigernst = lustigernst; 
		this.altmodischmodern = altmodischmodern; 
		this.kreativunkreativ = kreativunkreativ; 
		this.liebenswertfies = liebenswertfies; 
		this.sympathischunsympathisch = sympathischunsympathisch; 
		this.zielgruppe = zielgruppe; 
		this.bewertungen = bewertungen; 
		MySqlDAO bDAO = new MySqlDAO();
		try {
			this.id = Integer.toString(bDAO.getBewertungList().size()+1);	
		}
		catch(Exception e){
			this.id = Integer.toString(1);
		}
		
		
		
	}
	
	
/* ------------ Getter ------------ */
	
	public String getID(){ return id; }
	public String getUid(){ return uid; }
	public String geturl(){ return videourl; }
	public String getSchonGesehen(){ return schongesehen; }
	public String getPlotTwist(){ return plottwist; }
	public String getCatchPhrase(){ return catchphrase; }
	public String getGernGesehen(){ return gerngesehen; }
	public String getUeberzeugung(){ return ueberzeugung; }
	public String getAufmerksamkeit(){ return aufmerksamkeit; }
	public String getMarkeBekannt(){ return markebekannt; }
	
	public int getProduktfixierung(){ return produktfixierung; }
	public int getLachenWeinen(){ return lachenweinen; }
	
	public int getFroehlichTraurig(){ return froehlichtraurig; }
	public int getLustigErnst(){ return lustigernst; }
	public int getAltmodischModern(){ return altmodischmodern; }
	public int getKreativUnkreativ(){ return kreativunkreativ; }
	public int getLiebenswertFies(){ return liebenswertfies; }
	public int getSympathischUnsympathisch(){ return sympathischunsympathisch; }
	
	public String getZielgruppe(){ return zielgruppe; }
	
	public int getBewertung(){ return bewertungen; }
	
/* ------------ Komplexere Methoden ------------ */
	
	// Summe der Bewertungen (nicht Anzahl) 
	/*public double getSumBewertungen(){		
		int sBewertung = 0;
		for (int i = 0; i < bewertungen; i++) { sBewertung += bewertungen[i]*i; }
		return sBewertung; 
	}
	
	// Durchschnittliche Bewertung 
	public double getDurchschnittlicheBewertung(){		
		return getSumBewertungen()/anzahlBewertungen; 
	}
	
	// Neue Bewertung hinzufuegen
	public void addBewertung(int wert){ bewertungen[wert]++; anzahlBewertungen++;}*/
	
	
}
