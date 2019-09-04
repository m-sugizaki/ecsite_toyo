package jp.co.ecsite.ecsite.model;


import java.io.Serializable;


public class ProductCartModel implements Serializable {

	private String quantity;
	private String size;
	private String color;
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

}