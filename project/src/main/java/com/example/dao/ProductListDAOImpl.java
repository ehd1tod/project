package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

@Repository
public class ProductListDAOImpl implements ProductListDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.ProductListMapper";
	@Override
	public List<ProductVO> list(Criteria cri) {
		return session.selectList(namespace+".list",cri);
		
	}
	@Override
	public int count(Criteria cri) {
		return session.selectOne(namespace+".count",cri);
	}
	@Override
	public ProductVO read(String pmodel) {
		return session.selectOne(namespace+".read"+pmodel);
	}
	
	
}
