package data;

public class Account {
	private String id;
	private String password;
	private String name;
	private String group;
	public Account() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Account(String id, String password, String name, String group) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.group = group;
	}
	public Account(String id, String password, String name) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.group = "user";
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}

	
}
