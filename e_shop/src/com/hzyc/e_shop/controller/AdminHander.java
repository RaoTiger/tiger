package com.hzyc.e_shop.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


import com.google.gson.Gson;
import com.hzyc.e_shop.bean.Admin;
import com.hzyc.e_shop.bean.Advertising;
import com.hzyc.e_shop.bean.Commodity;
import com.hzyc.e_shop.bean.Navigation;
import com.hzyc.e_shop.bean.NoOrder;
import com.hzyc.e_shop.bean.Type;
import com.hzyc.e_shop.service.AdminService;

@Controller
public class AdminHander {

	@Autowired
	private AdminService adminService;
	@RequestMapping("/selectNavi.do")
	public void selectNavigation(HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		List<Navigation> list = new ArrayList<Navigation>();
		try{
			list = adminService.selectNavigation();
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
	@RequestMapping("/updateNavigation.do")
	public void updateNavigation(Navigation n,HttpServletRequest request,HttpServletResponse response){
		try{
			request.setCharacterEncoding("utf-8");
			boolean bool = adminService.updateNavigation(n);
			request.setAttribute("bool", bool);
			request.getRequestDispatcher("vaildNavigation.jsp").forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/updateAdvertising.do")
	public void updataAdvertising(Advertising a,MultipartFile uFile,String picture,HttpServletRequest request,HttpServletResponse response){
		try{
			String path = request.getSession().getServletContext().getRealPath("/image");
			String finalPath = path + "\\" + picture;
			System.out.println(finalPath);
			uFile.transferTo(new File(finalPath));
			boolean bool = true;
			request.setAttribute("bool",bool);
			request.getRequestDispatcher("doAdvertising.jsp").forward(request, response);
;		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/addCommodity.do")
	public void addCommodity(Commodity c,HttpServletRequest request,HttpServletResponse response,MultipartFile uPicture){
		try{
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
			String nowTimeString = format.format(new Date());
			
			String path = request.getSession().getServletContext().getRealPath("/image");
			String pictureName = nowTimeString+uPicture.getOriginalFilename();
			String finalPath = path + "\\" + pictureName;
			uPicture.transferTo(new File(finalPath));
			
			c.setImg(pictureName);
			boolean bool =adminService.addCommodity(c);
			
				request.setAttribute("bool", bool);
				request.getRequestDispatcher("doCommodity.jsp").forward(request, response);
			
		}catch(Exception e){
			
		}
	}
	@RequestMapping("/selectType.do")
	public void selectType(HttpServletRequest request,HttpServletResponse response){
		List<Type> list = new ArrayList<Type>();
		try{
           response.setCharacterEncoding("utf-8");
          list = adminService.selectType();
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
	@RequestMapping("/addType.do")
	public void addType(Type t,HttpServletRequest request,HttpServletResponse response){
		try{
			boolean bool = adminService.addType(t);
			request.setAttribute("bool", bool);
			request.getRequestDispatcher("doAddType.jsp").forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/adminLanding.do")
	public void selectAdminPassword(String adminname,String password,HttpServletRequest request,HttpServletResponse response){
		
		try{
			String value = adminService.selectAdminPassword(adminname);
			if(password.equals(value)){
				request.setAttribute("adminname", adminname);
				request.getRequestDispatcher("frameset.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("doAdminLanding.jsp").forward(request, response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	@RequestMapping("/selectAdminByadminname.do")
	public void selectAdminByadminname(HttpServletRequest request,HttpServletResponse response){
      try{
    	  response.setCharacterEncoding("utf-8");
    	  String admin = request.getParameter("admin");
    	  
    	  List<Admin> list = new ArrayList<Admin>();
    	  list = adminService.selectAdminByadminname(admin);
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
	@RequestMapping("/updateAdminInfo.do")
	public void updataAdminInfo(Admin a,HttpServletRequest request,HttpServletResponse response){
		try{
			boolean bool = adminService.updataAdminInfo(a);
			String adminname = a.getAdminname();
			request.setAttribute("adminname", adminname);
			;
			request.getRequestDispatcher("adminInfo.jsp").forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/selectAdminNameAndId_Card.do")
	public void selectAdminNameAndId_Card(String nameValue,String Id_CardValue,Admin a,HttpServletRequest request,HttpServletResponse response){
		List<Admin> list = new ArrayList<Admin>();
		try{
			
			list = adminService.selectAdminNameAndId_Card(a);
			
			String name = list.get(0).getName();
			String Id_Card = list.get(0).getId_Card();
			boolean bool = false;
			if(name.equals(nameValue)&&Id_Card.equals(Id_CardValue)){
				bool = true;
				request.setAttribute("bool", bool);
				request.getRequestDispatcher("doVaildAdminNameAndId_Card.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//修改管理员密码
	@RequestMapping("/updateAdminPassword.do")
	public void updateAdminPassword(Admin a,HttpServletRequest request,HttpServletResponse response){
		try{
			boolean bool = adminService.updateAdminPassword(a);
			if(bool){
			request.getRequestDispatcher("frameset.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("vaildAdminNameAndId_Card.jsp").forward(request, response);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/adminCommodity.do")
	public void adminCommodity(HttpServletRequest request,HttpServletResponse response){
		List<Commodity> list = new ArrayList<Commodity>();
		try{
			list = adminService.adminCommodity();
			request.setAttribute("list", list);
			request.getRequestDispatcher("adminCommodity.jsp").forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}@RequestMapping("/adminSelectCommodity.do")
	public void adminSelectCommodity(HttpServletRequest request,HttpServletResponse response){
		List<Commodity> list = new ArrayList<Commodity>();
		try{
			String id = request.getParameter("id");
			list = adminService.adminSelectCommodity(Integer.parseInt(id));
			request.setAttribute("list", list);
			request.getRequestDispatcher("adminSelectCommodity.jsp").forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/adminUpdateCommodity.do")
	public void adminUpdateCommodity(Commodity c,HttpServletRequest request,HttpServletResponse response){
		try{
			boolean bool = adminService.adminUpdateCommodity(c);
			if(bool){
				request.getRequestDispatcher("adminCommodity.do").forward(request, response);
			}else{
				request.getRequestDispatcher("erorr.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/adminSelectNoOrder.do")
	public void adminSelectNoOrder(HttpServletRequest request,HttpServletResponse response){
		List<NoOrder> list = new ArrayList<NoOrder>();
		try{
			list = adminService.adminSelectNoOrder();
			request.setAttribute("list", list);
			request.getRequestDispatcher("adminOrder.jsp").forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/adminUpdateOrderState.do")
	public void adminUpdateOrderState(HttpServletRequest request,HttpServletResponse response){
		try{
			String s = request.getParameter("id");
			boolean bool = adminService.adminUpdateOrderState(s);
			if(bool){
				request.getRequestDispatcher("adminSelectNoOrder.do").forward(request, response);
			}else{
				request.getRequestDispatcher("erorr.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	@RequestMapping("/adminDeleteOrder.do")
	public void adminDeleteOrder(HttpServletRequest request,HttpServletResponse response){
		try{
			String s = request.getParameter("id");
		   boolean bool = adminService.adminDeleteOrder(s);
			if(bool){
				request.getRequestDispatcher("adminSelectNoOrder.do").forward(request, response);
			}else{
				request.getRequestDispatcher("erorr.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
