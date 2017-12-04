package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QueryServlet
 */
@WebServlet("/QueryServlet")
public class QueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String[] type = {"单人间", "双人间", "商务间", "套间", "总统套房"};
	static int[] price = {0, 200, 500, 1000, 2000};
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QueryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int type_index = Integer.parseInt(request.getParameter("type"));
		int price_index = Integer.parseInt(request.getParameter("price"));
		String arrival_time = request.getParameter("arrive");
		String departure_time = request.getParameter("depart");
		String year = arrival_time.substring(0, 4);
		String month = arrival_time.substring(5, 7);
		String day = arrival_time.substring(8, 10);
		
	}

}
