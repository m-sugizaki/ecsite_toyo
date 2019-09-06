package jp.co.ecsite.ecsite.entity;

import java.util.Date;

public class PaymentMethodEntity {

		private String user_id;
		private int payment_no;
		private String payment_method;
		private String card_number;
		private Date expiration_date;
		private String card_holder_name;

		//更新ポップアップ内での初期表示用、11時45分石田
		private String expiration_year;
		private String expiration_month;

		public String getUser_id() {
			return user_id;
		}
		public void setUser_id(String user_id) {
			this.user_id = user_id;
		}
		public int getPayment_no() {
			return payment_no;
		}
		public void setPayment_no(int payment_no) {
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
		public String getExpiration_year() {
			return expiration_year;
		}
		public void setExpiration_year(String expiration_year) {
			this.expiration_year = expiration_year;
		}
		public String getExpiration_month() {
			return expiration_month;
		}
		public void setExpiration_month(String expiration_month) {
			this.expiration_month = expiration_month;
		}



}
