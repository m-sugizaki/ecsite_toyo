package jp.co.ecsite.ecsite.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import jp.co.ecsite.ecsite.entity.PaymentMethodEntity;
import jp.co.ecsite.ecsite.entity.ShippingAddressEntity;
import jp.co.ecsite.ecsite.entity.UserEntity;
import jp.co.ecsite.ecsite.entity.UserStoreEntity;
import jp.co.ecsite.ecsite.model.AccountModel;
import jp.co.ecsite.ecsite.model.PaymentMethodModel;
import jp.co.ecsite.ecsite.model.ShippingAddressModel;
import jp.co.ecsite.ecsite.model.UserModel;
import jp.co.ecsite.ecsite.service.AccountService;
import jp.co.ecsite.ecsite.service.MypageService;

@Controller
@SessionAttributes("login")           // 引数のキーワードでセッションオブジェクトを格納
public class AccountController  {

	@Autowired
	AccountService accountService;

	@Autowired
	MypageService mypageService;

	@ModelAttribute("userModel")
	public UserModel setUpaccountInfo() {
		return new UserModel();
	}

	@ModelAttribute("accountModel")
	public AccountModel setUpupdateAccountOne() {
		return new AccountModel();
	}

	@ModelAttribute("paymentMethodModel")
	public PaymentMethodModel insertPayOne(PaymentMethodEntity paymentmethodentity) {
		return new PaymentMethodModel();
	}

	@ModelAttribute("shippingAddressModel")
	public ShippingAddressModel setUpdeletePayOne(PaymentMethodEntity paymentmethodentity) {
		return new ShippingAddressModel();
	}

	//アカウント情報からアカウント情報更新の画面遷移（変更のボタンを押したとき）
	@RequestMapping(value="/accountupdate", method=RequestMethod.GET )
	public String toaccountInfo(@ModelAttribute("login") UserStoreEntity userstoreentity , Model model) {

		UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
		List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
		List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

		model.addAttribute("accountinfo" ,accountinfo);
		model.addAttribute("shippinginfo" ,shippinginfo);
		model.addAttribute("paymentinfo" ,paymentinfo);
		return "accountupdate";
	}



	//支払い情報を登録（追加）するメソッド
	/*@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="registerpayment")
	public String registPaymentMethod(@Validated @ModelAttribute PaymentMethodModel pmModel , BindingResult result ,  Model model) {

		PaymentMethodEntity paymentmethodentity = new PaymentMethodEntity();

		Date expiration_date = Date.valueOf(pmModel.getExpiration_month());

		paymentmethodentity.setUser_id(pmModel.getUser_id());
		//paymentmethodentity.setPayment_no(pmModel.Integer.parseInt.getPayment_no()); //型変換必要？？
		paymentmethodentity.setPayment_method(pmModel.getPayment_method());
		paymentmethodentity.setCard_number(pmModel.getCard_number());
		paymentmethodentity.setExpiration_date();  //結合必要
		paymentmethodentity.setCard_holder_name(pmModel.getCard_holder_name());

		return "accountupdate";
	}*/

	//支払い情報を削除するメソッド
	@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="deletepayment")
	public String deletePaymentMethod(@ModelAttribute PaymentMethodModel paymentmethodmodel, @ModelAttribute("login") UserStoreEntity userstoreentity, Model model) {
			accountService.deletePayOne(Integer.parseInt(paymentmethodmodel.getPayment_no()));

		UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
		List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
		List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

		model.addAttribute("accountinfo" ,accountinfo);
		model.addAttribute("shippinginfo" ,shippinginfo);
		model.addAttribute("paymentinfo" ,paymentinfo);



			return "accountupdate";
	}

	//支払い情報を更新するメソッド
	@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="updatepayment")
	public String updatePaymentMethod() {
		return "accountupdate";

	}


	//お届け先の追加（登録）するメソッド
	/*	@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="registershipping")
	public String registShippingAddress(@ModelAttribute ShippingAddressModel shippingAddressModel,
			@ModelAttribute("login")UserStoreEntity userstoreentity,Model model) {
		ShippingAddressEntity entity = new ShippingAddressEntity();
		entity.setUser_id(userstoreentity.getUser_id());
		entity.setShipping_address_no(Integer.parseInt(shippingAddressModel.getShipping_address_no()));
		entity.setPostal_code(shippingAddressModel.getPostal_code());
		entity.setAddress1(shippingAddressModel.getAddress1());
		entity.setAddress2(shippingAddressModel.getAddress2());
		entity.setPhone_number(shippingAddressModel.getPhone_number());
		entity.setShipping_address_name(shippingAddressModel.getShipping_address_name());

		return "accountupdate";
	}*/





	//お届け先を削除するメソッド
		@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="deleteshipping")
		public String deleteShippingAddress(@ModelAttribute ShippingAddressModel shippingaddressmodel, @ModelAttribute("login") UserStoreEntity userstoreentity, Model model) {
			accountService.deleteAddressOne(Integer.parseInt(shippingaddressmodel.getShipping_address_no()));

			UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
			List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
			List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

			model.addAttribute("accountinfo" ,accountinfo);
			model.addAttribute("shippinginfo" ,shippinginfo);
			model.addAttribute("paymentinfo" ,paymentinfo);


			return "accountupdate";
		}



	//お届け先を更新するメソッド
/*	@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="updateshipping")
	public String updateShippingAddress(@ModelAttribute("login") UserStoreEntity userstoreentity, ShippingAddressEntity saModel, Model model) {

		ShippingAddressEntity shippinaddressgentity = new ShippingAddressEntity();

		shippinaddressgentity.setUser_id(userstoreentity.getUser_id());
		shippinaddressgentity.setShipping_address_no(Integer.valueOf(saModel.getShipping_address_no()));
		shippinaddressgentity.setPostal_code(saModel.getPostal_code());
		shippinaddressgentity.setAddress1(saModel.getAddress1());
		shippinaddressgentity.setAddress2(saModel.getAddress2());
		shippinaddressgentity.setPhone_number(saModel.getPhone_number());
		shippinaddressgentity.setShipping_address_name(saModel.getShipping_address_name());

		accountService.updateAddressOne(shippinaddressgentity);

		UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
		List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
		List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

		model.addAttribute("accountinfo" ,accountinfo);
		model.addAttribute("shippinginfo" ,shippinginfo);
		model.addAttribute("paymentinfo" ,paymentinfo);

		return "accountupdate";
	}
*/
	//アカウント情報を更新するメソッド
	@RequestMapping(value="/accountupdate",method =RequestMethod.POST,params="update")
	public String updateAccountInfo(@ModelAttribute("login") UserStoreEntity userstoreentity ,AccountModel aModel, Model model) {

		String userbirthday = (aModel.getBirthday());
		Date birthday =java.sql.Date.valueOf(userbirthday);

		UserEntity userentity = new UserEntity();

		userentity.setUser_id(userstoreentity.getUser_id());
		userentity.setName(aModel.getName());
		userentity.setNickname(aModel.getNickname());
		userentity.setPostal_code(aModel.getPostal_code());
		userentity.setAddress1(aModel.getAddress1());
		userentity.setAddress2(aModel.getAddress2());
		userentity.setPhone_number(aModel.getPhone_number());
		userentity.setEmail(aModel.getEmail());
		userentity.setBirthday(birthday);

		accountService.updateAccountOne(userentity) ;

		UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
		List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
		List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

		model.addAttribute("accountinfo" ,accountinfo);
		model.addAttribute("shippinginfo" ,shippinginfo);
		model.addAttribute("paymentinfo" ,paymentinfo);
		return "account";
	}

	//(キャンセル)アカウント情報を更新せずにアカウント情報画面に遷移させるメソッド
	@RequestMapping(value="/accountupdate",method =RequestMethod.POST,params="cancel")
	public String canceltoAccount(@ModelAttribute("login") UserStoreEntity userstoreentity , Model model) {

		UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
		List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
		List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

		model.addAttribute("accountinfo" ,accountinfo);
		model.addAttribute("shippinginfo" ,shippinginfo);
		model.addAttribute("paymentinfo" ,paymentinfo);{

			return "account";
		}
}
}