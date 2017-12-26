package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RoomDao;
import dao.RoomTypeDao;
import data.*;

/**
 * Servlet implementation class QueryServlet
 */
@WebServlet("/QueryServlet")
public class QueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
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
		if (checkin_date.after(checkout_date)) {
			
		}
		session.setAttribute("checkin", checkin);
		session.setAttribute("checkout", checkout);
		RoomTypeDao typedao = new RoomTypeDao();
		ArrayList<RoomType> roomtypesList;
		roomtypesList = typedao.selectByTime(checkin_date, checkout_date);
		if (roomtypesList != null) {
			session.setAttribute("typeList", roomtypesList);
			response.sendRedirect("web/user/displayroom.jsp");
		} else {
			request.setAttribute("queryErrorinfo", "NOT FOUND");
			RequestDispatcher rd = request.getRequestDispatcher("/web/user/main.jsp");
			rd.forward(request, response);
		}
		
	}
}
