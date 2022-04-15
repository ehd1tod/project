package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Criteria;
import com.example.domain.ProductVO;

@Repository
public class CategoryDAOImpl implements CategoryDAO{
	
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.CategoryMapper";

	@Override
	public List<ProductVO> plist(Criteria cri) {
		return session.selectList(namespace + ".plist", cri);
	}

	@Override
	public int pcount() {
		return session.selectOne(namespace + ".pcount");
	}

}
