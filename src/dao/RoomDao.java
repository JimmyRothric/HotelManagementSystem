package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import data.Room;

public class RoomDao extends BaseDao {

	public RoomDao() {
		// TODO Auto-generated constructor stub
	}
	public ArrayList<Room> displayAll() {
		String sql = "select * from Room";
		ArrayList<Room> room = null;
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Room r = new Room();
				r.setId(rs.getString("Rid"));
				r.setType(rs.getString("type"));
				r.setFloor(rs.getInt("floor"));
				r.setOrientation(rs.getString("orientation"));
				r.setDiscription(rs.getString("discription"));
				r.setIs_empty(rs.getBoolean("empty"));
				room.add(r);
			}
			stmt.close();
			con.close();
			return room;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	
}
