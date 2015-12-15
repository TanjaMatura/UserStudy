import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class test {

	
	public static void main(String[] args) throws Exception {
		/*try {
			
			  // This will load the MySQL driver, each DB has its own driver
		      Class.forName("com.mysql.jdbc.Driver");
		      System.out.println("Driver found.");
		} catch (Exception e) {
			System.out.println("Driver not found.");
		}
		try {
		      // Setup the connection with the DB
		      Connection connect = DriverManager
		          .getConnection("jdbc:mysql://mysql5.univie.ac.at/a1200069"
		              + "user=a1200069@www06.univie.ac.at&password=mz8UserStudy");
		      //set our SQL SELECT query
		      
		      System.out.println("Connectione stablished");
		} catch (Exception e) {
			System.out.println( e + "Connection not stablished");
		}
	*/
		MySqlDAO test = new MySqlDAO();
		test.connect();
	}
		
		
		
	
}

