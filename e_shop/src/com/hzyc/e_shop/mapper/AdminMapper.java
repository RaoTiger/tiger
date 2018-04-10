package com.hzyc.e_shop.mapper;

import java.util.List;

import com.hzyc.e_shop.bean.Admin;
import com.hzyc.e_shop.bean.Advertising;
import com.hzyc.e_shop.bean.Commodity;
import com.hzyc.e_shop.bean.Navigation;
import com.hzyc.e_shop.bean.NoOrder;
import com.hzyc.e_shop.bean.Type;

public interface AdminMapper {
//查询滚动条
public List<Navigation> selectNavigation();
//修改滚动条
public int updateNavigation(Navigation n);
//添加商品
public int addCommodity(Commodity c);
//查询类别
public List<Type> selectType();
//添加类别
public int addType(Type t);
//查询管理员密码
public String selectAdminPassword(String s);
//查询管理员信息
public List<Admin> selectAdminByadminname(String s);
//修改管理员信息
public int updataAdminInfo(Admin a);
//查询管理员姓名和身份证
public List<Admin> selectAdminNameAndId_Card(Admin a);
//修改管理员密码
public int updateAdminPassword(Admin a);
public List<Commodity> adminCommodity();
public List<Commodity> adminSelectCommodity(int i);
public int adminUpdateCommodity(Commodity c);
public List<NoOrder> adminSelectNoOrder();
public int adminUpdateOrderState(String id);
public int adminDeleteOrder(String s);
}
