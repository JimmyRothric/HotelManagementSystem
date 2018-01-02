package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDao;
import data.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession(true);
//		AccountManager am = new AccountManager();
		AccountDao dao = new AccountDao();
		Account acc = dao.isValid(username, password);
		if (acc != null) {
			session.setAttribute("loggedin", Boolean.TRUE);
			session.setAttribute("account", acc);
			String group = acc.getGroup();
			if (group.equals("User")) {
				response.sendRedirect("web/main.jsp");
			} else if (group.equals("Receptionist")) {
				response.sendRedirect("web/receptionist/rconsole.jsp");
			} else if (group.equals("Manager")) {
				response.sendRedirect("web/manager/mconsole.jsp");
			}
			return;
		}else {
			session.setAttribute("loginError", "Wrong username or password.");
			response.sendRedirect("web/login.jsp");
		}
	}

}
