package com.example.controller;



import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.ProductListDAO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;

@RequestMapping("/productList")
@Controller
public class ProductListcontroller {
	@Autowired
	ProductListDAO dao;
	
	@RequestMapping("/read")
	public String read(Model model){
		model.addAttribute("pageName","productList/read.jsp");
		return "/home";
	}
	
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName","productList/list.jsp");
		return "/home";
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> listJson(Criteria cri){
		HashMap<String, Object> map=new HashMap<>();
		cri.setPerPageNum(10);
		PageMaker pm= new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(10);
		pm.setTotalCount(dao.count(cri));
	
		map.put("pm", pm);
		map.put("list", dao.list(cri));
		return map;
	}
}
