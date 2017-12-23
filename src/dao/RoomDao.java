package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

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
			stmt.setString(6, room.getState());
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
	public boolean checkinRoom(String rid) {
		String sql = "update Room set state = 'F' where Rid = ?";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, rid);
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
	public boolean checkoutRoom(String rid) {
		String sql = "update Room set state = 'E' where Rid = ?";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, rid);
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
	
	
/*	public ArrayList<Room> selectByRequirement(String type, int price) {
		String sql = "declare @type nvarchar(10) declare @price int select @type = ? select @price = ? "
				+ "select * from RoomType where (type = @type or @type = '') and (price between @price and @price + 300 or @price is null) ";
		ArrayList<Room> room = new ArrayList<Room>();
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, type);
			stmt.setInt(2, price);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Room r = new Room();
				r.setId(rs.getString("Rid"));
				r.setType(rs.getString("type"));
				r.setFloor(rs.getInt("floor"));
				r.setOrientation(rs.getString("orientation"));
				r.setDescription(rs.getString("description"));
				r.setState(rs.getString("state"));
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
*/	
	
	public ArrayList<Room> selectByTime(Date checkin, Date checkout) {
		String sql = "select * from Room where Rid not in(select Rid from Reservation where ? between checkin and checkout or ? between checkin and checkout or (? < checkin and ? > checkout))";
		ArrayList<Room> room = new ArrayList<Room>();
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setTimestamp(1, new Timestamp(checkin.getTime()));
			stmt.setTimestamp(2, new Timestamp(checkout.getTime()));
			stmt.setTimestamp(3, new Timestamp(checkin.getTime()));
			stmt.setTimestamp(4, new Timestamp(checkout.getTime()));
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Room r = new Room();
				r.setId(rs.getString("Rid"));
				r.setType(rs.getString("type"));
				r.setFloor(rs.getInt("floor"));
				r.setOrientation(rs.getString("orientation"));
				r.setDescription(rs.getString("description"));
				r.setState(rs.getString("state"));
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
	public ArrayList<Room> selectByRoomTypeAndTime(String type,Date checkin, Date checkout) {
		String sql = "select * from Room where type = ? and Rid not in(select Rid from Reservation where ? between checkin and checkout or ? between checkin and checkout or (? < checkin and ? > checkout))";
		ArrayList<Room> room = new ArrayList<Room>();
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, type);
			stmt.setTimestamp(2, new Timestamp(checkin.getTime()));
			stmt.setTimestamp(3, new Timestamp(checkout.getTime()));
			stmt.setTimestamp(4, new Timestamp(checkin.getTime()));
			stmt.setTimestamp(5, new Timestamp(checkout.getTime()));
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Room r = new Room();
				r.setId(rs.getString("Rid"));
				r.setType(rs.getString("type"));
				r.setFloor(rs.getInt("floor"));
				r.setOrientation(rs.getString("orientation"));
				r.setDescription(rs.getString("description"));
				r.setState(rs.getString("state"));
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
				r.setState(rs.getString("state"));
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
