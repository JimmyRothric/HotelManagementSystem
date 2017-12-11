package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RoomTypeDao;
import data.RoomType;

/**
 * Servlet implementation class RoomTypeServlet
 */
@WebServlet("/RoomTypeServlet")
public class RoomTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomTypeServlet() {
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
		String room_type = request.getParameter("room_type");
		String room_price = request.getParameter("room_price");
		String room_rest = request.getParameter("room_rest");
		if (room_type != "" && room_price != "" && room_rest != "") {
			try {
				int price = Integer.parseInt(room_price);
				int rest = Integer.parseInt(room_rest);
				RoomType rt = new RoomType(room_type,price,rest);
				RoomTypeDao rtd = new RoomTypeDao();
				rtd.addRoomType(rt);
			}catch (NumberFormatException e) {
				
			}
		}
		
		
	}

}
