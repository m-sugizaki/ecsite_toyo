package jp.co.ecsite.ecsite.service;

import java.util.List;

import jp.co.ecsite.ecsite.entity.ProductCartEntity;
import jp.co.ecsite.ecsite.entity.PurchaseResultsEntity;
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

}
