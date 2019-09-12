package jp.co.ecsite.ecsite.repository;

import jp.co.ecsite.ecsite.entity.ProductCartEntity;

public interface ProdCartRepository {

	void updateCart(ProductCartEntity productcartentity);

	void deleteCart(int product_cart_id);

	void insertHistoryOne(ProductCartEntity productcartentity);

	void insertCart(ProductCartEntity productcartentity);

	ProductCartEntity findResultOne(int order_no);

	void changeResultOne(int order_no);

}
