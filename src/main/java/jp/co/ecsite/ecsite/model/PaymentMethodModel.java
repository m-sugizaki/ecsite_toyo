package jp.co.ecsite.ecsite.model;

import java.io.Serializable;

import org.hibernate.validator.constraints.CreditCardNumber;
import org.hibernate.validator.constraints.NotEmpty;

public class PaymentMethodModel implements Serializable {

	private String user_id;
	private String payment_no;
	
	@NotEmpty(message = "支払い方法が未入力です。")
	private String payment_method;
	
	@CreditCardNumber(message = "書式が違います。")
	@NotEmpty(message = "カード番号が未入力です。")
	private String card_number;
	
	private String expiration_month;
	
	private String expiration_year;
	
	@NotEmpty(message = "カードの名義人が未入力です。")
	private String card_holder_name;
	
	private String topage;

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(String payment_no) {
		this.payment_no = payment_no;
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
	public String getTopage() {
		return topage;
	}
	public void setTopage(String topage) {
		this.topage = topage;
	}

}
