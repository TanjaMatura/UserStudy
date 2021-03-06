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
		
		/* ------------ Video w�hlen  ------------ */ 
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

			// Zuf�llige Videos f�r Auswahl-Seite generieren
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
				
				// Alle 50 Video beim request mit�bergeben
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
			ArrayList<Bewertung> bewListTemp = sDAO.getBewertungList();
			ArrayList<Bewertung> bewList = new ArrayList<Bewertung>();
			for(int i=0; i< bewListTemp.size();i++){
				if(bewListTemp.get(i).geturl() == url){
					bewList.add(bewListTemp.get(i));
				}
			}
			ArrayList<Double> ansprechList = sDAO.getAnsprechendByb_id(url);
			int gesehenGes =0;
			int gesehenCounter=0;
			int plottwistGes=0;
			int markeGes=0;
			int catchPhraseGes=0;
			int produkt=0;
			int gerngesehen=0;
			int quali=0;
			int trauernst=0;
			int ernstlu=0;
			int modernu=0;
			int orig=0;
			int lieb=0;
			int sym=0;
			int bewGes=0;
			String zielgruppenString="";
			for(int i=0; i< bewList.size();i++){
				if(bewList.get(i).getSchonGesehen().equals("ja")){
				gesehenGes ++;
				}
				if(bewList.get(i).getMarkeBekannt().equals("ja")){
					markeGes ++;
				}
				if(bewList.get(i).getPlotTwist().equals("ja")){
					plottwistGes ++;
				}
				if(bewList.get(i).getCatchPhrase().equals("ja")){
					plottwistGes ++;
				}
				if(bewList.get(i).getZielgruppe() != "null"){
					if(!zielgruppenString.contains(bewList.get(i).getZielgruppe())){
						if(zielgruppenString != ""){
							zielgruppenString += ", ";
						}
						zielgruppenString += bewList.get(i).getZielgruppe();
					}
				}
				produkt +=bewList.get(i).getProduktfixierung();
				gesehenCounter++;
				gerngesehen += Integer.parseInt(bewList.get(i).getGernGesehen());
				quali += Integer.parseInt(bewList.get(i).getUeberzeugung());
				trauernst += bewList.get(i).getFroehlichTraurig();
				ernstlu += bewList.get(i).getLustigErnst();
				modernu += bewList.get(i).getAltmodischModern();
				orig += bewList.get(i).getKreativUnkreativ();
				lieb += bewList.get(i).getLiebenswertFies();
				sym += bewList.get(i).getSympathischUnsympathisch();
				bewGes += bewList.get(i).getBewertung();
				
			}
			
			if (gesehenCounter == 0){gesehenCounter = 1;}
			double gesehenProz = gesehenGes/gesehenCounter;
			double markeProz = markeGes/gesehenCounter;
			double plottwistProz =plottwistGes/gesehenCounter;
			double catchPhraseProz = catchPhraseGes /gesehenCounter;
			double zutreffend1Mw = produkt/gesehenCounter;
			double zutreffend2Mw = gerngesehen/gesehenCounter;
			double zutreffend3Mw = quali/gesehenCounter;
			double zutreffend4Mw = quali/gesehenCounter;
			double ansprech1Mw = ansprechList.get(0);
			double ansprech2Mw = ansprechList.get(1);
			double ansprech3Mw = ansprechList.get(2);
			double ansprech4Mw = ansprechList.get(3);
			double empfinden1Mw = trauernst/gesehenCounter;
			double empfinden2Mw = ernstlu/gesehenCounter;
			double empfinden3Mw = modernu/gesehenCounter;
			double empfinden4Mw = orig/gesehenCounter;
			double empfinden5Mw = lieb/gesehenCounter;
			double empfinden6Mw = sym/gesehenCounter;
			double gesamtBewMw = bewGes/gesehenCounter;
			request.getSession(true).setAttribute("URL", url); 
			request.getSession(true).setAttribute("zielgruppenString", zielgruppenString);
			request.getSession(true).setAttribute("gesehenProz",gesehenProz);
			request.getSession(true).setAttribute("markeProz",markeProz);
			request.getSession(true).setAttribute("plottwistProz",plottwistProz);
			request.getSession(true).setAttribute("catchPhraseProz",catchPhraseProz);
			request.getSession(true).setAttribute("zutreffend1Mw",zutreffend1Mw);
			request.getSession(true).setAttribute("zutreffend2Mw",zutreffend2Mw);
			request.getSession(true).setAttribute("zutreffend3Mw",zutreffend3Mw);
			request.getSession(true).setAttribute("zutreffend4Mw",zutreffend4Mw);
			request.getSession(true).setAttribute("ansprech1Mw",ansprech1Mw);
			request.getSession(true).setAttribute("ansprech2Mw",ansprech2Mw);
			request.getSession(true).setAttribute("ansprech3Mw",ansprech3Mw);
			request.getSession(true).setAttribute("ansprech4Mw",ansprech4Mw);
			request.getSession(true).setAttribute("empfinden1Mw",empfinden1Mw);
			request.getSession(true).setAttribute("empfinden2Mw",empfinden2Mw);
			request.getSession(true).setAttribute("empfinden3Mw",empfinden3Mw);
			request.getSession(true).setAttribute("empfinden4Mw",empfinden4Mw);
			request.getSession(true).setAttribute("empfinden5Mw",empfinden5Mw);
			request.getSession(true).setAttribute("empfinden6Mw",empfinden6Mw);
			request.getSession(true).setAttribute("gesamtBewMw",gesamtBewMw);
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
	
	
	/* ------------ zuf�llige Videos  ------------ */
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

