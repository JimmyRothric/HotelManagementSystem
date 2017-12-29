package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import data.Review;

public class ReviewDao extends BaseDao {

	public ReviewDao() {
		// TODO Auto-generated constructor stub
	}
	
	public boolean addReview(Review r) {
		String sql = "insert into Review values(?, ?, ?, ?, ?, ?)";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, r.getOrder_id());
			stmt.setString(2, r.getAccount_id());
			stmt.setString(3, r.getRoom_type());
			stmt.setString(4, r.getComment());
			stmt.setInt(5, r.getRate());
			stmt.setTimestamp(6, new Timestamp(r.getReview_time().getTime()));
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
	
	public boolean delReview(String order_id) {
		String sql = "delete from Review where Oid = ?";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, order_id);
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
	
	public ArrayList<Review> selectReviewsByRequirement (String order, String account, String type) {
		ArrayList<Review> list = new ArrayList<Review>();
		String sql = "declare @order char(20) declare @account char(18) declare @type nvarchar(10) " + 
				"set @order = ? set @account = ? set @type = ? ; " + 
				"select * from Review " +
				"where (Oid = @order or @order = '') " +
				"and (Uid = @account or @account = '') " +
				"and (room_type = @type or @type = '') ";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, order);
			stmt.setString(2, account);
			stmt.setString(3, type);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String order_id = rs.getString(1);
				String acc_id = rs.getString(2);
				String room_type = rs.getString(3);
				String comment = rs.getString(4);
				int rate = rs.getInt(5);
				Date time = rs.getDate(6);
				list.add(new Review(order_id, acc_id, room_type, comment, rate, time));
			}
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
