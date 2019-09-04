package jp.co.ecsite.ecsite.entity;


import java.io.Serializable;
import java.math.BigDecimal;


//商品検索画面で入力された値を格納（価格以外）　＆　検索結果（価格も含む）を格納

public class ProductEntity  implements Serializable {

	private String product_id;
	private String product_name;
	private String maker;
	private BigDecimal price;
	private String size;
	private String color;
	private String sale_point;
	private byte[] image;
	private int stock_quantity;
	private String similar_product_id;

	//base64型格納用
	private String imagebase;

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
	public String getSale_point() {
		return sale_point;
	}
	public void setSale_point(String sale_point) {
		this.sale_point = sale_point;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public int getStock_quantity() {
		return stock_quantity;
	}
	public void setStock_quantity(int stock_quantity) {
		this.stock_quantity = stock_quantity;
	}
	public String getSimilar_product_id() {
		return similar_product_id;
	}
	public void setSimilar_product_id(String similar_product_id) {
		this.similar_product_id = similar_product_id;
	}

	//base64格納用
	public String getImagebase() {
		return imagebase;
	}
	//base64格納用
	public void setImagebase(String imagebase) {
		this.imagebase = imagebase;
	}


}
