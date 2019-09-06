package jp.co.ecsite.ecsite.service;

import java.util.List;

import jp.co.ecsite.ecsite.entity.PaymentMethodEntity;
import jp.co.ecsite.ecsite.entity.ProductCartEntity;
import jp.co.ecsite.ecsite.entity.PurchaseResultsEntity;
import jp.co.ecsite.ecsite.entity.ShippingAddressEntity;
import jp.co.ecsite.ecsite.entity.UserEntity;
import jp.co.ecsite.ecsite.entity.UserStoreEntity;

public interface MypageService {
	List<ProductCartEntity> cartAll(UserStoreEntity userstoreentity);
	List<PurchaseResultsEntity> purchasehistoryAll(UserStoreEntity userstoreentity);
	UserEntity accountInfo(UserStoreEntity userstoreentity);
	UserStoreEntity login(String user_id,String password);
	void dateUpdate(UserStoreEntity userstoreentity);
	void newUserStore(UserStoreEntity userstoreentity);
	void newUser(UserEntity userentity);
	// 9/5 13:00 豊泉 お支払情報表示
	List<PaymentMethodEntity> paymentInfo(UserStoreEntity userstoreentity);
	// 9/5 13:00 豊泉 お届け先情報表示
	List<ShippingAddressEntity> shippingInfo(UserStoreEntity userstoreentity);
	void dateInsert(UserStoreEntity userstoreentity);
}
