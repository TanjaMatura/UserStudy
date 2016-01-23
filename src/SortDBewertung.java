import java.util.Comparator;

// Klasse die gebraucht wird um sort f�r das Objekt RankedVideo verwenden zu k�nnen
public class SortDBewertung implements Comparator<RankedVideo>{

	@Override
	public int compare(RankedVideo r1, RankedVideo r2) {
		if(r1.getDBewertung() < r2.getDBewertung()) { return -1; }
		else if(r1.getDBewertung() == r2.getDBewertung()) { return 0; }
		else if (r1.getDBewertung() > r2.getDBewertung()) { return 1; }
		return 0; 
	}

}
