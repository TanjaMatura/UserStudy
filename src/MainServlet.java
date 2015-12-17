
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");  
		
		//Video wählen 
		if(action != null && action.equalsIgnoreCase("VideoWaehlen")){
			try { 
				//String url = getUrl(request.getParameter("videos"));
				String url = request.getParameter("videos");
				MySqlDAO tempDAO = new MySqlDAO();

				Video pick = tempDAO.getVideobyUrl(url);
				//update pickrate
				pick.addAnzahlAusgewaehlt();
				tempDAO.removeVideobyUrl(url);
				tempDAO.saveVideo(pick);

				request.getSession(true).setAttribute("VideoURL", url);
				request.getRequestDispatcher("bewertung.jsp").include(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			} 

		}
		
		// Bewertung
		if(action != null && action.equalsIgnoreCase("bewertung")){
			nbew = new Bewertung(tempUser.getId(), request.getParameter("videoURL"), request.getParameter("janein1"),  request.getParameter("janein3"),  request.getParameter("janein4"), request.getParameter("zutreffend2"),
					request.getParameter("zutreffend3"),  request.getParameter("zutreffend4"),  request.getParameter("janein2"), Integer.parseInt(request.getParameter("zutreffend1")), 
					Integer.parseInt(request.getParameter("empfinden1")),  Integer.parseInt(request.getParameter("empfinden2")),  Integer.parseInt(request.getParameter("empfinden3")),  Integer.parseInt(request.getParameter("empfinden4")),  Integer.parseInt(request.getParameter("empfinden5")),  Integer.parseInt(request.getParameter("empfinden6")), 
					request.getParameter("zielgruppe"),  Integer.parseInt(request.getParameter("gesamtbewertung")));				
			try {
					sDAO.saveBewertung(nbew);
					if(request.getParameter("kommentar")!=null){
						sDAO.saveComment(tempUser, sDAO.getVideobyUrl(request.getParameter("videoURL")), request.getParameter("kommentar"));
					}
				} 
			catch (Exception e) {
					response.getWriter().println(e);
				}
			request.getRequestDispatcher("danke.html").include(request, response);
			}
		
		
		// Teilnehmen
		if(action != null && action.equalsIgnoreCase("Teilnehmen")){	
			try {
				randomURLs();
				String alter = request.getParameter("alter"); 
				String geschlecht = request.getParameter("geschlecht"); 
				InetAddress inetadress = InetAddress.getLocalHost();
				String ip = inetadress.getHostAddress();
				if(sDAO.getUserbyID(ip)!=null){tempUser=sDAO.getUserbyID(ip); }
				else {
					tempUser = new Admin(ip, "anon", "none", alter, geschlecht, 0);
					sDAO.saveUser(tempUser);
				}
				
				//update availability on videos
				updateAvailability();
				
				request.getSession(true).setAttribute("VideoURL1", url1);
				request.getSession(true).setAttribute("VideoURL2", url2);
				request.getRequestDispatcher("auswahl.jsp").include(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// Nochmal
		if(action != null && action.equalsIgnoreCase("nochmal")){
			try {
				randomURLs();
				
				//update availability on videos
				updateAvailability();
				
				request.getSession(true).setAttribute("VideoURL1", url1);
				request.getSession(true).setAttribute("VideoURL2", url2);
				request.getRequestDispatcher("auswahl.jsp").include(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
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
	
	//zufällige videos
	protected void randomURLs() throws Exception {
		int max;
		ArrayList<Video> vidList = sDAO.getVideoList();
		max=vidList.size();
		Random randomGenerator = new Random();
		int rand1= randomGenerator.nextInt(max);
		if(rand1==0){
			rand1++;
		}
		int rand2=randomGenerator.nextInt(max);
		if(rand2==0 || rand2==rand1){
			rand2++;
		}
		//iterate through List
		for(int i=0; i<max;i++){
			if(Integer.parseInt(vidList.get(i).getId())==rand1){
				url1=vidList.get(i).getURL();
			}
			if(Integer.parseInt(vidList.get(i).getId())==rand2){
				url2=vidList.get(i).getURL();
			}
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

