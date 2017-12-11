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
	public boolean addRoom(Room room) {
		String sql = "insert into Room values(?, ?, ?, ?, ?, ?)";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, room.getId());
			stmt.setString(2, room.getType());
			stmt.setInt(3, room.getFloor());
			stmt.setString(4, room.getOrientation());
			stmt.setString(5, room.getDescription());
			stmt.setBoolean(6, room.isIs_empty());
			stmt.executeUpdate();
			stmt.close();
			con.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<Room> selectByCondition(String type, int price0, int price1) {
		String sql = "select * from Room where type = ? and price between ? and ?";
		ArrayList<Room> room = new ArrayList<Room>();
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, type);
			stmt.setInt(2, price0);
			stmt.setInt(3, price1);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Room r = new Room();
				r.setId(rs.getString("Rid"));
				r.setType(rs.getString("type"));
				r.setFloor(rs.getInt("floor"));
				r.setOrientation(rs.getString("orientation"));
				r.setDescription(rs.getString("description"));
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
	
	public ArrayList<Room> displayAll() {
		String sql = "select * from Room";
		ArrayList<Room> room = new ArrayList<Room>();
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
				r.setDescription(rs.getString("description"));
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
