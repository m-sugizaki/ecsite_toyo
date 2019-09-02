package jp.co.ecsite.ecsite.entity;

import java.util.Date;

public class PaymentMethodEntity {

		private String user_id;
		private int payment_id;
		private String payment_method;
		private String card_number;
		private Date expiration_date;
		private String card_holder_name;
		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public int getPayment_id() {
			return payment_id;
		}
		public void setPayment_id(int payment_id) {
			this.payment_id = payment_id;
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
		public Date getExpiration_date() {
			return expiration_date;
		}
		public void setExpiration_date(Date expiration_date) {
			this.expiration_date = expiration_date;
		}
		public String getCard_holder_name() {
			return card_holder_name;
		}
		public void setCard_holder_name(String card_holder_name) {
			this.card_holder_name = card_holder_name;
		}



}
