package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RoomTypeDao;
import data.RoomType;

/**
 * Servlet implementation class RequirementServlet
 */
@WebServlet("/RequirementServlet")
public class RequirementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	static String[] type = {"单人间", "双人间", "商务间", "套间", "总统套房"};
	static int[] price = {0, 200, 500, 1000, 2000};
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RequirementServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		String type = request.getParameter("type");
		int price_index = Integer.parseInt(request.getParameter("price"));
		int price0, price1;
		if (price_index == 0) {
			price0 = 0;
			price1 = 2000;
		} else {
			price0 = price[price_index - 1] + 1;
			price1 = price[price_index];
		}
		String checkin = (String) session.getAttribute("checkin");
		String checkout = (String) session.getAttribute("checkout");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date checkin_date = null;
		Date checkout_date = null;
		try {
			checkin_date = sdf.parse(checkin);
			checkout_date = sdf.parse(checkout);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RoomTypeDao typedao = new RoomTypeDao();
		ArrayList<RoomType> roomtypesList;
		roomtypesList = typedao.selectByRequirement(type, price0, price1, checkin_date, checkout_date);
		if (roomtypesList != null) {
			session.setAttribute("typeList", roomtypesList);
			response.sendRedirect("displayroom.jsp");
		} else {
			request.setAttribute("queryErrorinfo", "NOT FOUND");
			RequestDispatcher rd = request.getRequestDispatcher("/displayroom.jsp");
			rd.forward(request, response);
		}
	}

}