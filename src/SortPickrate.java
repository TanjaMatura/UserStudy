import java.util.Comparator;

// Klasse die gebraucht wird um sort für das Objekt RankedVideo verwenden zu können
public class SortPickrate implements Comparator<RankedVideo>{

	@Override
	public int compare(RankedVideo r1, RankedVideo r2) {
		if(r1.getPickrate() < r2.getPickrate()) { return -1; }
		else if(r1.getPickrate() == r2.getPickrate()) { return 0; }
		else if (r1.getPickrate() > r2.getPickrate()) { return 1; }
		return 0; 
	}

}
