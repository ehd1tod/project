package com.example.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

public interface CategoryDAO {
	public List<ProductVO> plist(Criteria cri);
	public int pcount();
}
