package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import data.Room;
import data.RoomType;

public class RoomTypeDao extends BaseDao {
	public RoomTypeDao() {
		
	}
	public int getPrice(String type) {
		String sql = "select price from RoomType where type = ?";
		int price = 0;
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, type);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				price = rs.getInt(1);
			}
			stmt.close();
			con.close();
			return price;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
	public boolean addRoomType(RoomType rt) {
		String sql = "insert into RoomType values(?, ?, ?)";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, rt.getType());;
			stmt.setInt(2, rt.getPrice());
			stmt.setInt(3, rt.getRest());
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
	public ArrayList<RoomType> getRoomTypes(){
		String sql = "select * from RoomType";
		ArrayList<RoomType> rtList = new ArrayList<RoomType>();
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				RoomType rt = new RoomType(rs.getString(1),rs.getInt(2),rs.getInt(3));
				rtList.add(rt);
			}
			stmt.close();
			con.close();
			return rtList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<RoomType> selectByTime(Date checkin, Date checkout) {
		String sql = "select room_type,count(*) as room_count into #tmptable from Reservation where ? between checkin and checkout or ? between checkin and checkout or (? < checkin and ? > checkout) group by (room_type) " + 
				"select type, price, room_count from RoomType left join #tmptable on type = room_type where rest > room_count or room_count is null";
		ArrayList<RoomType> roomtypes = new ArrayList<RoomType>();
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setTimestamp(1, new Timestamp(checkin.getTime()));
			stmt.setTimestamp(2, new Timestamp(checkout.getTime()));
			stmt.setTimestamp(3, new Timestamp(checkin.getTime()));
			stmt.setTimestamp(4, new Timestamp(checkout.getTime()));
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				RoomType rt = new RoomType();
				rt.setType(rs.getString(1));
				rt.setPrice(rs.getInt(2));
				rt.setRest(rs.getInt(3));
				roomtypes.add(rt);
			}
			stmt.close();
			con.close();
			return roomtypes;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
