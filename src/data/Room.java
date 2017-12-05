package data;

public class Room {
	private String id;
	private String type;
	private int floor;
	private String orientation;
	private String description;
	private boolean is_empty;
	public Room() {
		// TODO Auto-generated constructor stub
	}
	public Room(String id, String type, int floor, String orientation, String description) {
		this.id = id;
		this.type = type;
		this.floor = floor;
		this.orientation = orientation;
		this.description = description;
		this.is_empty = true;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
	public String getOrientation() {
		return orientation;
	}
	public void setOrientation(String orientation) {
		this.orientation = orientation;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isIs_empty() {
		return is_empty;
	}
	public void setIs_empty(boolean is_empty) {
		this.is_empty = is_empty;
	}
	

}
