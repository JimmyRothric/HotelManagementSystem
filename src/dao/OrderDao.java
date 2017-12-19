package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.Account;
import data.Order;

public class OrderDao extends BaseDao {

	public OrderDao() {
		// TODO Auto-generated constructor stub
	}
	public boolean addOrder(Order o) {
		String sql = "insert into Reservation values(?, ?, ?, ?, ?, ?, ?)";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, o.getId());
			stmt.setString(2, o.getAccount_id());
			stmt.setString(3, o.getRoom_id());
			stmt.setString(4, o.getCheckin());
			stmt.setString(5, o.getCheckout());
			stmt.setString(6, o.getOrder_type());
			stmt.setInt(7, o.getPrice());
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
