package jp.co.ecsite.ecsite.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

public class UserStoreEntity implements Serializable {
	private String user_id;
	private String password;
	private String name;
	private LocalDateTime login_dt;
	private String product_cart_id;


	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public LocalDateTime getLogin_dt() {
		return login_dt;
	}
	public void setLogin_dt(LocalDateTime login_dt) {
		this.login_dt = login_dt;
	}
	public String getProduct_cart_id() {
		return product_cart_id;
	}
	public void setProduct_cart_id(String product_cart_id) {
		this.product_cart_id = product_cart_id;
	}

}
