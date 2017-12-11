package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import data.Room;
import data.RoomType;

public class RoomTypeDao extends BaseDao {
	public RoomTypeDao() {
		
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
}
