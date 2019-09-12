package jp.co.ecsite.ecsite.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jp.co.ecsite.ecsite.entity.PaymentMethodEntity;
import jp.co.ecsite.ecsite.entity.ProductCartEntity;
import jp.co.ecsite.ecsite.entity.PurchaseResultsEntity;
import jp.co.ecsite.ecsite.entity.ShippingAddressEntity;
import jp.co.ecsite.ecsite.entity.UserEntity;
import jp.co.ecsite.ecsite.entity.UserStoreEntity;
import jp.co.ecsite.ecsite.repository.MypageRepository;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	MypageRepository mypageRepository;

	@Override
	public List<ProductCartEntity> cartAll(UserStoreEntity userstoreentity){
		return mypageRepository.cartAll(userstoreentity);
	}

	@Override
	public List<PurchaseResultsEntity> purchasehistoryAll(UserStoreEntity userstoreentity){
		return mypageRepository.purchasehistoryAll(userstoreentity);
	}

	@Override
	public UserEntity accountInfo(UserStoreEntity userstoreentity) {
		return mypageRepository.accountInfo(userstoreentity);
	}

	@Override
	public UserStoreEntity login(String user_id,String password) {
		return mypageRepository.login(user_id,password);
	}

	@Override
	public void dateUpdate(UserStoreEntity userstoreentity) {
		mypageRepository.dateUpdate(userstoreentity);
	}

	@Override
	public void newUserStore(UserStoreEntity userstoreentity) {
		mypageRepository.newUserStore(userstoreentity);
	}

	@Override
	public void newUser(UserEntity userentity) {
		mypageRepository.newUser(userentity);
	}

	// 9/5 13:00 豊泉 お支払情報表示
	@Override
	public List<PaymentMethodEntity> paymentInfo(UserStoreEntity userstoreentity){
		return mypageRepository.paymentInfo(userstoreentity);
	}
	// 9/5 13:00 豊泉 お届け先情報表示
	@Override
	public List<ShippingAddressEntity> shippingInfo(UserStoreEntity userstoreentity){
		return mypageRepository.shippingInfo(userstoreentity);
	}

	@Override
	public void dateInsert(UserStoreEntity userstoreentity) {
		mypageRepository.dateInsert(userstoreentity);
	}
}
