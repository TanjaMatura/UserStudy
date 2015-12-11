
/* Bewertung-Klasse 
 * Repraesentiert eine ausgefuellte Befragung
 */

public class Bewertung {
	private String id;
	private int[] geschlecht; 		// männlich, weiblich, was anderes
	private int[] altersgruppe; 	// 5 Altersgruppen
	private String videourl; 
	private String videoname; 
	
/* ------------ Konstruktor  ------------ */
	
	public Bewertung(int[] geschlecht, int[] altersgruppe, String videourl, String videoname){
		this.geschlecht = geschlecht; 
		this.altersgruppe = altersgruppe; 
		this.videourl = videourl;
		this.videoname = videoname;
		BewertungDAO bDAO = new BewertungDAO("\\rating");
		try {
			this.id = Integer.toString(bDAO.getbewertungList().size()+1);	
		}
		catch(Exception e){
			this.id = Integer.toString(1);
		}
		
		
		
	}
	
/* ------------ Getter ------------ */
	
	public String getID(){ return id; }
	
	// Ja/Nein (NA)
	private int schongesehen, plottwist, catchphrase, gerngesehen, ueberzeugung, aufmerksamkeit, markebekannt; 
		
	// Abstufung (kein NA, da es Mittelstufe = Neutral gibt)
	private int produktfixierung, lachenweinen, froehlichtraurig, lustigernst, altmodischmodern, kreativunkreativ; 
	private int liebenswertfies, sympathischunsympathisch, zielgruppe, bewertungen;
	
}
