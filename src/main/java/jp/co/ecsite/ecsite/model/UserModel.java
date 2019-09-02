package jp.co.ecsite.ecsite.model;

import java.io.Serializable;

import org.hibernate.validator.constraints.NotEmpty;

public class UserModel implements Serializable {
	@NotEmpty(message = "ユーザーIDが未入力です。")
	private String user_id;

	@NotEmpty(message = "パスワードが未入力です。")
	private String password;


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

}
