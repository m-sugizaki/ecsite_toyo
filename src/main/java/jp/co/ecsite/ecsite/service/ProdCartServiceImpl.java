package jp.co.ecsite.ecsite.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jp.co.ecsite.ecsite.entity.ProductCartEntity;
import jp.co.ecsite.ecsite.repository.ProdCartRepository;

@Service
public class ProdCartServiceImpl implements ProdCartService {
@Autowired
ProdCartRepository prodCartRepository;

	//商品カートを更新する
		@Override
		public void updateCart(ProductCartEntity productcartentity) {
			prodCartRepository.updateCart(productcartentity);
		}
		//商品カートの中の商品を削除する
		@Override
		public void deleteCart(int product_cart_id) {
			prodCartRepository.deleteCart(product_cart_id);
		}
		//注文するのボタンを押したとき購入履歴に追加する
		@Override
		public void insertHistoryOne(ProductCartEntity productcartentity) {
			prodCartRepository.insertHistoryOne(productcartentity);
		}
		//同じ内容でカートに入れる
		@Override
		public void insertCart(ProductCartEntity productcartentity) {
			prodCartRepository.insertCart(productcartentity);
		}
		//注文キャンセルボタンが押されたときに１つの商品情報を取ってくる
		@Override
		public ProductCartEntity findResultOne(int order_no) {
			return prodCartRepository.findResultOne(order_no);
		}
		//注文キャンセルの取り消しボタンが押されたときに注文状況をキャンセルにする
		public void changeResultOne(int order_no) {
			prodCartRepository.changeResultOne(order_no);
		}
}