package com.hzyc.e_shop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.e_shop.bean.Address;
import com.hzyc.e_shop.bean.Advertising;
import com.hzyc.e_shop.bean.Commodity;
import com.hzyc.e_shop.bean.Page;
import com.hzyc.e_shop.mapper.IndextMapper;


@Service
public class IndextService {
     @Autowired
	private IndextMapper indextMapper;
	
	public String selectNavigation(){
		String value = "";
		try{
			value = indextMapper.selectNavigation();
		}catch(Exception e){
			e.printStackTrace();
		}
		return value;
	}
	public List<Advertising> selectAdvertising(){
		List<Advertising> list = new ArrayList<Advertising>();
		try{
			list = indextMapper.selectAdvertising();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	public List<Commodity> selectLimitCommodity(int i){
		List<Commodity> list = new ArrayList<Commodity>();
		try{
			list = indextMapper.selectLimitCommodity(i);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	public List<Commodity> selectCommodityByname(String s){
		return indextMapper.selectCommodityByname(s);
	}
	public List<Commodity> getCommodityByName(String s){
		return indextMapper.getCommodityByName(s);
	}
	public List<Commodity> selectCommodityById(int i){
		return indextMapper.selectCommodityById(i);
	}
	public List<Address> selectUserAddress(String s){
		return indextMapper.selectUserAddress(s);
	}
}
