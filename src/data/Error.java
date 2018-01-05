package data;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Error {
	public static void gotoError(HttpServletRequest request, HttpServletResponse response, String url, String errorInfo) {
		try {
			request.getSession().setAttribute("errorInfo", errorInfo);
			response.sendRedirect(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
