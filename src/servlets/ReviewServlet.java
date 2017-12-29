package servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDao;
import data.Review;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
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
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("UTF-8");
		String btn = request.getParameter("btn");
		String order = request.getParameter("oid");
		String account = request.getParameter("acc_id");
		String type = request.getParameter("type");

		
		
		String comment = request.getParameter("comment");
		String rate = request.getParameter("rate");
		
		Review r = new Review();
		r.setOrder_id(order);
		r.setAccount_id(account);
		r.setRoom_type(type);
		r.setComment(comment);
		r.setRate(Integer.parseInt(rate));
		r.setReview_time(new Timestamp(Calendar.getInstance().getTime().getTime()));
		ReviewDao dao = new ReviewDao();
		dao.addReview(r);
		RequestDispatcher rd = request.getRequestDispatcher("/web/user/personal_homepage.jsp");
		rd.forward(request, response);
	}

}
