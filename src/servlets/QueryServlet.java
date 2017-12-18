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
//	static String[] type = {"单人间", "双人间", "商务间", "套间", "总统套房"};
//	static int[] price = {0, 200, 500, 1000, 2000};
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
		String reserveBtn = request.getParameter("reserveBtn");
		if (reserveBtn != null) {
			request.getParameter("type");
			return;
		}
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date checkin_date = null;
		Date checkout_date = null;
		try {
			checkin_date = sdf.parse(checkin);
			checkout_date = sdf.parse(checkout);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession(true);
		RoomTypeDao typedao = new RoomTypeDao();
		RoomDao dao = new RoomDao();
		ArrayList<Room> roomList = new ArrayList<Room>();
		roomList = dao.selectByTime(checkin_date, checkout_date);
		LinkedHashMap<String, Integer> roomMap = new LinkedHashMap<String, Integer>();
		ArrayList<String> typeList;
		if (roomList != null) {
			for (Room r:roomList) {
				roomMap.put(r.getType(), typedao.getPrice(r.getType()));
			}
			typeList = new ArrayList<String>(roomMap.keySet());
			session.setAttribute("roomMap", roomMap);
			session.setAttribute("typeList", typeList);
			response.sendRedirect("displayroom.jsp");
		} else {
			request.setAttribute("queryErrorinfo", "NOT FOUND");
			RequestDispatcher rd = request.getRequestDispatcher("/main.jsp");
			rd.forward(request, response);
		}
		
	}
}
