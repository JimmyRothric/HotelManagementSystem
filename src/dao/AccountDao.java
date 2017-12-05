package dao;

import java.sql.*;
import java.util.ArrayList;


import dao.BaseDao;
import data.*;

public class AccountDao  extends BaseDao {

	public AccountDao() {
		// TODO Auto-generated constructor stub
		super();
	}
	public boolean addAccount(Account acc) {
		String sql = "insert into Account values(?, ?, ?)";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, acc.getId());
			stmt.setString(2, acc.getPassword());
			stmt.setString(3, acc.getName());
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
	public boolean delAccount(String username) {
		String sql = "delete from Account where Uid = ?";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
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
	public boolean setName(String username,String name) {
		String sql = "update Account set name = ? where Uid = ? ";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, username);
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
	public boolean setPassword(String username,String password) {
		String sql = "update Account set password = ? where Uid = ? ";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, password);
			stmt.setString(2, username);
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
	public ArrayList<Account> getAccountList() {
		ArrayList<Account> list = new ArrayList<Account>();
		String sql = "select * from Account order by Uid";
		
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString(1);
				String password = rs.getString(2);
				String name = rs.getString(3);
				list.add(new Account(id,password,name));
			}
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return list;
	}
	

//	public boolean isManager(String username,String password) {
//		if (username != null && password != null) {
//			if (username.equals("admin") && password.equals("123")) {
//				return true;
//			}
//		}
//		return false;
//	}
	public boolean isValidUsername(String username) {
		String sql = "select * from Account where Uid = ?";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			boolean isValidUsername = false;
			if (rs.next()) {
				isValidUsername = true;
			}
			stmt.close();
			con.close();
			return isValidUsername;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public Account isValid(String username,String password) {
		String sql = "select * from Account where Uid = ? and password = ?";
		try {
			Connection con = super.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			Account acc = null;
			if (rs.next()) {
				acc = new Account(rs.getString(1), rs.getString(2), rs.getString(3));
			}
			stmt.close();
			con.close();
			return acc;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


}
