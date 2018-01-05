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
import data.Error;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		AccountDao dao = new AccountDao();
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String password0 = request.getParameter("password0");
		String password1 = request.getParameter("password1");
		
		String url = "web/register.jsp";
		if (!username.matches("[0-9]{1,18}")) {
			Error.gotoError(request, response, url, "Id error.");
			return;
		}
		if (dao.isValidUsername(username)) {
			Error.gotoError(request, response, url, "This account has existed.");
			return;
		}
		if (!name.matches("^[\\u4E00-\\u9FA5A-Za-z0-9]+$")) {
			Error.gotoError(request, response, url, "Name Error.");
			return;
		}
		if (!password0.matches("[A-Za-z0-9]{1,20}")) {
			Error.gotoError(request, response, url, "Password error.");
			return;
		}
		if (password0.equals(password1)) {
			Account acc = new Account(username, password0, name);
			dao.addAccount(acc);
			response.sendRedirect("web/login.jsp");
			return;
		} else {
			Error.gotoError(request, response, url, "Two input password must be consistent.");
			return;
		}
	}
}
