
import java.io.IOException;
import java.util.ArrayList;

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
		// TODO Auto-generated method stub
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
		response.getWriter().println("Start Kreation Bewertugn Objekt");

		//Bewertung nbew = new Bewertung("keks", "keks", 0, 0, 0, 0, 0, 0, 0, 0, "keks", 0);
		Bewertung nbew = new Bewertung("1", "/watchkekse",  Integer.parseInt(request.getParameter("zutreffend1")), Integer.parseInt(request.getParameter("zutreffend2")), 
				Integer.parseInt(request.getParameter("zutreffend3")), Integer.parseInt(request.getParameter("zutreffend4")), Integer.parseInt(request.getParameter("empfinden1")), Integer.parseInt(request.getParameter("empfinden2")), Integer.parseInt(request.getParameter("empfinden3")), Integer.parseInt(request.getParameter("empfinden4")), 
				request.getParameter("zielgruppe"), Integer.parseInt(request.getParameter("gesamtbewertung")));

		

		try {
			response.getWriter().println("Start saveBewertung(nbew)");
			sDAO.saveBewertung(nbew);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			response.getWriter().println(e);
		}
		response.getWriter().println("Hello");
	}
	
	/* ------------ Database stuff  ------------ */
	protected String GetUrl( String vid_id) throws Exception{
		vid_id="1";
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

