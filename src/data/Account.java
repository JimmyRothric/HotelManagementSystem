package data;

public class Account {
	private String id;
	private String password;
<<<<<<< HEAD
	public Account() {
		// TODO Auto-generated constructor stub
	}
	public Account(String id, String password, String name) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
	}
=======
	private String name;
	
>>>>>>> origin/master
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
<<<<<<< HEAD
=======

	public Account() {
		// TODO Auto-generated constructor stub
	}
	public Account(String id, String password,String name) {
		this.id = id;
		this.name = name;
		this.password = password;
	}
>>>>>>> origin/master
	
}
