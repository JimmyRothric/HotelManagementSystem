package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDao;
import dao.RoomDao;
import data.Order;
import data.Room;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
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
		HttpSession session = request.getSession();
		String searchBtn = request.getParameter("searchBtn");
		String updateInfoBtn = request.getParameter("updateInfoBtn");
		String checkoutBtn = request.getParameter("checkoutBtn");
		String id = null;
		String oid = request.getParameter("oid");
		
		
		if (checkoutBtn != null) {
			String rid = request.getParameter("rid");
			
			OrderDao dao = new OrderDao();
			if (oid != null && rid != null) {
				dao.checkoutOrder(oid);
				RoomDao rdao = new RoomDao();
				rdao.checkoutRoom(rid);
			}

			Order o = dao.getSingleOrder(oid);
			request.setAttribute("order", o);
			RequestDispatcher rd = request.getRequestDispatcher("/web/user/order.jsp");
			rd.forward(request, response);
			id = (String) session.getAttribute("user_id");
			session.removeAttribute("user_id");
			return;
		}
		
		if (updateInfoBtn != null) {
			String checkout_time = request.getParameter("checkout_time");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date d = null;
			if (checkout_time != null && checkout_time != "") {
				try {
					d = sdf.parse(checkout_time);
				} catch (ParseException e) {
				// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			OrderDao dao = new OrderDao();
			Order o = dao.getOrder(oid);

			if (oid != null && d != null) {
				Date checkin = o.getCheckin();
				Date checkout = o.getCheckout();
				if (d.after(checkin) && d.before(checkout)) {
					dao.updateCheckout(oid,d);
					dao.updatePrice(oid);
				}else if (d.after(checkout)) {
					RoomDao rd = new RoomDao();
					Calendar tmp = Calendar.getInstance();
					tmp.setTime(checkout);
					tmp.add(Calendar.DATE, 1);
					Date dplusone = tmp.getTime();
					ArrayList<Room> roomList = rd.selectByRoomTypeAndTime(o.getRoom_type(), dplusone, d);
					for (Room r : roomList) {
						if (r.getId().equals(o.getRoom_id())){
							dao.updateCheckout(oid,d);
							dao.updatePrice(oid);
						}
					}
				}

			}
			id = (String) session.getAttribute("user_id");
			session.removeAttribute("user_id");
		}
		
		if (searchBtn != null) {
			id = request.getParameter("id");
		}
		if (id != null && id != "") {
			OrderDao dao = new OrderDao();
			ArrayList<Order> orderList = dao.getOrder(id,"S");
			if (orderList != null && !orderList.isEmpty()) {
				session.setAttribute("orderList", orderList);
			}
			session.setAttribute("user_id", id);
			response.sendRedirect("web/receptionist/rcheckout.jsp");
			return;
		};
	}
}
