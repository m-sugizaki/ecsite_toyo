package jp.co.ecsite.ecsite.entity;

import java.io.Serializable;
import java.sql.Date;

public class ProductCartEntity implements Serializable {
	//productテーブル
	private int price;
	private String product_name;

	//product_cartテーブル
	private String product_cart_id;
	private String user_id;
	private String product_id;
	private int quantity;
	private String size;
	private String color;
	private Date cart_regist_dt;
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_cart_id() {
		return product_cart_id;
	}
	public void setProduct_cart_id(String product_cart_id) {
		this.product_cart_id = product_cart_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Date getCart_regist_dt() {
		return cart_regist_dt;
	}
	public void setCart_regist_dt(Date cart_regist_dt) {
		this.cart_regist_dt = cart_regist_dt;
	}


}
