package jp.co.ecsite.ecsite.controller;

import java.util.Arrays;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jp.co.ecsite.ecsite.entity.ProductEntity;
import jp.co.ecsite.ecsite.entity.ProductSearchEntity;
import jp.co.ecsite.ecsite.entity.ProductSearchResultsEntity;
import jp.co.ecsite.ecsite.entity.ReviewEntity;
import jp.co.ecsite.ecsite.model.ProdmgrModel;
import jp.co.ecsite.ecsite.model.ProductCartModel;
import jp.co.ecsite.ecsite.model.UserModel;
import jp.co.ecsite.ecsite.service.ProdmgrService;
//テスト

@Controller
public class ProductmgrController {

	@Autowired
	ProdmgrService prodmgrService;

	@ModelAttribute("userModel")
	public UserModel setUpUserInfo() {
		return new UserModel();
	}

	@ModelAttribute("prodmgrModel")
	public ProdmgrModel setUpProdmgr() {
		return new ProdmgrModel();
	}

	@ModelAttribute("productCartModel")
	public ProductCartModel setUpProdcart() {
		return new ProductCartModel();
	}

	//商品検索画面表示
	@RequestMapping(value="/search", method=RequestMethod.POST, params="kensaku")
	public String search(@ModelAttribute ProdmgrModel prodmgrModel, Model model) {
		ProductSearchEntity productsearchentity = new ProductSearchEntity();

		/* 最低価格と最高価格の空文字チェックを行う
		if(prodmgrModel.getMinprice().isEmpty()||prodmgrModel.getMaxprice().isEmpty()) {
			productsearchentity.setMinprice(0);
			productsearchentity.setMaxprice(2147483647);
		}else {
			try {
			productsearchentity.setMinprice(Integer.parseInt(prodmgrModel.getMinprice()));
			productsearchentity.setMaxprice(Integer.parseInt(prodmgrModel.getMaxprice()));
		}catch(NumberFormatException e){
			model.addAttribute("numberformat", "書式が違います。半角数字で入力してください。");
		}
		}*/



		//最低価格の空文字チェックを行い、入力された文字か最低額をentityに格納
		if(prodmgrModel.getMinprice().isEmpty()){
			productsearchentity.setMinprice(0);
		}else {
			try {
				productsearchentity.setMinprice(Integer.parseInt(prodmgrModel.getMinprice()));
			}catch(NumberFormatException e) {
				model.addAttribute("numberformat", "書式が違います。半角数字で入力してください。");
				return "search";
			}
		}
		//最高価格の空文字チェックを行い、入力された文字か最高額をentityに格納
		if(prodmgrModel.getMaxprice().isEmpty()){
			productsearchentity.setMaxprice(2147483647);
		}else {
			try {
				productsearchentity.setMaxprice(Integer.parseInt(prodmgrModel.getMaxprice()));
			}catch(NumberFormatException e) {
				model.addAttribute("numberformat", "書式が違います。半角数字で入力してください。");
				return "search";
			}

		}


		/*int min =Integer.parseInt(prodmgrmodel.getMinprice());
		entity.setMinprice(min);
		entity.setMaxprice(Integer.parseInt(prodmgrmodel.getMaxprice()));*/

		if(productsearchentity.getMinprice() > productsearchentity.getMaxprice()) {
			model.addAttribute("opposite","最低価格が最高価格を上回っています。適切な価格を入力してください。");
			return "search";
		}
		//商品名の空文字チェックを行い、nullか入力された文字をentityに格納
		if(prodmgrModel.getProduct_name().isEmpty()) {
			productsearchentity.setProduct_name(null);
		}else {
			productsearchentity.setProduct_name(prodmgrModel.getProduct_name());
		}
		//メーカーの空文字チェックを行い、nullか入力された文字をentityに格納
		if(prodmgrModel.getMaker().isEmpty()){
			productsearchentity.setMaker(null);
		}else {
			productsearchentity.setMaker(prodmgrModel.getMaker());
		}

		List<ProductSearchResultsEntity> productsearchresultsentity = prodmgrService.productSearch(productsearchentity);

		//入力された商品名または、メーカー名、金額がなかった時の処理
		if(productsearchresultsentity.size() == 0) {
			model.addAttribute("noproduct", "該当商品がありませんでした。");
			return "search";
		}else {
		//entityで帰ってきた値をJSPに返す処理↓
		model.addAttribute("productsearchresultsentity", productsearchresultsentity);

		return "search";
	}
	}

	//商品詳細画面表示
	@RequestMapping(value="/search", method=RequestMethod.POST, params="detail")
	public String detail(@ModelAttribute ProdmgrModel prodmgrModel, Model model, RedirectAttributes attributes) {
		ProductEntity productentity =prodmgrService.productDetail(prodmgrModel.getProduct_id());
		List<ReviewEntity> reviewentity = prodmgrService.productReview(prodmgrModel.getProduct_id());

		//画像表示用 (base64型に変換してエンティティのフィールドに格納)
		productentity.setImagebase(Base64.getEncoder().encodeToString(productentity.getImage()));

		model.addAttribute("productentity", productentity);
		model.addAttribute("reviewentity", reviewentity);

		//ProductEntity productentity = prodmgrService.productDetail(prodmgrModel.getProduct_id());
		//List<ReviewEntity> reviewentity = prodmgrService.productReview(prodmgrModel.getProduct_id());
		//model.addAttribute("productentity", productentity);
		//model.addAttribute("reviewentity", reviewentity);

		List<String> colorlist =Arrays.asList(productentity.getColor().split(","));
		model.addAttribute("colorlist", colorlist);
		List<String> sizelist =Arrays.asList(productentity.getSize().split(","));
		model.addAttribute("sizelist", sizelist);

		return "detail";
	}

}
