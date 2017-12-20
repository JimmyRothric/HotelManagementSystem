package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDao;
import dao.RoomDao;
import data.Order;
import data.Room;

/**
 * Servlet implementation class CheckinServlet
 */
@WebServlet("/CheckinServlet")
public class CheckinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckinServlet() {
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
		String rsearchBtn = request.getParameter("rsearchBtn");
		String allocateBtn = request.getParameter("allocateBtn");
		if (rsearchBtn != null) {
			String id = request.getParameter("id");
			if (id != "") {
				OrderDao dao = new OrderDao();
				ArrayList<Order> orderList = dao.getROrder(id);
				ArrayList<Room> validRoomList;
				RoomDao rdao = new RoomDao();
				if (orderList !=null && !orderList.isEmpty()) {
					Order o = orderList.get(0);
					validRoomList = rdao.selectByRoomTypeAndTime(o.getRoom_type(), o.getCheckin(), o.getCheckout());
					request.setAttribute("orderList", orderList);
					request.setAttribute("roomList", validRoomList);
					
				}
				RequestDispatcher rd = request.getRequestDispatcher("/rcheckin.jsp");
				rd.forward(request, response);
				return;
			}else {
				//goto Error
			}
		}
		
		if (allocateBtn != null) {
			String oid = request.getParameter("oid");
			String rid = request.getParameter("rid");
			
			if (rid != null && oid != null) {
				OrderDao odao = new OrderDao();
				odao.checkinOrder(oid, rid);
				RoomDao rdao = new RoomDao();
				rdao.checkinRoom(rid);
			}
		}
		response.sendRedirect("rcheckin.jsp");
	}

}
