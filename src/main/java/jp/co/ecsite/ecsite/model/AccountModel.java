package jp.co.ecsite.ecsite.model;

import java.io.Serializable;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class AccountModel implements Serializable {
	private String user_id;

	@NotEmpty(message = "名前が未入力です。")
	private String name;

	@NotEmpty(message = "ニックネームが未入力です。")
	private String nickname;

	@NotEmpty(message = "郵便番号が未入力です。")
	@Pattern(regexp = "^\\d{3}\\-?\\d{4}$", message="値が不正です。(例.123-4567)")
	private String postal_code;

	@NotEmpty(message = "住所が未入力です。")
	private String address1;

	@NotEmpty(message = "住所が未入力です。")
	private String address2;

	@NotEmpty(message = "電話番号が未入力です。")
	@Pattern(regexp = "^[0-9]{2,4}-[0-9]{2,4}-[0-9]{3,4}$", message="値が不正です。")
	private String phone_number;

	@NotEmpty(message = "メールアドレスが未入力です。")
	@Email(message="Emailを入力してください。")
	private String email;

	@NotEmpty(message = "誕生日が未入力です。")
	@Pattern(regexp="^\\d{4}-\\d{1,2}-\\d{1,2}$", message="値が不正です。(例.1996-01-01)")
	private String birthday;


	private String member_rank;

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPostal_code() {
		return postal_code;
	}
	public void setPostal_code(String postal_code) {
		this.postal_code = postal_code;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getMember_rank() {
		return member_rank;
	}
	public void setMember_rank(String member_rank) {
		this.member_rank = member_rank;
	}



}
