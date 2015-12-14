package src; 

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

public class MySqlDAO {
  private Connection connect = null;
  private Statement statement = null;
  private PreparedStatement preparedStatement = null;
  private ResultSet resultSet = null;
  
  /* ------------ Video stuff  ------------ */

  public ArrayList<Video> getVideoList() throws Exception{
	  
	  ArrayList<Video> videoList= new ArrayList<Video>();
	  try {
		
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "SELECT * FROM Video";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      //iterate through the reultSet and create new Video objects, adding them to the videoList
	      while(resultSet.next()) {
	    	  Video tempvid = new Video(resultSet.getString("vid_id"), resultSet.getString("vid_url"), resultSet.getString("vid_name"),
	    			  resultSet.getString("vid_length"), resultSet.getString("vid_marke"), resultSet.getString("vid_kategorie"),
	    			  resultSet.getString("vid_pickcount"), resultSet.getString("vid_pickavailable"));
	    	  videoList.add(tempvid);
	      }
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  return videoList;
	  
  }
  
  public Video getVideobyUrl(String url) throws Exception{
	  
	  Video thing=null;
	  try {
		
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "SELECT " + url +" FROM Video";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      //iterate through the reultSet and create new Video object
	      while(resultSet.next()) {
	    	  thing = new Video(resultSet.getString("vid_id"), resultSet.getString("vid_url"), resultSet.getString("vid_name"),
	    			  resultSet.getString("vid_length"), resultSet.getString("vid_marke"), resultSet.getString("vid_kategorie"),
	    			  resultSet.getString("vid_pickcount"), resultSet.getString("vid_pickavailable"));
	    	  
	      }
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  return thing;
	  
  }
  
  public void removeVideobyUrl(String url) throws Exception{
	  
	  
	  try {
		
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "DELETE * FROM Video WHERE vid_url='" + url +"'";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  
	  
  }
  
  public void saveVideo(Video video) throws Exception{
	    
	  try {
		
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "INSERT INTO Video VALUES (" + video.getId() + "," + video.getURL() + video.getName() + "," + video.getLength() + "," +
	    		  video.getMarke() + "," + video.getKategorie() + video.getAnzahlAusgewaehlt() + video.getAnzahlAngeboten() +  ")";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  
	  
  }
  /* ------------ Bewertung stuff ------------ */
  
public ArrayList<Bewertung> getBewertungList() throws Exception{
	  ArrayList<Bewertung> bewertungList= new ArrayList<Bewertung>();
	  try {
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "SELECT * FROM Bewertung";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      //iterate through the reultSet and create new Video objects, adding them to the videoList
	      while(resultSet.next()) {
	    	  Bewertung tempbew = new Bewertung(resultSet.getString("b_id"), resultSet.getString("b_uid"), resultSet.getString("b_url"),
	    			  resultSet.getInt("produktfixierung"), resultSet.getInt("lachenweinen"), resultSet.getInt("froehlichtraurig"), resultSet.getInt("lustigernst"),
	    			  resultSet.getInt("altmodischmodern"), resultSet.getInt("kreativunkreativ"), resultSet.getInt("liebenswertfies"), resultSet.getInt("sympathischunsympathisch"), resultSet.getString("zielgruppe"), resultSet.getInt("bewertungen"));
	    	  bewertungList.add(tempbew);
	      }
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  return bewertungList;
	  
  }

public void removeBewertungbyId(String id) throws Exception{
	  
	  
	  try {
		
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "DELETE * FROM Bewertung WHERE b_id='" + id +"'";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  
	  
}

public void saveBewertung(Bewertung bewertung) throws Exception{
    
	  try {
		
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "INSERT INTO Bewertung VALUES (" + bewertung.getUid() + "," + bewertung.geturl() + bewertung.getSchonGesehen() + "," + bewertung.getPlotTwist() + "," +
	    		  bewertung.getCatchPhrase() + "," + bewertung.getGernGesehen() + "," + bewertung.getUeberzeugung() +  
	    		  "," + bewertung.getAufmerksamkeit() + "," + bewertung.getMarkeBekannt() + "," + bewertung.getProduktfixierung() +
	    		  "," + bewertung.getLachenWeinen() + "," + bewertung.getFroehlichTraurig() + "," + bewertung.getLustigErnst() + 
	    		  "," + bewertung.getAltmodischModern() + "," + bewertung.getKreativUnkreativ() + "," + bewertung.getLiebenswertFies() +
	    		  "," + bewertung.getSympathischUnsympathisch() + "," + bewertung.getZielgruppe() + "," + bewertung.getBewertung() + ")";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  
	  
}

  /* ------------ User  stuff ------------ */
  
  public ArrayList<Admin> getUserList() throws Exception{
	  
	  ArrayList<Admin> userList= new ArrayList<Admin>();
	  try {
		
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "SELECT * FROM User";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      //iterate through the reultSet and create new Video objects, adding them to the videoList
	      while(resultSet.next()) {
	    	  Admin tempUser = new Admin(resultSet.getString("user_id"), resultSet.getString("user_name"), resultSet.getString("user_password"),
	    			  resultSet.getString("user_age"), resultSet.getString("user_gender"), resultSet.getString("user_admin"));
	    	  userList.add(tempUser);
	      }
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  return userList;
	  
  }
  
  public Admin getUserbyName(String username) throws Exception{
	  
	  Admin thing=null;
	  try {
		
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "SELECT " + username +" FROM User";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      //iterate through the reultSet and create new Video object
	      while(resultSet.next()) {
	    	  thing = new Admin(resultSet.getString("user_id"), resultSet.getString("user_name"), resultSet.getString("user_password"),
	    			  resultSet.getString("user_age"), resultSet.getString("user_gender"), resultSet.getString("user_admin"));
	    	  
	      }
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  return thing;
	  
  }
  
  public void removeUserbyName(String username) throws Exception{
	  
	  
	  try {
		
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "DELETE * FROM User WHERE user_name='" + username +"'";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  
	  
  }
  
  public void saveUser(Admin user) throws Exception{
	  
	  
	  try {
		
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "INSERT INTO User VALUES (" + user.getId() + "," + user.getUsername() + user.getPassword() + "," + user.getAge() + "," +
	    		  user.getGender() + "," + user.getAdmin() + ")";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
  }
  
  /* ------------ Comment stuff ------------ */
  
public void saveComment(Admin user, Video vid, String comment ) throws Exception{
	 
	String tempId;
	try {
		tempId = Integer.toString(getCommentList().size()+1);	
	}
	catch(Exception e){
		tempId = Integer.toString(1);
	}  
	
	  try {
		
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "INSERT INTO Comment VALUES (" + tempId + "," + user.getId() + vid.getId() + "," + comment +")";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
  }

public ArrayList<String> getCommentList() throws Exception{
	
	ArrayList<String> commentList= new ArrayList<String>();
	  try {
		
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      // Setup the connection with the DB
	      connect = DriverManager
	          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
	              + "user=a1200069&password=mz8UserStudy");
	      //set our SQL SELECT query
	      String query = "SELECT * FROM Comment";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      //iterate through the reultSet and create new Video objects, adding them to the videoList
	      while(resultSet.next()) {
	    	  commentList.add(resultSet.getString("comment_text"));
	      }
	    	
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  return commentList;

	
}
  
  

  // You need to close the resultSet
  private void close() {
    try {
      if (resultSet != null) {
        resultSet.close();
      }

      if (statement != null) {
        statement.close();
      }

      if (connect != null) {
        connect.close();
      }
    } catch (Exception e) {

    }
  }
  
}

