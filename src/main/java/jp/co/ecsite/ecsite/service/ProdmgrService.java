package jp.co.ecsite.ecsite.service;


import java.util.List;

import jp.co.ecsite.ecsite.entity.ProductEntity;
import jp.co.ecsite.ecsite.entity.ProductSearchEntity;
import jp.co.ecsite.ecsite.entity.ProductSearchResultsEntity;
import jp.co.ecsite.ecsite.entity.ReviewEntity;

public interface ProdmgrService{

	public List<ProductSearchResultsEntity> productSearch(ProductSearchEntity productsearchentity);

	public ProductEntity productDetail(String product_id);

	public List<ReviewEntity> productReview(String product_id);

	//商品管理のメソッド！！

}
