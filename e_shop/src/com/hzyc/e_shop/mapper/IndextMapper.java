package com.hzyc.e_shop.mapper;

import java.util.List;

import com.hzyc.e_shop.bean.Address;
import com.hzyc.e_shop.bean.Advertising;
import com.hzyc.e_shop.bean.Commodity;
import com.hzyc.e_shop.bean.Page;

public interface IndextMapper {
public String selectNavigation();
public List<Advertising> selectAdvertising(); 
public List<Commodity> selectLimitCommodity(int i);
public List<Commodity> selectCommodityByname(String s);
public List<Commodity> getCommodityByName(String s);
public List<Commodity> selectCommodityById(int i);
public List<Address> selectUserAddress(String s);
}
