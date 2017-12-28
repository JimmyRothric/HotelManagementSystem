package servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDao;
import dao.OrderDao;
import data.*;

/**
 * Servlet implementation class ReservationServlet
 */
@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservationServlet() {
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
		String acc_id = null;
		Account account = (Account)session.getAttribute("account");
		if (!account.getGroup().equals("User")) {
			acc_id = request.getParameter("user_id");
			AccountDao dao = new AccountDao();
			if (!dao.isValidUsername(acc_id)) {
				dao.addAccount(new Account(acc_id, acc_id, "Alpha", "User"));
			}
		}else {
			acc_id = account.getId();
		}
	
		
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		String floor = request.getParameter("floor");
		String orientation = request.getParameter("orientation");
		OrderDao dao = new OrderDao();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String type = request.getParameter("room_type");
		boolean success = false;
		Order o = null;
		try {
			o = new Order(acc_id,type,sdf.parse(checkin), sdf.parse(checkout));
			success = dao.addOrder(o);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (success) {
			request.setAttribute("order", o);
			request.setAttribute("ReservationInfo", "预订成功");
			RequestDispatcher rd = request.getRequestDispatcher("/web/user/order.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("ReservationInfo", "预订失败");
			RequestDispatcher rd = request.getRequestDispatcher("/web/user/displayroom.jsp");
			rd.forward(request, response);
		}

		
		
	}
	
	

}
