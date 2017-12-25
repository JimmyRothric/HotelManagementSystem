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
import javax.servlet.http.HttpSession;

import data.Account;

/**
 * Servlet Filter implementation class F2_PermissionFilter
 */
@WebFilter(filterName = "F2_PermissionFilter",
		   urlPatterns = {"/abc"})
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
		HttpSession session = hrequest.getSession();
		String requestPath = hrequest.getServletPath();
		if(session.getAttribute("account") == null && !requestPath.endsWith("login.jsp")
				&& !requestPath.endsWith("register.jsp") && !requestPath.endsWith("LoginServlet")
				&& !requestPath.endsWith("RegisterServlet") && !requestPath.endsWith("test.jsp")) {
			//request.setAttribute("loginError", "请先登录");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}else {
			Account account = (Account) session.getAttribute("account");
			if (account != null) {
				String userGroup = account.getGroup(); 
				if (userGroup.equals("Manager")) {
					chain.doFilter(request, response);
					return;
				}else {
					if (userGroup.equals("User") && ( requestPath.endsWith("displayroom.jsp") || requestPath.endsWith("main.jsp") ||
						requestPath.endsWith("reservation.jsp") || requestPath.endsWith("order.jsp"))) {
						chain.doFilter(request, response);
						return;
					}
					if (userGroup.equals("Receptionist") && (requestPath.endsWith("rcheckin.jsp") || requestPath.endsWith("rcheckout.jsp"))) {
						chain.doFilter(request, response);
						return;
					}
				}
			}
			request.getRequestDispatcher("/test.jsp").forward(request, response);
		}
		//
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
