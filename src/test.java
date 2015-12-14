import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class test {

	
	public static void main(String[] args) throws Exception {
		try {
			
			  // This will load the MySQL driver, each DB has its own driver
		      Class.forName("com.mysql.jdbc.Driver");
		      System.out.println("Driver found.");
		} catch (Exception e) {
			System.out.println("Driver not found.");
		}
		try {
		      // Setup the connection with the DB
		      Connection connect = DriverManager
		          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
		              + "user=a1200069&password=mz8UserStudy");
		      //set our SQL SELECT query
		      String query = "SELECT * FROM Video";
		   
		      // create the java statement
		      Statement statement = connect.createStatement();

			  //execute query and get java resultSet
		      ResultSet resultSet = statement.executeQuery(query);
		      System.out.println("Connectione stablished");
		} catch (Exception e) {
			System.out.println("Connection not stablished");
		}
		
	}
		
		
		
	
}

