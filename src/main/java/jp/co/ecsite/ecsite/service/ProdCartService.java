package jp.co.ecsite.ecsite.service;

import jp.co.ecsite.ecsite.entity.ProductCartEntity;

public interface ProdCartService {

	//商品カートを更新する
	void updateCart(ProductCartEntity productcartentity);
	//商品カートの中の商品を削除する
	void deleteCart(int product_cart_id);
	//注文するのボタンを押したとき購入履歴に追加する
	void insertHistoryOne(ProductCartEntity productcartentity);
	//同じ内容でカートに入れる
	void insertCart(ProductCartEntity productcartentity);
	//注文キャンセルボタンが押されたときに１つの商品情報を取ってくる
	ProductCartEntity findResultOne(int order_no);
	//注文キャンセルの取り消しボタンが押されたときに注文状況をキャンセルにする
	void changeResultOne(int order_no);
}
