package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import data.Account;
import data.Order;
import data.Room;

public class OrderDao extends BaseDao {

	public OrderDao() {
		// TODO Auto-generated constructor stub
	}
	public ArrayList<Order> getROrder(String id) {
		String sql = "select * from Reservation where Uid = ? and order_type = 'R'";
		ArrayList<Order> orderList = new ArrayList<Order>();
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Order o = new Order(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5),rs.getDate(6),rs.getString(7),rs.getInt(8));
				orderList.add(o);
			}
			stmt.close();
			con.close();
			return orderList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public boolean addOrder(Order o) {
		String sql = "insert into Reservation values(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, o.getId());
			stmt.setString(2, o.getAccount_id());
			stmt.setString(3, o.getRoom_id());
			stmt.setString(4, o.getRoom_type());
			stmt.setTimestamp(5, new Timestamp(o.getCheckin().getTime()));
			stmt.setTimestamp(6, new Timestamp(o.getCheckout().getTime()));
			stmt.setString(7, o.getOrder_type());
			stmt.setInt(8, o.getPrice());
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
}
