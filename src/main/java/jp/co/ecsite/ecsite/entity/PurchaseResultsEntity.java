package jp.co.ecsite.ecsite.entity;

import java.io.Serializable;
import java.sql.Date;

public class PurchaseResultsEntity implements Serializable {
	private Date order_dt;	//注文日時
	private int order_no;	//注文No
	private String product_id;	//商品コード
	private String product_name;	//商品名
	private String order_status;	//注文ステータス
	private Date delivery_plan_dt;	//配送予定日
	private Date delivery_completion_dt;	//配送完了日
	private String evaluation;	//評価
	private String user_id;	//ユーザID

	public Date getOrder_dt() {
		return order_dt;
	}
	public void setOrder_dt(Date order_dt) {
		this.order_dt = order_dt;
	}
	public int getOrder_no() {
		return order_no;
	}
	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}
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
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public Date getDelivery_plan_dt() {
		return delivery_plan_dt;
	}
	public void setDelivery_plan_dt(Date delivery_plan_dt) {
		this.delivery_plan_dt = delivery_plan_dt;
	}
	public Date getDelivery_completion_dt() {
		return delivery_completion_dt;
	}
	public void setDelivery_completion_dt(Date delivery_completion_dt) {
		this.delivery_completion_dt = delivery_completion_dt;
	}
	public String getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}




}
