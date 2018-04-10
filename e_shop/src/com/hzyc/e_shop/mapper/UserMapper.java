
package com.hzyc.e_shop.mapper;

import java.util.List;

import com.hzyc.e_shop.bean.Address;
import com.hzyc.e_shop.bean.BuyCar;
import com.hzyc.e_shop.bean.Commodity;
import com.hzyc.e_shop.bean.NoOrder;
import com.hzyc.e_shop.bean.User;

public interface UserMapper {
   public int addUser(User u);
   public int addAddress(Address a);
   public String selectUserPassword(String s);
   public int addNewAddress(Address a);
   public int addOrder(NoOrder o);
   public int updateCommodityBnumber(Commodity c);
   public List<User> selectUserInfo(String s);
   public int updateUserInfo(User u);
   public List<BuyCar> selectBuyCar(String s);
   public int addBuyCar(BuyCar bc);
   public List<Commodity> selectCommodityById(int i);
   public List<NoOrder> selectNoOrderByUsername(String s);
   public int deleteBuyCarById(int i);
}
