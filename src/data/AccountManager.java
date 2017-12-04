package data;

import java.util.HashMap;

public class AccountManager {
	private static HashMap<String,Account> data = new HashMap<String,Account>();

	public AccountManager() {
		
	}
//	public boolean isUsable(String username) {
////		return !data.containsKey(username);
//	}
//	public boolean isManager(String username,String password) {
////		if (username != null && password != null) {
////			if (username.equals("admin") && password.equals("123")) {
////				return true;
////			}
////		}
////		return false;
//	}
//	public boolean isValidUsername(String username) {
////		if (username != null) {
////			return data.containsKey(username);
////		}
////		return false;
//	}
//	public boolean isValid(String username,String password) {
////		if (isValidUsername(username)) {
////			if (password!= null && password.equals(data.get(username).getPassword())){
////				return true;
////			}
////		}
////		return false;
//	}
//	public Account getAccount(String username,String password) {
////		if (isValid(username,password)) {
////			return data.get(username);
////		}else {
////			return null;
////		}
//	}
//	public void addAccount(Account account) {
////		data.put(account.getId(), account);
//	}
}