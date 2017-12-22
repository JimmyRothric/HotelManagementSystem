package data;

import java.math.BigDecimal;

public class RoomType {
	private String type;
	private int price;
	private int rest;
	public RoomType() {
		
	}
	public RoomType(String type, int price, int rest) {
		this.type = type;
		this.price = price;
		this.rest = rest;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRest() {
		return rest;
	}
	public void setRest(int rest) {
		this.rest = rest;
	}

}
