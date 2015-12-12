

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
	    			  resultSet.getString("vid_length"), resultSet.getString("vid_marke"), resultSet.getString("vid_kategorie"));
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
	    			  resultSet.getString("vid_length"), resultSet.getString("vid_marke"), resultSet.getString("vid_kategorie"));
	    	  
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
	    		  video.getMarke() + "," + video.getKategorie() +  ")";
	   
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
  /* ------------ User  stuff ------------ */
  /* ------------ Comment stuff ------------ */
  
  
  public void readDataBase() throws Exception {
    try {
      // This will load the MySQL driver, each DB has its own driver
      Class.forName("com.mysql.jdbc.Driver");
      // Setup the connection with the DB
      connect = DriverManager
          .getConnection("jdbc:mysql://a1200069.mysql.univie.ac.at/a1200069"
              + "user=a1200069&password=mz8UserStudy");

      // Statements allow to issue SQL queries to the database
      statement = connect.createStatement();
      // Result set get the result of the SQL query
      resultSet = statement
          .executeQuery("select * from a1200069.comments");
      writeResultSet(resultSet);

      // PreparedStatements can use variables and are more efficient
      preparedStatement = connect
          .prepareStatement("insert into  s1200069.comments values (default, ?, ?, ?, ? , ?, ?)");
      // "myuser, webpage, datum, summery, COMMENTS from feedback.comments");
      // Parameters start with 1
      preparedStatement.setString(1, "Test");
      preparedStatement.setString(2, "TestEmail");
      preparedStatement.setString(3, "TestWebpage");
      preparedStatement.setDate(4, new java.sql.Date(2009, 12, 11));
      preparedStatement.setString(5, "TestSummary");
      preparedStatement.setString(6, "TestComment");
      preparedStatement.executeUpdate();

      preparedStatement = connect
          .prepareStatement("SELECT myuser, webpage, datum, summery, COMMENTS from feedback.comments");
      resultSet = preparedStatement.executeQuery();
      writeResultSet(resultSet);

      // Remove again the insert comment
      preparedStatement = connect
      .prepareStatement("delete from feedback.comments where myuser= ? ; ");
      preparedStatement.setString(1, "Test");
      preparedStatement.executeUpdate();
      
      resultSet = statement
      .executeQuery("select * from feedback.comments");
      writeMetaData(resultSet);
      
    } catch (Exception e) {
      throw e;
    } finally {
      close();
    }

  }

  private void writeMetaData(ResultSet resultSet) throws SQLException {
    //   Now get some metadata from the database
    // Result set get the result of the SQL query
    
    System.out.println("The columns in the table are: ");
    
    System.out.println("Table: " + resultSet.getMetaData().getTableName(1));
    for  (int i = 1; i<= resultSet.getMetaData().getColumnCount(); i++){
      System.out.println("Column " +i  + " "+ resultSet.getMetaData().getColumnName(i));
    }
  }

  private void writeResultSet(ResultSet resultSet) throws SQLException {
    // ResultSet is initially before the first data set
    while (resultSet.next()) {
      // It is possible to get the columns via name
      // also possible to get the columns via the column number
      // which starts at 1
      // e.g. resultSet.getSTring(2);
      String user = resultSet.getString("myuser");
      String website = resultSet.getString("webpage");
      String summery = resultSet.getString("summery");
      Date date = resultSet.getDate("datum");
      String comment = resultSet.getString("comments");
      System.out.println("User: " + user);
      System.out.println("Website: " + website);
      System.out.println("Summery: " + summery);
      System.out.println("Date: " + date);
      System.out.println("Comment: " + comment);
    }
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