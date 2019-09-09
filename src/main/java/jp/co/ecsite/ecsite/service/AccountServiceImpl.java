package jp.co.ecsite.ecsite.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jp.co.ecsite.ecsite.entity.PaymentMethodEntity;
import jp.co.ecsite.ecsite.entity.ShippingAddressEntity;
import jp.co.ecsite.ecsite.entity.UserEntity;
import jp.co.ecsite.ecsite.repository.AccountRepository;

@Service
public class AccountServiceImpl implements AccountService {

	 @Autowired
	AccountRepository accountRepository;

	@Override
	public void insertPayOne(PaymentMethodEntity paymentmethodentity) {
		accountRepository.insertPayOne(paymentmethodentity);
	}

	@Override
	 public void deletePayOne(int payment_no) {
		accountRepository.deletePayOne(payment_no);
	}

	@Override
	public void updatePayOne(PaymentMethodEntity paymentmethodentity) {
		accountRepository.updatePayOne(paymentmethodentity);
	}

	@Override
	public void insertAddressOne(ShippingAddressEntity shippingaddressentity) {
		accountRepository.insertAddressOne(shippingaddressentity);
	}

	@Override
	public void deleteAddressOne(int shipping_address_no) {
		accountRepository.deleteAddressOne(shipping_address_no);
	}

	@Override
	public void updateAddressOne(ShippingAddressEntity shippingaddressentity) {
		accountRepository.updateAddressOne(shippingaddressentity);
	}


	@Override
	public void updateAccountOne(UserEntity userentity) {
		accountRepository.updateAccountOne(userentity);
	}

}
