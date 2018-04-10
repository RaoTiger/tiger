package com.hzyc.e_shop.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hzyc.e_shop.bean.Address;
import com.hzyc.e_shop.bean.Advertising;
import com.hzyc.e_shop.bean.Commodity;
import com.hzyc.e_shop.bean.Page;
import com.hzyc.e_shop.service.IndextService;

@Controller
public class IndextHandler {

	@Autowired
	private IndextService indextService;
	
	@RequestMapping("/selectNavigation.do")
	public void selectNavigation(HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		String value = "";
		try{
			 value = indextService.selectNavigation();
			 PrintWriter writer = response.getWriter();
			 writer.print(value);
			 writer.flush();
			 writer.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	@RequestMapping("/selectAdvertising.do")
	public void selectAdvertising(HttpServletResponse response){
		List<Advertising> list = new ArrayList<Advertising>();
		response.setCharacterEncoding("utf-8");
		try{
			list = indextService.selectAdvertising();
			Gson g = new Gson();
			String value = g.toJson(list);
			PrintWriter writer = response.getWriter();
			writer.print(value);
			writer.flush();
			writer.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/selectLimitCommodity.do")
	public void selectLimitCommodity(HttpServletResponse response,HttpServletRequest request){
		List<Commodity> list = new ArrayList<Commodity>();
	try{
		String page = request.getParameter("newPage");
        list = indextService.selectLimitCommodity(Integer.parseInt(page));
        Gson g = new Gson();
        String commodity = g.toJson(list);
        response.setCharacterEncoding("utf-8");
        PrintWriter writer = response.getWriter();
        writer.print(commodity);
        writer.flush();
        writer.close();
	}catch(Exception e){
		e.printStackTrace();
		}
	}
	@RequestMapping("/selectCommodityByname.do")
	public void selectCommodityByname(HttpServletResponse response,HttpServletRequest request){
		List<Commodity> list = new ArrayList<Commodity>();
		try{
			request.setCharacterEncoding("utf-8");
			String s = request.getParameter("name");
			list = indextService.selectCommodityByname(s);
			
			if(list.size() > 0){
				
				request.setAttribute("value", list);
				request.getRequestDispatcher("showCommodity.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("erorr.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/getCommodity.do")
	public void getCommodityByname(HttpServletResponse response,HttpServletRequest request,HttpSession session){
		List<Commodity> list = new ArrayList<Commodity>();
		try{
			request.setCharacterEncoding("utf-8");
			String s = request.getParameter("name");
			String value="";
			if(s.equals("1001")){
				value = "男衣";
			}else if(s.equals("1002")){
				value = "女衣";
			}else if(s.equals("1011")){
				value = "男鞋";
			}else if(s.equals("1012")){
				value = "女鞋";
			}else if(s.equals("1021")){
				value = "男袜";
			}else if(s.equals("1022")){
				value = "女袜";
			}else if(s.equals("1031")){
				value = "男裤";
			}
			else if(s.equals("1032")){
				value = "女裤";
			}
			else if(s.equals("2001")){
				value = "手机";
			}
			else if(s.equals("2051")){
				value = "电脑";
			}
			else if(s.equals("3001")){
				value = "电视机";
			}
			else if(s.equals("3051")){
				value = "冰箱";
			}
			else if(s.equals("4001")){
				value = "美食";
			}else if(s.equals("4051")){
				value = "零食";
			}
			
			list = indextService.getCommodityByName(value);
			
			if(list.size() > 0){
				request.setAttribute("value", list);
				request.getRequestDispatcher("showCommodity.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("erorr.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/selectCommodityById.do")
	public void selectCommodityById(HttpServletResponse response,HttpServletRequest request){
		List<Commodity> list = new ArrayList<Commodity>();
		try{
			request.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			list = indextService.selectCommodityById(Integer.parseInt(id));
			if(list.size() >0){
				request.setAttribute("value", list);
				request.getRequestDispatcher("commodityInfo.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/buyCommodity.do")
		public void buyCommodityById(HttpServletResponse response,HttpServletRequest request){
			List<Commodity> list = new ArrayList<Commodity>();
			try{
				request.setCharacterEncoding("utf-8");
				String id = request.getParameter("id");
				String number = request.getParameter("number");
				list = indextService.selectCommodityById(Integer.parseInt(id));
				if(list.size() >0){
					request.setAttribute("number", number);
					request.setAttribute("value", list);
					request.getRequestDispatcher("play.jsp").forward(request, response);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
	}
	@RequestMapping("/selectUserAddress.do")
	public void selectUserAddress(HttpServletResponse response,HttpServletRequest request){
		List<Address> list = new ArrayList<Address>();
		try{
			response.setCharacterEncoding("utf-8");
			String username = request.getParameter("username");
			list = indextService.selectUserAddress(username);
			Gson g = new Gson();
			String value = g.toJson(list);
			//System.out.println(value);
			PrintWriter writer = response.getWriter();
			if(list.size() > 0){
				writer.print(value);
				writer.flush();
				writer.close();
			}else{
				writer.print("no");
				writer.flush();
				writer.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/cleanSession.do")
	public String cleanSession(HttpSession session){
		session.invalidate();
		return "index.jsp";
	}
}
