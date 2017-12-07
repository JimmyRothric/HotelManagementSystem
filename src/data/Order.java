package data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Order {
	private String id;
	private String account_id;
	private String room_id;
	private String checkin;
	private String checkout;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	public Order(String id, String account_id, String room_id, String checkin, String checkout) {
		this.id = id;
		this.account_id = account_id;
		this.room_id = room_id;
		this.checkin = checkin;
		this.checkout = checkout;
	}

	public int calDays(Date date0, Date date1) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date checkin_date = null;
		Date checkout_date = null;
		try {
			checkin_date = sdf.parse(checkin);
			checkout_date = sdf.parse(checkout);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int days = (int) ((date1.getTime() - date0.getTime()) / (1000*3600*24) + 1);
		return days;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	
}
