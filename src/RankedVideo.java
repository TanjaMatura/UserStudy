
// Klasse um das Ranking der Videos zu erleichtern
public class RankedVideo {
	private double dBewertung; 
	private String url; 
	private String marke; 
	private double pickrate; 
	
	// Konstruktor 
	public RankedVideo(String url, Double dBewertung, String marke, Double pickrate){
		this.dBewertung = dBewertung; 
		this.url = url; 
		this.marke = marke; 
		this.pickrate = pickrate; 
	}

	// Getter
	public String getURL(){
		return url; 
	}
	public double getDBewertung(){
		return dBewertung; 
	}
	public String getMarke(){
		return marke; 
	}
	public double getPickrate(){
		return pickrate; 
	}
}
