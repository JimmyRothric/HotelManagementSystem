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
		String searchBtn = request.getParameter("searchBtn");
		String updateInfoBtn = request.getParameter("updateInfoBtn");
		String checkoutBtn = request.getParameter("checkoutBtn");
		if (searchBtn != null) {
			String id = request.getParameter("id");
			if (id != "") {
				OrderDao dao = new OrderDao();
				ArrayList<Order> orderList = dao.getOrder(id,"S");
				if (orderList !=null && !orderList.isEmpty()) {
					request.setAttribute("orderList", orderList);
				}
				RequestDispatcher rd = request.getRequestDispatcher("/web/receptionist/rcheckout.jsp");
				rd.forward(request, response);
				return;
			}else {
				//goto Error
				return;
			}
		}
		String oid = request.getParameter("oid");
		if (updateInfoBtn != null) {
			if (oid != null) {
				OrderDao dao = new OrderDao();
				dao.updateCheckout(oid);
				dao.updatePrice(oid);
			}
			RequestDispatcher rd = request.getRequestDispatcher("/web/receptionist/rcheckout.jsp");
			rd.forward(request, response);
			return;
		}
		if (checkoutBtn != null) {
			String rid = request.getParameter("rid");
			if (oid != null && rid != null) {
				OrderDao dao = new OrderDao();
				dao.checkoutOrder(oid);
				RoomDao rdao = new RoomDao();
				rdao.checkoutRoom(rid);
			}
			request.setAttribute("order_id", oid);
			RequestDispatcher rd = request.getRequestDispatcher("/web/user/order.jsp");
			rd.forward(request, response);
			return;
		}
		
	}

}
