package data;

import java.util.Date;

public class Review {
	private String order_id;
	private String account_id;
	private String room_type;
	private String comment;
	private int rate;
	private Date review_time;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(String order_id, String account_id, String room_type, String comment, int rate, Date review_time) {
		super();
		this.order_id = order_id;
		this.account_id = account_id;
		this.room_type = room_type;
		this.comment = comment;
		this.rate = rate;
		this.review_time = review_time;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getAccount_id() {
		return account_id;
	}

	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}

	public String getRoom_type() {
		return room_type;
	}

	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public Date getReview_time() {
		return review_time;
	}

	public void setReview_time(Date review_time) {
		this.review_time = review_time;
	}

	
}
