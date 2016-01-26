import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.jdbc.JDBCCategoryDataset;

import com.sun.prism.paint.Color;

public class MySqlDAO {
  private Connection connect = null;
  private Statement statement = null;
  private PreparedStatement preparedStatement = null;
  private ResultSet resultSet = null;
  
  //connection
  public void connect(){
	  try {
			
		  // This will load the MySQL driver, each DB has its own driver
	      Class.forName("com.mysql.jdbc.Driver");
	      System.out.println("Driver found.");
	} catch (Exception e) {
		System.out.println("Driver not found.");
	}
	try {
	      // Setup the connection with the DB
	      connect = DriverManager.getConnection("jdbc:mysql://mysql5.univie.ac.at/a1200069", "a1200069", "mz8UserStudy");
	      //set our SQL SELECT query
	      
	      System.out.println("Connectione stablished");
	} catch (Exception e) {
		System.out.println( e + "Connection not stablished");
	}
	
}
  
  /* ------------ Video stuff  ------------ */

  public ArrayList<Video> getVideoList() throws Exception{
	  
	  ArrayList<Video> videoList= new ArrayList<Video>();
	  try {
		
		  connect();
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
  
  // Gibt eine Liste mit allen Videos zurück, die ein User noch NICHT bewertet hat
  public ArrayList<Video> getVideoListByUser(String userId) throws Exception{
	  ArrayList<Video> videoList= new ArrayList<Video>();
	  
	  try {	
		  connect();
	      //set our SQL SELECT query
	      String query = "SELECT * FROM Video WHERE vid_url NOT IN (SELECT vid_url FROM Bewertung NATURAL JOIN Video WHERE b_uid =" + userId +")";
	   
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
		
		  connect();
	      //set our SQL SELECT query
	      String query = "SELECT * FROM Video WHERE vid_url='" + url + "'";
	   
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
		  connect();
	      String query = "DELETE FROM Video WHERE vid_url='" + url +"'";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      statement.executeUpdate(query);
	      
	      
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  
	  
  }
  
  public void saveVideo(Video video) throws Exception{
	    
	  try {
		
		  connect();
	      //set our SQL SELECT query
	      String query = "INSERT INTO Video VALUES ('" + video.getId() + "','" + video.getURL() + "','"  + video.getName() + "','" + video.getLength() + "','" +
	    		  video.getMarke() + "','" + video.getKategorie() + "',"+ video.getAnzahlAusgewaehlt() + "," + video.getAnzahlAngeboten() +  ")";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      statement.executeUpdate(query);
	      
	      
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
		  connect();
	      //set our SQL SELECT query
	      String query = "SELECT * FROM Bewertung";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      //iterate through the reultSet and create new Video objects, adding them to the videoList
	      while(resultSet.next()) {
	    	  Bewertung tempbew = new Bewertung(resultSet.getString("b_id"), resultSet.getString("b_uid"), resultSet.getString("vid_url"),
	    			  resultSet.getString("schongesehen"),resultSet.getString("plottwist"),resultSet.getString("catchphrase"),
	    			  resultSet.getString("gerngesehen"), resultSet.getString("ueberzeugung"), resultSet.getString("aufmerksamkeit"),resultSet.getString("markebekannt"),
	    			  resultSet.getInt("produktfixierung"), resultSet.getInt("froehlichtraurig"), resultSet.getInt("lustigernst"),
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
		
		  connect();
	      //set our SQL SELECT query
	      String query = "DELETE * FROM Bewertung WHERE b_id='" + id +"'";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      statement.executeUpdate(query);
	      
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  
	  
}

public void saveBewertung(Bewertung bewertung) throws Exception{
    
	
		//System.out.println("using connect()");
		connect();
		
		//____________________________________________________________________________
			  // This will load the MySQL driver, each DB has its own driver
		      
		
		
		try {

	      String query = "INSERT INTO Bewertung VALUES ('" + bewertung.getID() + "','" + bewertung.getUid() + "','" + bewertung.geturl() + "','" + bewertung.getSchonGesehen() + "','" + bewertung.getPlotTwist() + "','" +
	    		  bewertung.getCatchPhrase() + "','" + bewertung.getGernGesehen() + "','" + bewertung.getUeberzeugung() +  
	    		  "','" + bewertung.getAufmerksamkeit() + "','" + bewertung.getMarkeBekannt() + "'," + bewertung.getProduktfixierung() +
	    		  "," + bewertung.getLachenWeinen() + "," + bewertung.getFroehlichTraurig() + "," + bewertung.getLustigErnst() + 
	    		  "," + bewertung.getAltmodischModern() + "," + bewertung.getKreativUnkreativ() + "," + bewertung.getLiebenswertFies() +
	    		  "," + bewertung.getSympathischUnsympathisch() + ",'" + bewertung.getZielgruppe() + "'," + bewertung.getBewertung() + ")";
	   
	      // create the java statement
	      statement = connect.createStatement();
	      System.out.println(query);
		  //execute query
	      statement.executeUpdate(query);
	      
	      
	  }catch (Exception e) {
	      e.printStackTrace();
	    } finally {
	      close();
	    }
	  
	  
}

  /* ------------ User  stuff ------------ */
  
  public ArrayList<Admin> getUserList() throws Exception{
	  
	  ArrayList<Admin> userList= new ArrayList<Admin>();
	  try {
		
		  connect();
	      //set our SQL SELECT query
	      String query = "SELECT * FROM User";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      //iterate through the reultSet and create new Video objects, adding them to the videoList
	      while(resultSet.next()) {
	    	  Admin tempUser = new Admin(resultSet.getString("user_id"), resultSet.getString("user_name"), resultSet.getString("user_password"),
	    			  resultSet.getString("user_age"), resultSet.getString("user_gender"), Integer.parseInt(resultSet.getString("user_admin")));

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
		
		  connect();
	      //set our SQL SELECT query
	      String query = "SELECT * FROM User WHERE user_name='" + username + "'";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      //iterate through the reultSet and create new Video object
	      while(resultSet.next()) {
	    	  thing = new Admin(resultSet.getString("user_id"), resultSet.getString("user_name"), resultSet.getString("user_password"),
	    			  resultSet.getString("user_age"), resultSet.getString("user_gender"), Integer.parseInt(resultSet.getString("user_admin")));
	    	  
	      }
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  return thing;
	  
  }
  
 public Admin getUserbyID(String id) throws Exception{
	  
	  Admin thing=null;
	  try {
		
		  connect();
	      //set our SQL SELECT query
	      String query = "SELECT * FROM User WHERE user_id='" + id + "'";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      //iterate through the reultSet and create new Video object
	      while(resultSet.next()) {
	    	  thing = new Admin(resultSet.getString("user_id"), resultSet.getString("user_name"), resultSet.getString("user_password"),
	    			  resultSet.getString("user_age"), resultSet.getString("user_gender"), Integer.parseInt(resultSet.getString("user_admin")));
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
		
		  connect();
	      //set our SQL SELECT query
	      String query = "DELETE * FROM User WHERE user_name='" + username +"'";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      statement.executeUpdate(query);
	      
	      
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  
	  
  }
  
  public void saveUser(Admin user) throws Exception{
	  try {
		
		  connect();
	      //set our SQL SELECT query
	      String query = "INSERT INTO User VALUES ('" + user.getId() + "','" + user.getUsername() + "','" + user.getPassword() + "'," + user.getAge() + ",'" +
	    		  user.getGender() + "'," + user.getAdmin() + ")";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      statement.executeUpdate(query);
	      
	      
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
		
		  connect();
	      //set our SQL SELECT query
	      String query = "INSERT INTO Comment VALUES ('" + tempId + "','" + user.getId() + "','"+ vid.getId() + "','" + comment +"')";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      statement.executeUpdate(query);
	      
	      
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
  }

public ArrayList<String> getCommentList() throws Exception{
	
	ArrayList<String> commentList= new ArrayList<String>();
	  try {
		
		  connect();
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
  
/* ------------ Ansprechend stuff ------------ */

public void saveAnsprechend(Bewertung bew, Video vid, int visuell, int auditiv, int inhalt, int story ) throws Exception{
	 
	String tempId;
	try {
		tempId = Integer.toString(getAnsprechendList().size()+1);	
	}
	catch(Exception e){
		tempId = Integer.toString(1);
	}  
	
	  try {
		
		  connect();
	      //set our SQL SELECT query
	      String query = "INSERT INTO Ansprechend VALUES ('" + tempId + "','" + bew.getID() + "','"+ vid.getURL() + "'," + 
	      visuell + "," + inhalt + "," + auditiv + "," + story +")";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      statement.executeUpdate(query);
	      
	      
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
  }

public ArrayList<String> getAnsprechendList() throws Exception{
	
	ArrayList<String> AnsprechendList= new ArrayList<String>();
	  try {
		
		  connect();
	      //set our SQL SELECT query
	      String query = "SELECT * FROM Ansprechend";
	   
	      // create the java statement
	      statement = connect.createStatement();

		  //execute query and get java resultSet
	      resultSet = statement.executeQuery(query);
	      
	      //iterate through the reultSet and create new Video objects, adding them to the videoList
	      while(resultSet.next()) {
	    	  AnsprechendList.add(resultSet.getString("a_id"));
	      }
	    	
	  }catch (Exception e) {
	      throw e;
	    } finally {
	      close();
	    }
	  return AnsprechendList;

	
}

//Ansprechend
public ArrayList<Double> getAnsprechendByb_id(String bewertungsID) throws Exception{


connect();
   String query = "SELECT * FROM Ansprechend WHERE v_url ='" + bewertungsID + "'";
   statement = connect.createStatement();
   resultSet = statement.executeQuery(query);
   
   double visuell = 0; 
   double auditiv = 0; 
   double inhalt = 0; 
   double story = 0; 
   double counter = 0; 
   
   while(resultSet.next()) {
    visuell += Double.parseDouble(resultSet.getString("a_visuell")); 
    inhalt += Double.parseDouble(resultSet.getString("a_inhalt")); 
    auditiv += Double.parseDouble(resultSet.getString("a_auditiv")); 
    story += Double.parseDouble(resultSet.getString("a_story")); 
    counter ++;
  }
  
  visuell = visuell/counter; 
  auditiv = auditiv/counter; 
  inhalt = inhalt/counter; 
  story = story/counter; 
  
ArrayList<Double> ansprechend = new ArrayList<Double>(); 
ansprechend.add(visuell); 
ansprechend.add(auditiv); 
ansprechend.add(inhalt); 
ansprechend.add(story); 

close();
return ansprechend; 
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
  
  /* ------------ METHODEN FÜR STATISTIK ------------ */
  
  // Durchschnittsbewertung eines Videos
  public double getDurchschnittsBewertung(String videoURL) throws Exception{
	  ArrayList<Video> videoList = getVideoList(); 
	  double bewertung = 0; 
	  double counter = 0; 
	  
	  connect();
      String query = "SELECT * FROM Bewertung WHERE vid_url ='" + videoURL + "'";
      statement = connect.createStatement();
      resultSet = statement.executeQuery(query);

      while(resultSet.next()) {
    	  bewertung += Integer.parseInt(resultSet.getString("bewertungen"));
    	  counter++;
      }
      // Um Division durch 0 zu verhinderns
      if(counter==0){ return -1; }
      
      return bewertung/counter; 
  }
  
  // Pickrate eines Videos
  public double getPickr(String videoURL) throws Exception{
	  double av = 0; 
	  double picked = 0; 
	  connect();
      String query = "SELECT * FROM Video WHERE vid_url ='" + videoURL + "'";
      statement = connect.createStatement();
      resultSet = statement.executeQuery(query);
      
      while(resultSet.next()) {
		   av = Integer.parseInt(resultSet.getString("vid_pickavailable")); 
		   picked = Integer.parseInt(resultSet.getString("vid_pickcount")); 
      }
	  
      // Um Division durch 0 zu verhinderns
      if(picked==0){ return -1; }
      
      return picked/av; 
  }
  
  /* ------------ Diagramm erstellen  ------------ */
	
	protected void createBarChart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = (Connection) DriverManager.getConnection("jdbc:mysql://mysql5.univie.ac.at/a1200069", "a1200069", "mz8UserStudy");
	      
		final String SQL = "SELECT b_id, gerngesehen FROM Bewertung WHERE vid_url='w25oWpkK6OI'";
        final CategoryDataset dataset = new JDBCCategoryDataset(connection, SQL);
         JFreeChart chart = ChartFactory.createBarChart("Report","X-Axis","Y-Axis", dataset, PlotOrientation.VERTICAL, false, false, false);
        CategoryPlot catplot = chart.getCategoryPlot();
        /*chart.setBorderPaint(Color.BLACK);
		chart.setBorderStroke(new BasicStroke(10.0f));
		chart.setBorderVisible(true);*/
		if (chart != null) {
			int width = 500;
			int height = 350;
			final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			response.setContentType("image/png");
			OutputStream out=response.getOutputStream();
			ChartUtilities.writeChartAsPNG(out, chart, width, height,info);
		}
        
		/*AbstractDataset dataset = new AbstractDataset(connection);
		dataset.executeQuery("Select vid_pickcount,vid_pickavailable From Video order by vid_pickcount");
		final JFreeChart chart = ChartFactory.createXYBarChart("Mein Diagram","X",true, "Y",dataset,PlotOrientation.VERTICAL,true,false,false);
		
		chart.setBorderPaint(Color.BLACK);
		chart.setBorderStroke(new BasicStroke(10.0f));
		chart.setBorderVisible(true);
		if (chart != null) {
			int width = 500;
			int height = 350;
			final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			response.setContentType("image/png");
			OutputStream out=response.getOutputStream();
			ChartUtilities.writeChartAsPNG(out, chart, width, height,info);
		}
	}
  
	protected void createPieChart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = (Connection) DriverManager.getConnection("jdbc:mysql://mysql5.univie.ac.at/a1200069", "a1200069", "mz8UserStudy");
	      
		// Automatisch
		// Geht hier nicht, weil die Werte keine Zahlen sind
		/*JDBCPieDataset dataset = new JDBCPieDataset(connection);
		dataset.executeQuery("Select schongesehen,vid_url From Bewertung where vid_url='VmQl6dTj6Gk'");
		JFreeChart chart = ChartFactory.createPieChart("Mein Diagram", dataset, true, true, false);*/
		
		// So Händisch
		/*DefaultPieDataset dataset = new DefaultPieDataset();
	      dataset.setValue("Ja", new Double(43.2));
	      dataset.setValue("Nein", new Double(10.0));
	      dataset.setValue("NA", new Double(27.5));  
	      
	      JFreeChart chart = ChartFactory.createPieChart(
	              "Pie Chart Demo 1",  // chart title
	              dataset,             // data
	              true,                // include legend
	              true,
	              false
	          );

		chart.setBorderPaint(Color.BLACK);
		chart.setBorderStroke(new BasicStroke(10.0f));
		chart.setBorderVisible(true);
		if (chart != null) {
			int width = 500;
			int height = 350;
			final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
			response.setContentType("image/png");
			OutputStream out=response.getOutputStream();
			ChartUtilities.writeChartAsPNG(out, chart, width, height, info);
		}*/
	
	}
}

