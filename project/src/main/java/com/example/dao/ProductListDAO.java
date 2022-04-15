package com.example.dao;

import java.util.List;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

public interface ProductListDAO {
	public List<ProductVO> list(Criteria cri);
	public int count(Criteria cri);
	public ProductVO read(String pmodel);
}
