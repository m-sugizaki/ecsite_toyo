package jp.co.ecsite.ecsite.repository;

import java.util.List;

import jp.co.ecsite.ecsite.entity.ProductEntity;
import jp.co.ecsite.ecsite.entity.ProductSearchEntity;
import jp.co.ecsite.ecsite.entity.ProductSearchResultsEntity;
import jp.co.ecsite.ecsite.entity.ReviewEntity;

public interface ProdmgrRepository {
	List<ProductSearchResultsEntity> productSearch(ProductSearchEntity productsearchentity);
	ProductEntity productDetail(String product_id);
	List<ReviewEntity> productReview(String product_id);
}
