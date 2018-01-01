package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import data.Account;
import data.Order;
import data.Room;

public class OrderDao extends BaseDao {

	public OrderDao() {
		// TODO Auto-generated constructor stub
	}
	public ArrayList<Order> getOrder(String id,String order_type) {
		String sql = "select * from Reservation where Uid = ? and order_type = ?";
		ArrayList<Order> orderList = new ArrayList<Order>();
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, order_type);
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
	public boolean updatePrice(String oid) {
		String sql = "update Reservation set price = ? where Oid = ?";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, getPrice(oid));
			stmt.setString(2, oid);
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
	public boolean updateCheckout(String oid,Date time) {
		String sql = "update Reservation set checkout = ? where Oid = ?";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setTimestamp(1, new Timestamp(time.getTime()));
			stmt.setString(2, oid);
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
	

	public int getPrice(String oid) {
		String sql = "select checkin,checkout,room_type from Reservation where Oid = ?";
		int price = -1;
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, oid);
			ResultSet rs = stmt.executeQuery();
			Date checkin = null;
			Date checkout= null;
			String room_type = null;
			while (rs.next()) {
				checkin = new Date(rs.getTimestamp(1).getTime());
				checkout = new Date(rs.getTimestamp(2).getTime());
				room_type = rs.getString(3);
			}
			RoomTypeDao dao = new RoomTypeDao();
			int price_per_day = dao.getPrice(room_type);
			price = price_per_day * Order.calDays(checkin,checkout);
			stmt.close();
			con.close();
			return price;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return price;
	}
	public Order getSingleOrder(String oid) {
		String sql = "select * from Reservation where Oid = ? union"
				+ " select * from ReservationHistory where Oid = ? ";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, oid);
			stmt.setString(2, oid);
			ResultSet rs = stmt.executeQuery();
			Order o = null;
			while (rs.next()) {
				o = new Order(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDate(5),rs.getDate(6),rs.getString(7),rs.getInt(8));
			}
			stmt.close();
			con.close();
			return o;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	
	
	public boolean checkoutOrder(String oid) {
	
		Order o = getSingleOrder(oid);
		String sql2 = "insert into ReservationHistory values(?, ?, ?, ?, ?, ?, ?, ?)";
		String sql3 = "delete from Reservation where Oid = ?";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt2 = con.prepareStatement(sql2);
			stmt2.setString(1, o.getId());
			stmt2.setString(2, o.getAccount_id());
			stmt2.setString(3, o.getRoom_id());
			stmt2.setString(4, o.getRoom_type());
			stmt2.setTimestamp(5, new Timestamp(o.getCheckin().getTime()));
			stmt2.setTimestamp(6, new Timestamp(o.getCheckout().getTime()));
			stmt2.setString(7, "F");
			stmt2.setInt(8, o.getPrice());
			stmt2.executeUpdate();
			stmt2.close();
			PreparedStatement stmt3 = con.prepareStatement(sql3);
			stmt3.setString(1, oid);
			stmt3.executeUpdate();
			stmt3.close();
			con.close();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return false;
	}
	public boolean checkinOrder(String oid,String rid) {
		String sql = "update Reservation set Rid = ? , order_type = 'S' where Oid = ?";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, rid);
			stmt.setString(2, oid);
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
	
	public ArrayList<Order> displayMyOwnOrder(String id) {
		String sql = "select * from Reservation where Uid = ? " + 
				"union select *from ReservationHistory where Uid = ?";
		ArrayList<Order> orderList = new ArrayList<Order>();
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			stmt.setString(2, id);
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
}
