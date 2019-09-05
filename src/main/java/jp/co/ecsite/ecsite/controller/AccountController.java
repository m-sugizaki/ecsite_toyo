package jp.co.ecsite.ecsite.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

import jp.co.ecsite.ecsite.entity.PaymentMethodEntity;
import jp.co.ecsite.ecsite.model.AccountModel;
import jp.co.ecsite.ecsite.model.PaymentMethodModel;
import jp.co.ecsite.ecsite.model.ShippingAddressModel;
import jp.co.ecsite.ecsite.service.AccountService;
import jp.co.ecsite.ecsite.service.MypageService;

@Controller
public class AccountController  {

	@Autowired
	AccountService accountService;

	@Autowired
	MypageService mypageService;

	@ModelAttribute("userModel")
	public AccountModel setUpfindAccountOne() {
		return new AccountModel();
	}

	@ModelAttribute("paymentMethodModel")
	public PaymentMethodModel insertPayOne(PaymentMethodEntity paymentmethodentity) {
		return new PaymentMethodModel();
	}

	@ModelAttribute("shippingAdderessModel")
	public ShippingAddressModel setUpdeletePayOne(PaymentMethodEntity paymentmethodentity) {
		return new ShippingAddressModel();
	}

/*	//アカウント情報からアカウント情報更新の画面遷移（変更のボタンを押したとき）
		@RequestMapping(value="/accountupdata", method=RequestMethod.GET )
		public String toAccountUpdate(UserStoreEntity userstoreentity , Model model) {
		UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
		List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
		List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

		model.addAttribute("accountinfo" ,accountinfo);
		model.addAttribute("shippinginfo" ,shippinginfo);
		model.addAttribute("paymentinfo" ,paymentinfo);
		return "accountupdate";
	}



	//支払い情報を登録（追加）するメソッド
		@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="registerpayment")
		public String registPaymentMethod() {

			return "accountupdate";
		}

	//支払い情報を削除するメソッド
	@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="registerpayment")
		public String deletePaymentMethod(){
			return "accountupdate";
		}

	//支払い情報を更新するメソッド
	@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="updatepayment")
		public String updatePaymentMethod() {
			return "accountupdate";

	}
	//お届け先の追加（登録）するメソッド
	@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="registershipping")
	public String registShippingAddress() {

		return "accountupdate";
	}
	//お届け先を削除するメソッド
	@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="deleteshipping")
	public String deleteShippingAddress() {

		return "accountupdate";
	}

	//お届け先を更新するメソッド
	@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="updateshipping")
	public String updateShippingAddress() {

		return "accountupdate";
	}

	//アカウント情報、支払い情報、お届け先情報を更新するメソッド
	@RequestMapping(value="/accountupdate",method =RequestMethod.POST,params="updateaccount")
	public String updateAccountInfo() {

		return "account";
	}
	//アカウント情報、支払い情報、お届け先情報を更新せずにアカウント情報画面に遷移させるメソッド
		@RequestMapping(value="/accountupdate",method =RequestMethod.POST,params="updateaccount")
			public String canceltoAccount(UserStoreEntity userstoreentity , Model model) {
			UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
			List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
			List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

			model.addAttribute("accountinfo" ,accountinfo);
			model.addAttribute("shippinginfo" ,shippinginfo);
			model.addAttribute("paymentinfo" ,paymentinfo);{

					return "account";
				}
*/


}


