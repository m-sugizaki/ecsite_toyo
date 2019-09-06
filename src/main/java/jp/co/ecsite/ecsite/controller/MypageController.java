package jp.co.ecsite.ecsite.controller;

import java.sql.Date;
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
import jp.co.ecsite.ecsite.entity.ShippingAddressEntity;
import jp.co.ecsite.ecsite.entity.UserEntity;
import jp.co.ecsite.ecsite.entity.UserStoreEntity;
import jp.co.ecsite.ecsite.model.NewUserModel;
import jp.co.ecsite.ecsite.model.ProdmgrModel;
import jp.co.ecsite.ecsite.model.ProductCartModel;
import jp.co.ecsite.ecsite.model.UserModel;
import jp.co.ecsite.ecsite.service.MypageService;

//9/5 13:50 高橋
//9/5 14:35 高橋



@Controller                               // /homeのアクセスでクラスが動作
@SessionAttributes("login")           // 引数のキーワードでセッションオブジェクトを格納
public class MypageController {

	@Autowired
	MypageService mypageService;

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
	@RequestMapping(value= {"/home","/search"} , method=RequestMethod.POST, params="login")
	public String doLogin(@Validated @ModelAttribute UserModel uModel , BindingResult result ,  Model model) {
		if(result.hasErrors()) {
			return "mypage";
		}
		UserStoreEntity login = mypageService.login(uModel.getUser_id() , uModel.getPassword());
		if(login == null) {
			model.addAttribute("errormessage" , "ユーザーIDもしくはパスワードが間違っています。");
			return "mypage";
		}
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

	/*@RequestMapping(value="/home", method=RequestMethod.POST, params="out")
	public String cansel() {
		return "redirect:/home";
	}*/

	/*@RequestMapping(value="productcart" , method=RequestMethod.GET , params="cart")
	public String toCart(@ModelAttribute UserStoreEntity userStoreEntity , Model model) {
		List<ProductCartEntity> cart = mypageService.cartAll(userStoreEntity);
		model.addAttribute("cart" , cart);
		return "productcart";
	}*/

	/*@RequestMapping(value="/home" , method=RequestMethod.GET , params="purchasehistory")
	public String to(@ModelAttribute UserStoreEntity userStoreEntity , Model model) {
		List<PurchaseResultsEntity> purchase = MypageService.purchasehistoryAll(userStoreEntity);
		model.addAttribute("purchase", purchase);
 	"purchasehistory";
	}*/

	/*@RequestMapping(value="/home" , method=RequestMethod.GET , params="account")
	public String to(@ModelAttribute UserStoreEntity userStoreEntity , Model model) {
		UserEntity account = MypageService.accountInfo(userStoreEntity);
		model.addAttribute("account", account);
		 //ユーザーIDに一致する支払方法と届け先を取得するものを加える
 		return "account";
	}*/



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

			UserEntity logincheck = mypageService.accountInfo(userstoreentity);
			if(logincheck != null) {
				model.addAttribute("message" , "既に登録されたユーザーです。");
				return "newaccount";
			}

			mypageService.newUser(userentity);
			mypageService.newUserStore(userstoreentity);
			mypageService.dateInsert(userstoreentity);

			UserStoreEntity login = mypageService.login(userstoreentity.getUser_id() ,userstoreentity.getPassword());

			model.addAttribute("login" , login);

			return "mypage";


		}
	@RequestMapping(value="/regist" , method=RequestMethod.POST, params="back")
	public String canselRegist() {
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