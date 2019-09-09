package jp.co.ecsite.ecsite.service;

import jp.co.ecsite.ecsite.entity.PaymentMethodEntity;
import jp.co.ecsite.ecsite.entity.ShippingAddressEntity;
import jp.co.ecsite.ecsite.entity.UserEntity;

public interface AccountService {

	void insertPayOne(PaymentMethodEntity paymentmethodentity);
	void deletePayOne(int payment_no);
	void updatePayOne(PaymentMethodEntity paymentmethodentity);
	void insertAddressOne(ShippingAddressEntity shippingaddressentity);
	void deleteAddressOne(int shipping_address_no);
	void updateAddressOne(ShippingAddressEntity shippingaddressentity);
	void updateAccountOne(UserEntity userentity);

}
