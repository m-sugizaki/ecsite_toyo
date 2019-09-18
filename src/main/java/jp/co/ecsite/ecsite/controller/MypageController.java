package jp.co.ecsite.ecsite.controller;

import java.sql.Date;
import java.time.format.DateTimeFormatter;
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
import org.springframework.web.bind.support.SessionStatus;

import jp.co.ecsite.ecsite.entity.PaymentMethodEntity;
import jp.co.ecsite.ecsite.entity.ProductCartEntity;
import jp.co.ecsite.ecsite.entity.ShippingAddressEntity;
import jp.co.ecsite.ecsite.entity.UserEntity;
import jp.co.ecsite.ecsite.entity.UserStoreEntity;
import jp.co.ecsite.ecsite.model.NewUserModel;
import jp.co.ecsite.ecsite.model.ProdmgrModel;
import jp.co.ecsite.ecsite.model.ProductCartModel;
import jp.co.ecsite.ecsite.model.UserModel;
import jp.co.ecsite.ecsite.service.AccountService;
import jp.co.ecsite.ecsite.service.MypageService;

//9/5 13:50 高橋
//9/5 14:35 高橋



@Controller                               // /homeのアクセスでクラスが動作
@SessionAttributes({"login","formatedlogin_dt"})           // 引数のキーワードでセッションオブジェクトを格納
public class MypageController {

	@Autowired
	MypageService mypageService;

	@Autowired
	AccountService accountService;

	@ModelAttribute("userModel")
	public UserModel setUpUserInfo() {
		return new UserModel();
	}

	@ModelAttribute("newUserModel")
	public NewUserModel setUpNewUserInfo() {
		return new NewUserModel();
	}

	@ModelAttribute("prodmgrModel")
	public ProdmgrModel setUpProdModel() {
		return new ProdmgrModel();
	}

	@ModelAttribute("productCartModel")
	public ProductCartModel setUpProdcart() {
		return new ProductCartModel();
	}

	//起動時にマイページに遷移
	@RequestMapping(value="/home" , method=RequestMethod.GET)
	public String toHome() {
		return "mypage";
	}

	//ログインチェック
	@RequestMapping(value= {"/home","/search","/regist"} , method=RequestMethod.POST, params="login")
	public String doLogin(@Validated @ModelAttribute UserModel uModel , BindingResult result ,  Model model) {
		if(result.hasErrors()) {
			return "mypage";
		}
		UserStoreEntity login = mypageService.login(uModel.getUser_id() , uModel.getPassword());
		if(login.getName() == null || !(uModel.getUser_id().equals(login.getUser_id())) || !(uModel.getPassword().equals(login.getPassword()))) {
			model.addAttribute("errormessage" , "ユーザーIDもしくはパスワードが間違っています。");
			return "mypage";
		}

	    //ログイン日時の表示書式の変更///////////////////////////////////////////////////
		//書式を指定
		DateTimeFormatter datetimeformatter = DateTimeFormatter.ofPattern("yyyy/MM/dd  HH:mm");
		//指定の書式に日付データを渡す
		String formatedlogin_dt = datetimeformatter.format(login.getLogin_dt());
        //フォーマットした日付データをmodelに登録（セッション）
		model.addAttribute("formatedlogin_dt",formatedlogin_dt);
		/////////////////////////////////////////////////////

		mypageService.dateUpdate(login);
		model.addAttribute("login",login);

		if(uModel.getHid().equals("1")) {
			return "mypage";
		}else if(uModel.getHid().equals("2")) {
			return "search";
		}else {
			return "detail";
		}

	}


	//カート画面への遷移処理
	@RequestMapping(value="/productcart" , method=RequestMethod.GET)
	public String toCart(@ModelAttribute("login") UserStoreEntity userstoreentity , Model model) {
		List<ProductCartEntity> cartlist = mypageService.cartAll(userstoreentity);
		model.addAttribute("cartlist" , cartlist);
		return "productcart";
	}

	//購入履歴画面への遷移処理
	@RequestMapping(value="/purchasehistory" , method=RequestMethod.GET)
	public String toPurchasehistory(@ModelAttribute("login") UserStoreEntity userStoreEntity, Model model) {
		List<ProductCartEntity> purchaselist = mypageService.purchasehistoryAll(userStoreEntity);
		model.addAttribute("purchaselist", purchaselist);
		return "purchasehistory";
	}



	//ログアウト処理
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String dologout(SessionStatus status) {
		status.setComplete();
		return "redirect:/home";
	}

	//アカウント登録画面への遷移
	@RequestMapping(value="/regist", method=RequestMethod.GET)
	String toNewAccount() {
		return "newaccount";
	}


	//新規アカウント登録処理
	@RequestMapping(value="/regist" , method=RequestMethod.POST, params="regist")
	public String toRegist(@Validated @ModelAttribute NewUserModel nuModel , BindingResult result ,  Model model) {
			if(result.hasErrors()) {
				return "newaccount";
			}

			if(!nuModel.getPassword().equals(nuModel.getPassword2())) {
				model.addAttribute("message","確認用パスワードが間違っています。");
				return "newaccount";
			}

			Date birthday = Date.valueOf(nuModel.getBirthday());
			UserStoreEntity userstoreentity = new UserStoreEntity();
			userstoreentity.setUser_id(nuModel.getUser_id());
			userstoreentity.setPassword(nuModel.getPassword());

			UserEntity logincheck = mypageService.accountInfo(userstoreentity);
		
			if(logincheck != null) {
				model.addAttribute("message" , "既に登録されたユーザーです。");
				return "newaccount";
			}
			//アカウント情報
			UserEntity userentity = new UserEntity();
			userentity.setUser_id(nuModel.getUser_id());
			userentity.setName(nuModel.getName());
			userentity.setNickname(nuModel.getNickname());
			userentity.setPostal_code(nuModel.getPostal_code());
			userentity.setAddress1(nuModel.getAddress1());
			userentity.setAddress2(nuModel.getAddress2());
			userentity.setPhone_number(nuModel.getPhone_number());
			userentity.setEmail(nuModel.getEmail());
			userentity.setBirthday(birthday);

			//支払い情報
			PaymentMethodEntity paymentmethodentity = new PaymentMethodEntity();
			//カレンダーの生成
			Calendar calendar = Calendar.getInstance();
			//月と年の取得
			int iyear = Integer.valueOf(nuModel.getExpiration_year());
			int imonth= Integer.valueOf(nuModel.getExpiration_month());
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
			paymentmethodentity.setUser_id(nuModel.getUser_id());
			paymentmethodentity.setPayment_method(nuModel.getPayment_method());
			paymentmethodentity.setCard_number(nuModel.getCard_number());
			paymentmethodentity.setExpiration_date(expiration_date);
			paymentmethodentity.setCard_holder_name(nuModel.getCard_holder_name());

			//お届け先情報
			ShippingAddressEntity shippingaddressentity = new ShippingAddressEntity();

			shippingaddressentity.setUser_id(nuModel.getUser_id());
			shippingaddressentity.setPostal_code(nuModel.getPostal_code());
			shippingaddressentity.setAddress1(nuModel.getAddress1());
			shippingaddressentity.setAddress2(nuModel.getAddress2());
			shippingaddressentity.setPhone_number(nuModel.getPhone_number());
			shippingaddressentity.setShipping_address_name(nuModel.getShipping_address_name());

			//各サービスを呼び出し登録する処理
			mypageService.newUser(userentity);
			mypageService.newUserStore(userstoreentity);
			accountService.insertPayOne(paymentmethodentity);
			accountService.insertAddressOne(shippingaddressentity);
			mypageService.dateInsert(userstoreentity);

			UserStoreEntity login = mypageService.login(userstoreentity.getUser_id() ,userstoreentity.getPassword());

			model.addAttribute("login" , login);

			return "mypage";


		}



	@RequestMapping(value="/account", method=RequestMethod.GET)
	String toAccountmgr(@ModelAttribute("login") UserStoreEntity userstoreentity , Model model) {

		UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
		List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
		List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

		model.addAttribute("accountinfo" ,accountinfo);
		model.addAttribute("shippinginfo" ,shippinginfo);
		model.addAttribute("paymentinfo" ,paymentinfo);
		return "account";
	}

}