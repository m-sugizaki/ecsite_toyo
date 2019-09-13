package jp.co.ecsite.ecsite.model;

import java.io.Serializable;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class NewUserModel implements Serializable {
	private String user_id;

	private String password;

	private String password2;

	private String name;

	private String nickname;

	private String postal_code;

	private String address1;

	private String address2;

	private String phone_number;

	private String email;

	private String birthday;

	private String member_rank;

	@NotEmpty(message= "支払い方法を入力してください。")
	private String payment_method;

	@NotEmpty(message= "カード番号を入力してください。")
	@Pattern(regexp = "\\d{4}-\\d{4}-\\d{4}-\\d{4}", message="カード番号が不正です。")
	private String card_number;

	private String expiration_month;

	private String expiration_year;

	@NotEmpty(message= "カード名義名を入力してください。")
	private String card_holder_name;

	@NotEmpty(message= "郵便番号を入力してください。")
	@Pattern(regexp = "^\\d{3}\\-?\\d{4}$", message="郵便番号の値が不正です。")
	private String postal_code2;  //お届け先情報の郵便番号

	@NotEmpty(message= "住所を入力してください。")
	private String address3;  //お届け先情報の住所1

	private String address4;  //お届け先情報の住所2

	@NotEmpty(message= "電話番号を入力してください。")
	@Pattern(regexp = "^[0-9]{2,4}-[0-9]{2,4}-[0-9]{3,4}$", message="電話番号の値が不正です。")
	private String phone_number2;  //お届け先情報の電話番号

	@NotEmpty(message= "お届き先名を入力してください。")
	private String shipping_address_name;



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

	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
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

	public String getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	public String getCard_number() {
		return card_number;
	}
	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}

	public String getExpiration_month() {
		return expiration_month;
	}
	public void setExpiration_month(String expiration_month) {
		this.expiration_month = expiration_month;
	}
	public String getExpiration_year() {
		return expiration_year;
	}
	public void setExpiration_year(String expiration_year) {
		this.expiration_year = expiration_year;
	}
	public String getCard_holder_name() {
		return card_holder_name;
	}
	public void setCard_holder_name(String card_holder_name) {
		this.card_holder_name = card_holder_name;
	}
	public String getPostal_code2() {
		return postal_code2;
	}
	public void setPostal_code2(String postal_code2) {
		this.postal_code2 = postal_code2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getAddress4() {
		return address4;
	}
	public void setAddress4(String address4) {
		this.address4 = address4;
	}
	public String getPhone_number2() {
		return phone_number2;
	}
	public void setPhone_number2(String phone_number2) {
		this.phone_number2 = phone_number2;
	}
	public String getShipping_address_name() {
		return shipping_address_name;
	}
	public void setShipping_address_name(String shipping_address_name) {
		this.shipping_address_name = shipping_address_name;
	}



}
