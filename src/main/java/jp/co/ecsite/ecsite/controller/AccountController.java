package jp.co.ecsite.ecsite.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
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
	@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="registerpayment")
	public String paymentmethodentity(@Validated @ModelAttribute PaymentMethodModel pmModel,BindingResult result,@ModelAttribute("login") UserStoreEntity userstoreentity,  Model model) {
		if(result.hasErrors()) {
			UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
			List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
			List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

			model.addAttribute("accountinfo" ,accountinfo);
			model.addAttribute("shippinginfo" ,shippinginfo);
			model.addAttribute("paymentinfo" ,paymentinfo);
			return "accountupdate";
		}

		PaymentMethodEntity paymentmethodentity = new PaymentMethodEntity();



		//カレンダーの生成
		Calendar calendar = Calendar.getInstance();

		//月と年の取得
		int iyear = Integer.valueOf(pmModel.getExpiration_year());
		int imonth= Integer.valueOf(pmModel.getExpiration_month());
		calendar.set(iyear, imonth-1, 1);

		//月の最終日を取得する
		int dayMax = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);



		//int型からString型に変換して、結合
		String year = String.valueOf(iyear);
		String month= String.valueOf(imonth);
		String day  = String.valueOf(dayMax);

		String ex_date = year +"-"+ month +"-"+ day;




		//日付の書式変換
		Date expiration_date =  Date.valueOf(ex_date);

		paymentmethodentity.setUser_id(userstoreentity.getUser_id());
		paymentmethodentity.setPayment_method(pmModel.getPayment_method());
		paymentmethodentity.setCard_number(pmModel.getCard_number());
		paymentmethodentity.setExpiration_date(expiration_date);
		paymentmethodentity.setCard_holder_name(pmModel.getCard_holder_name());

		accountService.insertPayOne(paymentmethodentity);

		UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
		List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
		List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

		model.addAttribute("accountinfo" ,accountinfo);
		model.addAttribute("shippinginfo" ,shippinginfo);
		model.addAttribute("paymentinfo" ,paymentinfo);

		return "accountupdate";


	}


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
	public String updatePaymentMethod(@Validated @ModelAttribute PaymentMethodModel pmModel, BindingResult result,@ModelAttribute("login") UserStoreEntity userstoreentity, Model model) {
		if(result.hasErrors()) {
			UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
			List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
			List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

			model.addAttribute("accountinfo" ,accountinfo);
			model.addAttribute("shippinginfo" ,shippinginfo);
			model.addAttribute("paymentinfo" ,paymentinfo);
			return "accountupdate";
		}

		PaymentMethodEntity paymentmethodentity = new PaymentMethodEntity();

		//カレンダーの生成
		Calendar calendar = Calendar.getInstance();

		//月と年の取得
		int iyear = Integer.valueOf(pmModel.getExpiration_year());
		int imonth= Integer.valueOf(pmModel.getExpiration_month());
		calendar.set(iyear, imonth, 1);

		//月の最終日を取得する
		int dayMax = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);


		//String型に変換して、結合
		String year = pmModel.getExpiration_year();
		String month= pmModel.getExpiration_month();
		String day  = String.valueOf(dayMax);

		String ex_date = year+"-" + month +"-"+ day;


		//日付の書式変換

		//Date型に変換
		Date expiration_date =  Date.valueOf(ex_date);
		paymentmethodentity.setPayment_no(Integer.valueOf(pmModel.getPayment_no()));
		paymentmethodentity.setPayment_method(pmModel.getPayment_method());
		paymentmethodentity.setCard_number(pmModel.getCard_number());
		paymentmethodentity.setExpiration_date(expiration_date);
		paymentmethodentity.setCard_holder_name(pmModel.getCard_holder_name());

		accountService.updatePayOne(paymentmethodentity);

		UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
		List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
		List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

		model.addAttribute("accountinfo" ,accountinfo);
		model.addAttribute("shippinginfo" ,shippinginfo);
		model.addAttribute("paymentinfo" ,paymentinfo);

		return "accountupdate";
	}




	//お届け先の追加（登録）するメソッド
	@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="registershipping")
	public String registShippingAddress(@Validated @ModelAttribute ShippingAddressModel saModel,BindingResult result, @ModelAttribute("login") UserStoreEntity userstoreentity, Model model) {
		ShippingAddressEntity shippingaddressentity = new ShippingAddressEntity();


		shippingaddressentity.setUser_id(userstoreentity.getUser_id());
		shippingaddressentity.setPostal_code(saModel.getPostal_code());
		shippingaddressentity.setAddress1(saModel.getAddress1());
		shippingaddressentity.setAddress2(saModel.getAddress2());
		shippingaddressentity.setPhone_number(saModel.getPhone_number());
		shippingaddressentity.setShipping_address_name(saModel.getShipping_address_name());

		accountService.insertAddressOne(shippingaddressentity);

		UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
		List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
		List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

		model.addAttribute("accountinfo" ,accountinfo);
		model.addAttribute("shippinginfo" ,shippinginfo);
		model.addAttribute("paymentinfo" ,paymentinfo);
		return "accountupdate";


	}





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
	@RequestMapping(value= "/accountupdate", method=RequestMethod.POST, params="updateshipping")
	public String updateShippingAddress(@Validated @ModelAttribute("login") UserStoreEntity userstoreentity,BindingResult result, ShippingAddressModel saModel, Model model) {

		ShippingAddressEntity shippingaddressentity = new ShippingAddressEntity();
		shippingaddressentity.setShipping_address_no(Integer.valueOf(saModel.getShipping_address_no()));
		shippingaddressentity.setPostal_code(saModel.getPostal_code());
		shippingaddressentity.setAddress1(saModel.getAddress1());
		shippingaddressentity.setAddress2(saModel.getAddress2());
		shippingaddressentity.setPhone_number(saModel.getPhone_number());
		shippingaddressentity.setShipping_address_name(saModel.getShipping_address_name());

		accountService.updateAddressOne(shippingaddressentity);

		UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
		List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
		List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

		model.addAttribute("accountinfo" ,accountinfo);
		model.addAttribute("shippinginfo" ,shippinginfo);
		model.addAttribute("paymentinfo" ,paymentinfo);

		return "accountupdate";
	}

	//アカウント情報を更新するメソッド
		@RequestMapping(value="/accountupdate",method =RequestMethod.POST,params="update")
		public String updateAccountInfo(@Validated@ModelAttribute AccountModel aModel, BindingResult result, @ModelAttribute("login") UserStoreEntity userstoreentity,  Model model) {

			if(result.hasErrors()) {

				List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
				List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

				model.addAttribute("shippinginfo" ,shippinginfo);
				model.addAttribute("paymentinfo" ,paymentinfo);

				return "accountupdate";
			}


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
			return "accountupdate";
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