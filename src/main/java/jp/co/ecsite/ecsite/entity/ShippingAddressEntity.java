package jp.co.ecsite.ecsite.entity;

public class ShippingAddressEntity {

	private String user_id;
	private int shipping_address_no;
	private String postal_code;
	private String address1;
	private String address2;
	private String phone_number;
	private String shipping_address_name;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getShipping_address_no() {
		return shipping_address_no;
	}
	public void setShipping_address_no(int shipping_address_no) {
		this.shipping_address_no = shipping_address_no;
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
	public String getShipping_address_name() {
		return shipping_address_name;
	}
	public void setShipping_address_name(String shipping_address_name) {
		this.shipping_address_name = shipping_address_name;
	}


}
