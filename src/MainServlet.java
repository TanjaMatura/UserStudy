
import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MainServlet
 */
@WebServlet("/MainServlet")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
		MySqlDAO sDAO = new MySqlDAO();
		String action = request.getParameter("action");  
		
		//Video wählen 
		if(action != null && action.equalsIgnoreCase("VideoWaehlen")){
			//response.sendRedirect(request.getContextPath() + "/bewertung.jsp");
			try {
				//String url = getUrl(request.getParameter("videos"));
				String url = request.getParameter("videos");
				request.getSession(true).setAttribute("VideoURL", url);
				request.getRequestDispatcher("bewertung.jsp").include(request, response);
				
				// Auslese in jsp: out.println(request.getSession().getAttribute("VideoURL"));
			} catch (Exception e) {
				e.printStackTrace();
			} 

			//System.out.println(request.getParameter("videos")); 
			//response.getWriter().println("Hello");
		}
		
		// Bewertung
		if(action != null && action.equalsIgnoreCase("bewertung")){
			response.getWriter().println("Start Kreation Bewertugn Objekt");
			
			// Schau mal wegen dem ^^
			Bewertung nbew = new Bewertung("id", request.getParameter("videoURL"), request.getParameter("janein1"),  request.getParameter("janein3"),  request.getParameter("janein4"), request.getParameter("zutreffend2"),
					request.getParameter("zutreffend3"),  request.getParameter("zutreffend4"),  request.getParameter("janein2"), Integer.parseInt(request.getParameter("zutreffend1")), 
					Integer.parseInt(request.getParameter("empfinden1")),  Integer.parseInt(request.getParameter("empfinden2")),  Integer.parseInt(request.getParameter("empfinden3")),  Integer.parseInt(request.getParameter("empfinden4")),  Integer.parseInt(request.getParameter("empfinden5")),  Integer.parseInt(request.getParameter("empfinden6")), 
					request.getParameter("zielgruppe"),  Integer.parseInt(request.getParameter("bewertungen")));
			
			//System.out.println(request.getParameter("videoURL"));
			
			try {
					response.getWriter().println("Start saveBewertung(nbew)");
					sDAO.saveBewertung(nbew);
				} 
			catch (Exception e) {
					response.getWriter().println(e);
				}
			}
		
		//zufällige videos
		if(action != null && action.equalsIgnoreCase("Teilnehmen")){
			//response.sendRedirect(request.getContextPath() + "/bewertung.jsp");
			//generere die beidne zufallsurls
		try {
			String url1=null;
			String url2=null;
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
			request.getSession(true).setAttribute("VideoURL1", url1);
			request.getSession(true).setAttribute("VideoURL2", url2);
			request.getRequestDispatcher("index.jsp").include(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		
	   
	}
	
	/* ------------ Database stuff  ------------ */
	protected String getUrl(String vid_id) throws Exception{
		//vid_id="1";
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
	
	

}

