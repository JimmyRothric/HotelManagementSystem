package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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

import dao.RoomDao;
import data.*;

/**
 * Servlet implementation class QueryServlet
 */
@WebServlet("/QueryServlet")
public class QueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	static String[] type = {"单人间", "双人间", "商务间", "套间", "总统套房"};
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		int price_index = Integer.parseInt(request.getParameter("price"));
//		String arrival_time = request.getParameter("arrive");
//		String departure_time = request.getParameter("depart");
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
//		Date arrival_date = null;
//		Date departure_date = null;
//		try {
//			arrival_date = sdf.parse(arrival_time);
//			departure_date = sdf.parse(departure_time);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		if (arrival_date.after(departure_date)) {
//			/*
//			 * 处理 用户输入的到达时间比离开时间晚 的情况
//			 */
//		}
//		int days = calDays(arrival_date, departure_date);
		
		HttpSession session = request.getSession(true);
		RoomDao dao = new RoomDao();
		ArrayList<Room> roomList = new ArrayList<Room>();
		roomList = dao.selectByCondition(type, price[price_index], price[price_index + 1]);
		if (roomList != null) {
			session.setAttribute("roomList", roomList);
		} else {
			request.setAttribute("queryErrorinfo", "NOT FOUND");
			RequestDispatcher rd = request.getRequestDispatcher("/main.jsp");
			rd.forward(request, response);
		}
		//response.sendRedirect("main.jsp");
		
	}
	
	public static int calDays(Date date0, Date date1) {
		int days = (int) ((date1.getTime() - date0.getTime()) / (1000*3600*24) + 1);
		return days;
	}
}
