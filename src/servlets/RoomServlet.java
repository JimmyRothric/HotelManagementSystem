package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RoomDao;
import dao.RoomTypeDao;
import data.Room;
import data.RoomType;

/**
 * Servlet implementation class RoomServlet
 */
@WebServlet("/RoomServlet")
public class RoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomServlet() {
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
		String room_id = request.getParameter("room_id");
		String room_type = request.getParameter("room_type");
		String room_floor = request.getParameter("room_floor");
		String room_ort = request.getParameter("room_ort");
		String room_dspt = request.getParameter("room_dspt");
		HttpSession session = request.getSession();
		if (room_id != "" && room_type != "" && room_floor != "" && room_ort != "") {
			try {
				int floor = Integer.parseInt(room_floor);
				RoomDao rd = new RoomDao();
				if(rd.addRoom(new Room(room_id,room_type,floor,room_ort,room_dspt))){
					session.setAttribute("addRoomInfo", "添加成功");
					response.sendRedirect("web/manager/addRooms.jsp");
					return;
				}
				
			}catch (Exception e) {
				
			}
		}
		session.setAttribute("addRoomInfo", "添加失败");
		response.sendRedirect("web/manager/addRooms.jsp");
	}

}
