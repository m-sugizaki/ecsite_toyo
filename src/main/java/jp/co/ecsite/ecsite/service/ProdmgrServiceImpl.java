package jp.co.ecsite.ecsite.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jp.co.ecsite.ecsite.entity.ProductEntity;
import jp.co.ecsite.ecsite.entity.ProductSearchEntity;
import jp.co.ecsite.ecsite.entity.ProductSearchResultsEntity;
import jp.co.ecsite.ecsite.entity.ReviewEntity;
import jp.co.ecsite.ecsite.repository.ProdmgrRepository;

@Service
public class ProdmgrServiceImpl implements ProdmgrService {
	@Autowired
	ProdmgrRepository prodmgrRepository;

	@Override
	public List<ProductSearchResultsEntity> productSearch(ProductSearchEntity productsearchentity){
		return prodmgrRepository.productSearch(productsearchentity);
	}

	@Override
	public ProductEntity productDetail(String product_id){
		return prodmgrRepository.productDetail(product_id);
	}

	@Override
	public List<ReviewEntity> productReview(String product_id){
		return prodmgrRepository.productReview(product_id);
	}
}
