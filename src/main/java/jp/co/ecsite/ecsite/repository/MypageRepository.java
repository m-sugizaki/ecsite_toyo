package jp.co.ecsite.ecsite.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import jp.co.ecsite.ecsite.entity.PaymentMethodEntity;
import jp.co.ecsite.ecsite.entity.ProductCartEntity;
import jp.co.ecsite.ecsite.entity.PurchaseResultsEntity;
import jp.co.ecsite.ecsite.entity.ShippingAddressEntity;
import jp.co.ecsite.ecsite.entity.UserEntity;
import jp.co.ecsite.ecsite.entity.UserStoreEntity;

public interface MypageRepository {
	//カートの全権検索のメソッド
	List<ProductCartEntity> cartAll(UserStoreEntity userstoreentity);
	//購入履歴の全件検索メソッド
	List<ProductCartEntity> purchasehistoryAll(UserStoreEntity userstoreentity);
	//ログイン中のアカウント情報取得メソッド
	UserEntity accountInfo(UserStoreEntity userstoreentity);
	//ログイン中の支払情報取得メソッド
	List<PaymentMethodEntity> paymentInfo(UserStoreEntity userstoreentity);
	//ログイン中の届け先取得メソッド
	List<ShippingAddressEntity> shippingInfo(UserStoreEntity userstoreentity);
	//サービスから受け取ったデータを使って、DBからIDとパスワードを検索したデータをエンティティに格納するメソッド
	UserStoreEntity login(@Param("user_id") String user_id,@Param("password") String password);
	//ログインできたときのログイン日時の更新
	void dateUpdate(UserStoreEntity userstoreentity);
	//サービスから受け取ったデータを使ってデータベースにデータを挿入するメソッド
	void newUserStore(UserStoreEntity userstoreentity);
	//サービスから受け取ったデータを使ってデータベースにデータを挿入するメソッド
	void newUser(UserEntity userentity);
	//最終ログイン日時を登録するメソッド
	public void dateInsert(UserStoreEntity userstoreentity);
}