package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import data.*;

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
		AccountDao dao = new AccountDao();
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String password0 = request.getParameter("password0");
		String password1 = request.getParameter("password1");
		if (!username.matches("[0-9]{1,18}")) {
			goError(request,response,"Id error.");
			return;
		}
		if (dao.isValidUsername(username)) {
			goError(request,response,"This account has existed.");
			return;
		}
		if (!name.matches("^[\\u4E00-\\u9FA5A-Za-z0-9]+$")) {
			goError(request,response,"Name Error.");
			return;
		}
		if (!password0.matches("[A-Za-z0-9]{1,20}")) {
			goError(request,response,"Password error.");
			return;
		}
		if (password0.equals(password1)) {
			Account acc = new Account(username, password0, name);
			dao.addAccount(acc);
			response.sendRedirect("web/login.jsp");
			return;
		} else {
			goError(request,response,"Two input password must be consistent.");
			return;
		}
	}
	private void goError(HttpServletRequest request, HttpServletResponse response,String error) throws ServletException, IOException {
		request.setAttribute("registerError", error);
		RequestDispatcher rd = request.getRequestDispatcher("/web/register.jsp");
		rd.forward(request, response);
	}

}
