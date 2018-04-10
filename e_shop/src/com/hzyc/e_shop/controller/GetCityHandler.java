package com.hzyc.e_shop.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.hzyc.e_shop.bean.City;
import com.hzyc.e_shop.bean.Province;
import com.hzyc.e_shop.bean.Town;
import com.hzyc.e_shop.service.GetCityService;

@Controller
public class GetCityHandler {
	ModelAndView mav = new ModelAndView();
	@Autowired
  private GetCityService getCityService;
	
	@RequestMapping("/getProvince.do")
	public void selectProvince(HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		List<Province> list = new ArrayList<Province>();
		try{
			list = getCityService.selectProvince();
			Gson g = new Gson();
			String value = g.toJson(list);
			//System.out.println(value);
			PrintWriter writer =  response.getWriter();
			writer.print(value);
			writer.flush();
			writer.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	@RequestMapping("/getCity.do")
	public void selectCity(HttpServletResponse response,String pro){
		response.setCharacterEncoding("utf-8");
		List<City> list = new ArrayList<City>();
		
		try{
			list = getCityService.selectCity(pro);
			Gson g = new Gson();
			String value = g.toJson(list);
			System.out.println(value);
			PrintWriter writer =  response.getWriter();
			writer.print(value);
			writer.flush();
			writer.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/getTown.do")
	public void selectTown(HttpServletResponse response,String city){
		response.setCharacterEncoding("utf-8");
		List<Town> list = new ArrayList<Town>();
		try{
			list = getCityService.selectTown(city);
			Gson g = new Gson();
			String value = g.toJson(list);
			System.out.println(value);
			PrintWriter writer =  response.getWriter();
			writer.print(value);
			writer.flush();
			writer.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
