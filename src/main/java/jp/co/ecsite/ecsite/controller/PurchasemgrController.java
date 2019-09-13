package jp.co.ecsite.ecsite.controller;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import jp.co.ecsite.ecsite.entity.PaymentMethodEntity;
import jp.co.ecsite.ecsite.entity.ProductCartEntity;
import jp.co.ecsite.ecsite.entity.ProductEntity;
import jp.co.ecsite.ecsite.entity.ShippingAddressEntity;
import jp.co.ecsite.ecsite.entity.UserEntity;
import jp.co.ecsite.ecsite.entity.UserStoreEntity;
import jp.co.ecsite.ecsite.model.ProductCartModel;
import jp.co.ecsite.ecsite.service.MypageService;
import jp.co.ecsite.ecsite.service.ProdCartService;
import jp.co.ecsite.ecsite.service.ProdmgrService;

@Controller
@SessionAttributes("login")
public class PurchasemgrController {

	@ModelAttribute("productCartModel")
	public ProductCartModel setUpProductCartModel() {
		return new ProductCartModel();
	}

	@Autowired
	ProdmgrService prodmgrService;

	@Autowired
	ProdCartService prodCartService;

	@Autowired
	MypageService mypageService;

	//商品カート更新画面に遷移させるメソッド
	@RequestMapping(value= {"/productcart","/purchasehistory"}, method=RequestMethod.POST, params="preupdate")
	public String toCartUpdate(Model model, @ModelAttribute ProductCartModel productCartModel) {
		ProductCartEntity cart = new ProductCartEntity();
		cart.setProduct_cart_id(Integer.parseInt(productCartModel.getProduct_cart_id()));
		cart.setProduct_id(productCartModel.getProduct_id());
		cart.setPrice(new BigDecimal(productCartModel.getPrice()));
		cart.setQuantity(Integer.parseInt(productCartModel.getQuantity()));
		cart.setSize(productCartModel.getSize());
		cart.setColor(productCartModel.getColor());
		model.addAttribute("cart", cart);

		ProductEntity productentity =prodmgrService.productDetail(productCartModel.getProduct_id());
		List<String> colorlist =Arrays.asList(productentity.getColor().split(","));
		model.addAttribute("colorlist", colorlist);
		List<String> sizelist =Arrays.asList(productentity.getSize().split(","));
		model.addAttribute("sizelist", sizelist);
		return "cartupdate";
	}

	//商品カートを更新するメソッド
	@RequestMapping(value= {"/productcart","/purchasehistory"}, method=RequestMethod.POST, params="update")
	public String updateCart(@ModelAttribute ProductCartModel productCartModel, @ModelAttribute("login") UserStoreEntity userstoreentity, Model model) {
		ProductCartEntity cart = new ProductCartEntity();
		cart.setProduct_cart_id(Integer.parseInt(productCartModel.getProduct_cart_id()));
		cart.setQuantity(Integer.parseInt(productCartModel.getQuantity()));
		cart.setSize(productCartModel.getSize());
		cart.setColor(productCartModel.getColor());
		prodCartService.updateCart(cart);

		//MypageController returncart = new MypageController();
		//return returncart.toCart(userstoreentity, model);

		List<ProductCartEntity> cartlist = mypageService.cartAll(userstoreentity);
		model.addAttribute("cartlist" , cartlist);
		return "productcart";
	}

	//商品カートを削除するメソッド
	@RequestMapping(value= {"/productcart","/purchasehistory"}, method=RequestMethod.POST, params="delete")
	public String deleteCart(@ModelAttribute ProductCartModel productCartModel, @ModelAttribute("login") UserStoreEntity userstoreentity, Model model) {

		prodCartService.deleteCart(Integer.parseInt(productCartModel.getProduct_cart_id()));

		//MypageController returncart = new MypageController();
		//return returncart.toCart(userstoreentity, model);

		List<ProductCartEntity> cartlist = mypageService.cartAll(userstoreentity);
		model.addAttribute("cartlist" , cartlist);
		return "productcart";
	}

	//商品購入画面に遷移するメソッド
	@RequestMapping(value= {"/productcart", "/purchasehistory", "/detail"}, method=RequestMethod.POST, params="prepurchase")
	public String toProductBuy(@ModelAttribute ProductCartModel productCartModel, @ModelAttribute("login") UserStoreEntity userstoreentity, Model model) {

	ProductCartEntity cart = new ProductCartEntity();
	//cart.setProduct_cart_id(Integer.parseInt(productCartModel.getProduct_cart_id()));
	cart.setProduct_name(productCartModel.getProduct_name());
	cart.setPrice(new BigDecimal(productCartModel.getPrice()));
	cart.setQuantity(Integer.parseInt(productCartModel.getQuantity()));
	cart.setSize(productCartModel.getSize());
	cart.setColor(productCartModel.getColor());

	model.addAttribute("cart", cart);

	ProductEntity productentity =prodmgrService.productDetail(productCartModel.getProduct_id());
	List<String> colorlist =Arrays.asList(productentity.getColor().split(","));
	model.addAttribute("colorlist", colorlist);
	List<String> sizelist =Arrays.asList(productentity.getSize().split(","));
	model.addAttribute("sizelist", sizelist);

	UserEntity accountinfo = mypageService.accountInfo(userstoreentity);
	List<ShippingAddressEntity> shippinginfo = mypageService.shippingInfo(userstoreentity);
	List<PaymentMethodEntity> paymentinfo = mypageService.paymentInfo(userstoreentity);

	model.addAttribute("accountinfo" ,accountinfo);
	model.addAttribute("shippinginfo" ,shippinginfo);
	model.addAttribute("paymentinfo" ,paymentinfo);

	return "productbuy";

	}

	//注文ボタンを押したとき。
	@RequestMapping(value="/productcart",method=RequestMethod.POST,params="purchase")
	public String purchase(@ModelAttribute("login") UserStoreEntity userstoreentity, @ModelAttribute ProductCartModel productCartModel, Model model) {

	//購入履歴に一件データを挿入する処理
	ProductCartEntity cart = new ProductCartEntity();
	cart.setUser_id(userstoreentity.getUser_id());
	cart.setProduct_id(productCartModel.getProduct_id());
	cart.setQuantity(Integer.parseInt(productCartModel.getQuantity()));
	cart.setSize(productCartModel.getSize());
	cart.setColor(productCartModel.getColor());
	cart.setPayment_method(productCartModel.getPayment_method());
	cart.setPayment_no(Integer.parseInt(productCartModel.getPayment_no()));
	cart.setShipping_address_no(Integer.parseInt(productCartModel.getShipping_address_no()));

	prodCartService.insertHistoryOne(cart);

	//商品カートから一件データを削除する処理
	return this.deleteCart(productCartModel, userstoreentity, model);

	}

	//カートに追加する処理
	@RequestMapping(value= {"/purchasehistory","/delete"}, method=RequestMethod.POST, params="addcart")
	public String addcart(@ModelAttribute("login") UserStoreEntity userstoreentity, @ModelAttribute ProductCartModel productCartModel, Model model) {
			ProductCartEntity history = new ProductCartEntity();
			history.setUser_id(userstoreentity.getUser_id());
			history.setProduct_id(productCartModel.getProduct_id());
			history.setQuantity(Integer.parseInt(productCartModel.getQuantity()));
			history.setSize(productCartModel.getSize());
			history.setColor(productCartModel.getColor());

			prodCartService.insertCart(history);

			List<ProductCartEntity> cartlist = mypageService.cartAll(userstoreentity);
			model.addAttribute("cartlist" , cartlist);
			return "productcart";
	}

	//注文キャンセル確認画面に遷移させるメソッド
	@RequestMapping(value="/purchasehistory", method=RequestMethod.POST, params="cancelorder")
	public String toCancelOrder(@ModelAttribute ProductCartModel productCartModel, Model model) {
		ProductCartEntity deleteconfirm = prodCartService.findResultOne(Integer.parseInt(productCartModel.getOrder_no()));
		model.addAttribute("deleteconfirm", deleteconfirm);
		return "deleteconfirm";
	}

	//注文キャンセルをするメソッド
	@RequestMapping(value="/purchasehistory", method=RequestMethod.POST, params="cancel")
	public String cancelOrder(@ModelAttribute ProductCartModel productCartModel, @ModelAttribute("login") UserStoreEntity userstoreentity, Model model) {
		prodCartService.changeResultOne(Integer.parseInt(productCartModel.getOrder_no()));

		//MypageController returnpurchase = new MypageController();
		//return returnpurchase.toPurchasehistory(userstoreentity, model);

		List<ProductCartEntity> purchaselist = mypageService.purchasehistoryAll(userstoreentity);
		model.addAttribute("purchaselist", purchaselist);
		return "purchasehistory";
	}

}