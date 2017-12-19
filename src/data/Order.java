package data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Order {
	public static int order_id = 0;
	private String id;
	private String account_id;
	private String room_id;
	private String room_type;
	private Date checkin;
	private Date checkout;
	private String order_type;
	private int price;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	

	public Order(String id, String account_id, String room_id, String room_type, Date checkin, Date checkout,
			String order_type, int price) {
		this.id = id;
		this.account_id = account_id;
		this.room_id = room_id;
		this.room_type = room_type;
		this.checkin = checkin;
		this.checkout = checkout;
		this.order_type = order_type;
		this.price = price;
	}

	public Order(String account_id,String room_type, Date checkin, Date checkout) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
		this.id = sdf.format(Calendar.getInstance().getTime()) + String.format("%04d", order_id++);
		this.account_id = account_id;
		this.room_id = null;
		this.room_type = room_type;
		this.checkin = checkin;
		this.checkout = checkout;
		this.order_type = "R";
		this.price = 0;
	}
/*
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
*/
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


	public Date getCheckin() {
		return checkin;
	}



	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}



	public Date getCheckout() {
		return checkout;
	}



	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}



	public String getRoom_type() {
		return room_type;
	}







	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}







	public String getOrder_type() {
		return order_type;
	}

	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
