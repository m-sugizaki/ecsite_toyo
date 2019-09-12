package jp.co.ecsite.ecsite.model;


import java.io.Serializable;

//11:20 フィールドの追加(升岡)
public class ProductCartModel implements Serializable {

	private String product_cart_id;
	private String product_id;
	private String price;
	private String quantity;
	private String size;
	private String color;
	private String payment_method;
	private String payment_no;
	private String shiiping_address_no;
	private String order_no;
	public String getProduct_cart_id() {
		return product_cart_id;
	}
	public void setProduct_cart_id(String product_cart_id) {
		this.product_cart_id = product_cart_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
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
	public String getPayment_method() {
		return payment_method;
	}
	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}
	public String getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(String payment_no) {
		this.payment_no = payment_no;
	}
	public String getShiiping_address_no() {
		return shiiping_address_no;
	}
	public void setShiiping_address_no(String shiiping_address_no) {
		this.shiiping_address_no = shiiping_address_no;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}


}