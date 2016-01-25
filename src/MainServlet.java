import java.io.IOException;
import java.io.OutputStream;
import java.sql.DriverManager;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.general.AbstractDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.jdbc.JDBCPieDataset;
import org.jfree.data.xy.IntervalXYDataset;

import com.mysql.jdbc.Connection;
import com.sun.prism.BasicStroke;
import com.sun.prism.paint.Color;

import java.net.InetAddress;


/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MySqlDAO sDAO = new MySqlDAO();
	Admin tempUser = null; 
	Bewertung nbew = null; 
	String url1=null;
	String url2=null;
	String userId=null; 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");  
		
		/* ------------ Video wählen  ------------ */ 
		if(action != null && action.equalsIgnoreCase("VideoWaehlen")){
			try { 
				String url = request.getParameter("videos");
				Video pick = sDAO.getVideobyUrl(url);
				//update pickrate
				pick.addAnzahlAusgewaehlt();
				sDAO.removeVideobyUrl(url);
				sDAO.saveVideo(pick);

				request.getSession(true).setAttribute("VideoURL", url);
				request.getRequestDispatcher("bewertung.jsp").include(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
		/* ------------ Bewertung  ------------ */
		if(action != null && action.equalsIgnoreCase("bewertung")){
			// Bewertungs ID festlegen
			String tempId;
			try {
				tempId = Integer.toString(sDAO.getBewertungList().size()+1);	
			}
			catch(Exception e){
				tempId = Integer.toString(1);
			}  
			
			// Bewertung, Comment, Ansprechend speichern
			try { 
				nbew = new Bewertung(tempId, tempUser.getId(), request.getParameter("videoURL"), request.getParameter("janein1"),  request.getParameter("janein3"),  request.getParameter("janein4"), request.getParameter("zutreffend2"),
				request.getParameter("zutreffend3"),  request.getParameter("zutreffend4"),  request.getParameter("janein2"), Integer.parseInt(request.getParameter("zutreffend1")), 
				Integer.parseInt(request.getParameter("empfinden1")),  Integer.parseInt(request.getParameter("empfinden2")),  Integer.parseInt(request.getParameter("empfinden3")),  Integer.parseInt(request.getParameter("empfinden4")),  Integer.parseInt(request.getParameter("empfinden5")),  Integer.parseInt(request.getParameter("empfinden6")), 
				request.getParameter("zielgruppe"),  Integer.parseInt(request.getParameter("gesamtbewertung")));				
			
				sDAO.saveBewertung(nbew);
				if(!request.getParameter("kommentar").equals("")){
					sDAO.saveComment(tempUser, sDAO.getVideobyUrl(request.getParameter("videoURL")), request.getParameter("kommentar"));}
				sDAO.saveAnsprechend(nbew, sDAO.getVideobyUrl(request.getParameter("videoURL")), Integer.parseInt(request.getParameter("ansprech1")), Integer.parseInt(request.getParameter("ansprech2")), Integer.parseInt(request.getParameter("ansprech3")), Integer.parseInt(request.getParameter("ansprech4")));
			}catch (Exception e) {
				response.getWriter().println(e);
			}
			
			try {
			//Cookies (Brauch ich dann nicht mehr, nur inzwischen, solang ID angezeigt wird)
			String userId = null;
			Cookie[] cookies = request.getCookies();
			for(Cookie cookie : cookies){
			    if("cookieUserID".equals(cookie.getName())){
			        userId = cookie.getValue();
			    }
			}
				randomURLs(request,response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
			request.getRequestDispatcher("auswahl.html").include(request, response);
			}
		
		
		/* ------------ Teilnehmen  ------------ */
		if(action != null &&  action.equalsIgnoreCase("Teilnehmen")){	
			try {
				// Cookies durchgehen und schauen ob schon eines mit Namen userId vorhanden ist
				userId = null;
				Cookie[] cookies = request.getCookies();
				for(Cookie cookie : cookies){
				    if("cookieUserID".equals(cookie.getName())){
				        userId = cookie.getValue();
				    }
				}
				
				// Falls keines vorhanden ist auf "anmeldung" weiterleiten
				if(userId==null){
					request.getRequestDispatcher("anmeldung.jsp").include(request, response);
				}
				
				// Falls eines vorhanden ist, User mit dieser ID auslesen und zur Auswahl weiterleiten
				else{
					tempUser=sDAO.getUserbyID(userId);
					randomURLs(request, response);
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/* ------------ Anmelden  ------------ */
		if(action != null &&  action.equalsIgnoreCase("Anmelden")){	
			try {
			userId = null;
			boolean cookieVorhanden=false; 
			Cookie[] cookies = request.getCookies();
			
			// Checken ob Cookie da is
			for(Cookie Cookie : cookies){
			    if("cookieUserID".equals(Cookie.getName())){
			    	userId = Cookie.getValue();
			    	cookieVorhanden=true;
			    }
			}
			// Wenn keines da ist, Cookie anlegen
			if(!cookieVorhanden){ 
				userId = Integer.toString(sDAO.getUserList().size()+1);
				Cookie cookie = new Cookie("cookieUserID", userId);
				cookie.setMaxAge(60*60*24*365*10);
				response.addCookie(cookie);
			}
			
			// Neuen User speichern
			String alter = request.getParameter("alter"); 
			String geschlecht = request.getParameter("geschlecht"); 
			tempUser = new Admin(userId, "anon", "none", alter, geschlecht, 0);
			sDAO.saveUser(tempUser);

			// Zufällige Videos für Auswahl-Seite generieren
			randomURLs(request, response); 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/* ------------ Nochmal  ------------ */
		if(action != null && action.equalsIgnoreCase("nochmal")){
			/*try {
				//Cookies (Brauch ich dann nicht mehr, nur inzwischen, solang ID angezeigt wird)
				String userId = null;
				Cookie[] cookies = request.getCookies();
				for(Cookie cookie : cookies){
				    if("cookieUserID".equals(cookie.getName())){
				        userId = cookie.getValue();
				    }
				}
				randomURLs(request,response); 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
		}
		
		/* ------------ Auswertung Bewertung ------------ */
		if(action != null && action.equalsIgnoreCase("AuswertungBewertung")){
			ArrayList<Video> videoList;
			try {
				videoList = sDAO.getVideoList();
				
				// Objekte mit Durchschnittsbewertung und URL erzeugen, in Liste speichern
				ArrayList<RankedVideo> rankedVideoList = new ArrayList<RankedVideo>();
				for (int i = 0; i < videoList.size(); i++) {
					String tempURL = videoList.get(i).getURL();
					RankedVideo tempRVideo = new RankedVideo(tempURL, sDAO.getDurchschnittsBewertung(tempURL), sDAO.getVideobyUrl(tempURL).getMarke(), sDAO.getPickr(tempURL)); 
					rankedVideoList.add(tempRVideo); 
				}
				
				// List nach Durchschnitsbewertung sortieren
				Collections.sort(rankedVideoList, new SortDBewertung());
				Collections.reverse(rankedVideoList);
				
				// Alle 50 Video beim request mitübergeben
					// Hab leider noch keine umkomplizierteren Weg gefunden :/
				for(int i=0; i < rankedVideoList.size(); i++){
					request.getSession(true).setAttribute("bewertung" + i, rankedVideoList.get(i).getDBewertung());
					request.getSession(true).setAttribute("marke" + i, rankedVideoList.get(i).getMarke());
					request.getSession(true).setAttribute("url" + i, rankedVideoList.get(i).getURL());

				}
				
				request.getRequestDispatcher("auswertungBewertung.jsp").include(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/* ------------ Auswertung Pickrate ------------ */
		if(action != null && action.equalsIgnoreCase("AuswertungPickrate")){
			ArrayList<Video> videoList;
			try {
				videoList = sDAO.getVideoList();
				
				// Objekte mit Durchschnittsbewertung und URL erzeugen, in Liste speichern
				ArrayList<RankedVideo> rankedVideoList = new ArrayList<RankedVideo>();
				for (int i = 0; i < videoList.size(); i++) {
					String tempURL = videoList.get(i).getURL();
					RankedVideo tempRVideo = new RankedVideo(tempURL, sDAO.getDurchschnittsBewertung(tempURL), sDAO.getVideobyUrl(tempURL).getMarke(), sDAO.getPickr(tempURL)); 
					rankedVideoList.add(tempRVideo); 
				}

				Collections.sort(rankedVideoList, new SortPickrate());
				Collections.reverse(rankedVideoList);
				
				DecimalFormat f = new DecimalFormat("#0.00"); 
				
				for(int i=0; i < rankedVideoList.size(); i++){
					String pickrate = f.format(rankedVideoList.get(i).getPickrate()*100); 
					request.getSession(true).setAttribute("Pickrate" + i, pickrate);
					request.getSession(true).setAttribute("markePickrate" + i, rankedVideoList.get(i).getMarke());
					request.getSession(true).setAttribute("urlPickrate" + i, rankedVideoList.get(i).getURL());

				}
				request.getRequestDispatcher("auswertungPickrate.jsp").include(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/* ------------ EinzelAuswertung  ------------ */
		if(action != null && action.equalsIgnoreCase("EinzelAuswertung")){
			try {
			String url = request.getParameter("link"); 
			Video vid = sDAO.getVideobyUrl(url);
			
			sDAO.createBarChart(request, response); 
			
			request.getSession(true).setAttribute("URL", url); 
			request.getSession(true).setAttribute("marke",vid.getMarke());
			
			request.getRequestDispatcher("auswertungEinzeln.jsp").include(request, response);
			
			}catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
		
	}
	
	
	
	/* ------------ Database stuff  ------------ */
	protected String getUrl(String vid_id) throws Exception{
		String finalurl="";
		MySqlDAO testDAO = new MySqlDAO();
		ArrayList<Video> vidList = testDAO.getVideoList();
		for(int i=0; i < vidList.size();i++){
			if(vidList.get(i).getId() == vid_id){
				finalurl = vidList.get(i).getURL();
			}
		}
		return finalurl;
	}
	
	
	/* ------------ zufällige Videos  ------------ */
	protected void randomURLs(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// Generiert Liste mit Videos, die der Nutzer noch nicht bewertet hat
		ArrayList<Video> vidList = sDAO.getVideoListByUser(userId);
		int max=vidList.size();
		
		//Anzahl der Videos, die ein User schon bewertet hat
		int bewertet = 50-max; 
		Random randomGenerator = new Random();
		
		// Falls es noch mindestens zwei Videos gibt
		if(max>1){
			int rand1= randomGenerator.nextInt(max);	
			int rand2=randomGenerator.nextInt(max);
			while(rand2==rand1){rand2=randomGenerator.nextInt(max);}
			url1=vidList.get(rand1).getURL();
			url2=vidList.get(rand2).getURL();
			int prozent = bewertet*2; 
			updateAvailability();
			
			request.getSession(true).setAttribute("VideoURL1", url1);
			request.getSession(true).setAttribute("VideoURL2", url2);
			request.getSession(true).setAttribute("userID", userId);
			request.getSession(true).setAttribute("Prozent", prozent);
			request.getSession(true).setAttribute("bewerteteVideos", bewertet);
			request.getRequestDispatcher("auswahl.jsp").include(request, response);
		}
		
		// Wenn es nur noch ein Video gibt
		else if(max==1){
			int rand1= randomGenerator.nextInt(max);
			url1=vidList.get(rand1).getURL();
			request.getSession(true).setAttribute("VideoURL", url1);
			request.getRequestDispatcher("bewertung.jsp").include(request, response);
		}
		// Wenn es kein Video mehr gibt
		else{
			request.getRequestDispatcher("auswertung.jsp").include(request, response);
		}
	}
	
	
	protected void updateAvailability() throws Exception {
		Video av1 = sDAO.getVideobyUrl(url1);
	    Video av2 = sDAO.getVideobyUrl(url2);
		av1.addAnzahlAngeboten();
		av2.addAnzahlAngeboten();
		sDAO.removeVideobyUrl(url1);
		sDAO.saveVideo(av1);
		sDAO.removeVideobyUrl(url2);
		sDAO.saveVideo(av2);
	}
	
	
}

