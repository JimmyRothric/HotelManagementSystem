package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.Account;

/**
 * Servlet Filter implementation class F2_PermissionFilter
 */
@WebFilter(filterName = "F2_PermissionFilter",
		   urlPatterns = {"*.jsp"})
public class F2_PermissionFilter implements Filter {

    /**
     * Default constructor. 
     */
    public F2_PermissionFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest hrequest = (HttpServletRequest) request;
		HttpServletResponse hresponse = (HttpServletResponse) response;
		HttpSession session = hrequest.getSession();
		String requestPath = hrequest.getServletPath();
		
		if (requestPath.endsWith("css")) {
			chain.doFilter(request, response);
			return;
		}
		
		String[] str = requestPath.split("/");
		if (str.length < 2) {
			hresponse.sendRedirect(hrequest.getHeader("referer"));
			return;
		}
		String keyword = str[str.length - 2];
	
		if (keyword.equals("web")) {
			chain.doFilter(request, response);
			return;
		}
		if(session.getAttribute("account") == null) {
			//request.setAttribute("loginError", "请先登录");
			//request.getRequestDispatcher("/web/login.jsp").forward(request, response);
			hresponse.sendRedirect("/HotelManagementSystem/web/login.jsp");
			return;
		}
		Account account = (Account) session.getAttribute("account");
		String userGroup = account.getGroup(); 
		//Manager pass
		if (userGroup.equals("Manager")) {
			chain.doFilter(request, response);
			return;
		}
		
		//User pass
		if (userGroup.equals("User") && keyword.equals("user")) {
			chain.doFilter(request, response);
			return;
		}
		
		//Receptionist pass
		if (userGroup.equals("Receptionist") && !keyword.equals("manager")) {
			chain.doFilter(request, response);
			return;
		}
		hresponse.sendRedirect(hrequest.getHeader("referer"));
		/*

		//always pass
		if (requestPath.endsWith("login.jsp") || requestPath.endsWith("register.jsp") || 
			requestPath.endsWith("head.jsp") || requestPath.endsWith("test.jsp")) {
			chain.doFilter(request, response);
			return;
		}
		
		//
		if(session.getAttribute("account") == null) {
			//request.setAttribute("loginError", "请先登录");
			request.getRequestDispatcher("/web/login.jsp").forward(request, response);
			return;
		}
		
		
		Account account = (Account) session.getAttribute("account");
		String userGroup = account.getGroup(); 
		//Manager pass
		if (userGroup.equals("Manager")) {
			chain.doFilter(request, response);
			return;
		}
		
		//User pass
		if (userGroup.equals("User") && (requestPath.endsWith("displayroom.jsp") || requestPath.endsWith("main.jsp") ||
			requestPath.endsWith("reservation.jsp") || requestPath.endsWith("order.jsp"))) {
			chain.doFilter(request, response);
			return;
		}
		
		//Receptionist pass
		if (userGroup.equals("Receptionist") && (requestPath.endsWith("rcheckin.jsp") || requestPath.endsWith("rcheckout.jsp"))) {
			chain.doFilter(request, response);
			return;
		}
		
		hresponse.sendRedirect(hrequest.getHeader("referer"));
		*/
		
		
	}
		//
		


	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
