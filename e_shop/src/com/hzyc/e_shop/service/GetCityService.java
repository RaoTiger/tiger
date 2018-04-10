package com.hzyc.e_shop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.e_shop.bean.City;
import com.hzyc.e_shop.bean.Province;
import com.hzyc.e_shop.bean.Town;
import com.hzyc.e_shop.mapper.GetCityMapper;

@Service
public class GetCityService {
   
	@Autowired
	private GetCityMapper getCityMapper;
	
	public List<Province> selectProvince(){
		List<Province> list = new ArrayList<Province>();
		try{
			 list = getCityMapper.selectProvince();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	public List<City> selectCity(String s){
		List<City> list = new ArrayList<City>();
		try{
			list = getCityMapper.selectCity(s);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	public List<Town> selectTown(String s){
		List<Town> list = new ArrayList<Town>();
		try{
			list = getCityMapper.selectTown(s);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
}
