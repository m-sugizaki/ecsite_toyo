package jp.co.ecsite.ecsite.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class ProductSearchResultsEntity implements Serializable {
	private String product_id;
	private String product_name;
	private String maker;
	private BigDecimal price;
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public java.math.BigDecimal getPrice() {
		return price;
	}
	public void setPrice(java.math.BigDecimal price) {
		this.price = price;
	}


}

