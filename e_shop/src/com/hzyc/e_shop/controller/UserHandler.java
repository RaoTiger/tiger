package com.hzyc.e_shop.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hzyc.e_shop.bean.Address;
import com.hzyc.e_shop.bean.BuyCar;
import com.hzyc.e_shop.bean.Commodity;
import com.hzyc.e_shop.bean.NoOrder;
import com.hzyc.e_shop.bean.User;
import com.hzyc.e_shop.service.UserService;

@Controller
public class UserHandler {
  
	@Autowired
	private UserService userService;
	
	@RequestMapping("/addUser.do")
	public void addUser(User u,HttpServletRequest request,HttpServletResponse response){
		
		try{
			request.setCharacterEncoding("utf-8");
			String username = u.getUsername();
			System.out.println("user="+username);
           boolean bool = userService.addUser(u);
           if(bool){
        	   request.setAttribute("user", username);
        	   request.getRequestDispatcher("login_next.jsp").forward(request, response);
        	   //return "login_next.jsp";
           }else{
        	   //return "redirect:erorr.jsp";
        	   request.getRequestDispatcher("erorr.jsp").forward(request, response);
           }
	}catch(Exception e){
		e.printStackTrace();
		}
	//return "redirect:erorr.jsp";
	}
	@RequestMapping("/userLogin.do")
	public void userLogin(HttpServletResponse response,HttpServletRequest request,String province,String city,String town,String address,String username){
		try{
			Address a = new Address();
			String value = province+city+town+address;
			a.setUsername(username);
			a.setAddress(value);
			userService.addAddress(a);
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/userLanding.do")
	public void selectUserPassword(HttpServletResponse response,HttpServletRequest request,HttpSession session){
		try{
			request.setCharacterEncoding("utf-8");
			String user = request.getParameter("username");
			System.out.println("------------------"+user);
			String pass = request.getParameter("password");
			String password = userService.selectUserPassword(user);
			if(pass.equals(password)){
				
				session.setAttribute("username", user);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else{
				
				request.getRequestDispatcher("userLanding.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/addNewAddress.do")
	public void addNewAddress(String address,String province,String city,String town,String username,HttpServletResponse response,HttpServletRequest request){
		try{
			Address a = new Address();
			String newAddress = province+city+town+address;
			a.setUsername(username);
			a.setAddress(newAddress);
			boolean bool = userService.addNewAddress(a);
			if(bool){
				request.getRequestDispatcher("play.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("erorr.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/addplay.do")
	public void addOrder(NoOrder o,HttpServletResponse response,HttpServletRequest request){
		try{
			o.setState("未发货");
			Commodity c = new Commodity();
			c.setId(o.getCommodity_id());
			c.setNumber(o.getNumber());
			boolean b = updateCommodityNumber(c);
			boolean bool = userService.addOrder(o);
			if(bool && b){
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("erorr.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public boolean updateCommodityNumber(Commodity c){
		return userService.updateCommodityBnumber(c);
	}
	@RequestMapping("/selectUserInfo.do")
	public void selectUserInfo(HttpServletResponse response,HttpServletRequest request){
		List<User> list = new ArrayList<User>();
		try{
			String username = request.getParameter("username");
			list = userService.selectUserInfo(username);
			if(list.size()>0){
				request.setAttribute("list", list);
				request.getRequestDispatcher("userInfo.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("erorr.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/updateUserInfo.do")
	public void updateUserInfo(User u,HttpServletResponse response,HttpServletRequest request){
		try{
			boolean bool = userService.updateUserInfo(u);
			String username = u.getUsername();
			if(bool){
				
				request.getRequestDispatcher("selectUserInfo.do?username="+username).forward(request, response);
			}else{
				request.getRequestDispatcher("erorr.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/selectBuyCar.do")
	public void selectBuyCar(HttpServletResponse response,HttpServletRequest request){
		List<BuyCar> list = new ArrayList<BuyCar>();
		try{
			response.setCharacterEncoding("utf-8");
			String username = request.getParameter("username");
			list = userService.selectBuyCar(username);
			Gson g = new Gson();
			String value = g.toJson(list);
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
	@RequestMapping("/addBuyCar.do")
	public void addBuyCar(BuyCar bc,HttpServletResponse response,HttpServletRequest request){
		List<Commodity> list = new ArrayList<Commodity>();
		try{
			
			String number = request.getParameter("number");
			String com = request.getParameter("com");
			//System.out.println("======================="+number);
			list = selectCommodityById(Integer.parseInt(com));
			String username = request.getParameter("username");
			//System.out.println("========================="+list.get(0).getTypename());
			//bc.setId("1");
			bc.setUsername(username);
			bc.setCommodity_id(com);
			String typename = list.get(0).getTypename();
			bc.setTypename(typename);
			String depict = list.get(0).getDepict();
			bc.setDepict(depict);
			String price = list.get(0).getPrice();
			bc.setPrice(price);
			bc.setNumber(number);
			String img = list.get(0).getImg();
			bc.setImg(img);
			/*bc.setUsername("user04");
			bc.setCommodity_id("1");
			bc.setTypename("3");
			bc.setDepict("面容ID识别前置深感摄像头人像光效");
			bc.setPrice("4800");
			bc.setNumber("1");
			bc.setImg("iphone X.jpg");*/
			boolean bool =userService.addBuyCar(bc);
			if(bool){
				response.sendRedirect("buyCar.jsp");
			}else{
				request.getRequestDispatcher("erorr.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public List<Commodity> selectCommodityById(int i){
		return userService.selectCommodityById(i);
	}
	@RequestMapping("/selectNoOrderByUsername.do")
	public void selectNoOrderByUsername(HttpServletResponse response,HttpServletRequest request){
		List<NoOrder> list = new ArrayList<NoOrder>();
		try{
			String username = request.getParameter("username");
			list = userService.selectNoOrderByUsername(username);
			
			if(list.size() > 0){
				request.setAttribute("list", list);
				request.getRequestDispatcher("userSelectOrder.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("erorr.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/deleteBuyCarById.do")
	public void deleteBuyCarById(HttpServletResponse response,HttpServletRequest request){
		try{
			String id = request.getParameter("id");
			boolean bool =userService.deleteBuyCarById(Integer.parseInt(id));
			if(bool){
				response.sendRedirect("buyCar.jsp");
			}else{
				response.sendRedirect("erorr.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
