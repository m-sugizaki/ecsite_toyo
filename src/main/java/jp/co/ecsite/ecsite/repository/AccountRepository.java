package jp.co.ecsite.ecsite.repository;

import jp.co.ecsite.ecsite.entity.PaymentMethodEntity;
import jp.co.ecsite.ecsite.entity.ShippingAddressEntity;
import jp.co.ecsite.ecsite.entity.UserEntity;

public interface AccountRepository {

	//サービスから受け取ったデータを使って支払い方法テーブルに挿入するメソッド
	void insertPayOne(PaymentMethodEntity paymentmethodentity);

	//サービスから受け取ったデータを使って支払い方法テーブルを更新するメソッド
	void updatePayOne(PaymentMethodEntity paymentmethodentity);

	//サービスから受け取ったデータを使って支払い方法テーブルから行を削除するメソッド
	void deletetPayOne(PaymentMethodEntity paymentmethodentity);

	//サービスから受け取ったデータを使ってお届け先テーブルに挿入するメソッド
	void insertAddressOne(ShippingAddressEntity shippingaddressentity);

	//サービスから受け取ったデータを使ってお届け先テーブルを変更するメソッド
	void updateAddressOne(ShippingAddressEntity shippingaddressentity);

	//サービスから受け取ったデータを使ってお届け先テーブルから行を削除するメソッド
	void deleteAddressOne(ShippingAddressEntity shippingaddressentity);

	//サービスから受け取ったデータを使ってユーザーテーブルを変更するメソッド
	void updateAccountOne(UserEntity userentity);


}