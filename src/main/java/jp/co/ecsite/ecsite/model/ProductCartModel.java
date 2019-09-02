package jp.co.ecsite.ecsite.model;


import java.io.Serializable;


public class ProductCartModel implements Serializable {

	private String quantity;

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
}