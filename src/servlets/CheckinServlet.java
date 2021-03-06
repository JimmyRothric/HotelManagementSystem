package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDao;
import dao.RoomDao;
import data.Error;
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
		String deleteBtn = request.getParameter("deleteBtn");
		HttpSession session = request.getSession();
		String id = null;
		String url = "web/receptionist/rcheckin.jsp";
		if (rsearchBtn != null) {
			id = request.getParameter("id");
		} else {
			id = (String) session.getAttribute("user_id");
			session.removeAttribute("user_id");
		}
		
		if (deleteBtn != null) {
			boolean success = false;
			String oid = request.getParameter("oid");
			OrderDao odao = new OrderDao();
			success = odao.delOrder(oid);
//			if (success) {
//				Error.gotoError(request, response, url, "删除成功");
//			} else {
//				Error.gotoError(request, response, url, "删除失败");
//			}
		}
		if (allocateBtn != null) {
			String oid = request.getParameter("oid");
			String rid = request.getParameter("rid");
			boolean success = false;
			if (rid != null && oid != null) {
				OrderDao odao = new OrderDao();
				odao.checkinOrder(oid, rid);
				RoomDao rdao = new RoomDao();
				success = rdao.checkinRoom(rid);
			}
//			if (success) {
//				Error.gotoError(request, response, url, "分配成功");
//			} else {
//				Error.gotoError(request, response, url, "分配失败");
//			}
		}
		
		
		if (id != null && id != "") {
			OrderDao dao = new OrderDao();
			ArrayList<Order> orderList = dao.getOrder(id,"R");
			ArrayList<Room> validRoomList;
			RoomDao rdao = new RoomDao();
			if (orderList !=null && !orderList.isEmpty()) {
				Order o = orderList.get(0);
				validRoomList = rdao.selectByRoomTypeAndTime(o.getRoom_type(), o.getCheckin(), o.getCheckout());
				session.setAttribute("orderList", orderList);
				session.setAttribute("roomList", validRoomList);
				session.setAttribute("user_id", id);
			} else {
				//Error.gotoError(request, response, url, "未查找到相关订单信息");
				//return;
			}
			response.sendRedirect(url);
			return;
		}
		
	}

}
