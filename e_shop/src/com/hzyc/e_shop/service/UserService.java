package com.hzyc.e_shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.e_shop.bean.Address;
import com.hzyc.e_shop.bean.BuyCar;
import com.hzyc.e_shop.bean.Commodity;
import com.hzyc.e_shop.bean.NoOrder;
import com.hzyc.e_shop.bean.User;
import com.hzyc.e_shop.mapper.UserMapper;

@Service
public class UserService {
    
	@Autowired
	private UserMapper userMapper;
	
	public boolean addUser(User u){
		boolean bool = false;
		try{
			 int result = userMapper.addUser(u);
             if(result > 0){
            	 bool = true;
             }
	}catch(Exception e){
		e.printStackTrace();
		}
	return bool;
	}
	public boolean addAddress(Address a){
		boolean bool = false;
		try{
			int result = userMapper.addAddress(a);
			if(result != -1){
				bool = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		} 
		return bool;
	}
	public String selectUserPassword(String s){
		return userMapper.selectUserPassword(s);
	}
	public boolean addNewAddress(Address a){
		boolean bool = false;
		int result = userMapper.addNewAddress(a);
		if(result != -1){
			bool = true;
			return bool;
		}
		return bool;
	}
	public boolean addOrder(NoOrder o){
		boolean bool = false;
		try{
			int result = userMapper.addOrder(o);
			if(result != -1){
				bool = true;
				return bool;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bool;
	}
	public boolean updateCommodityBnumber(Commodity c){
		boolean bool = false;
		try{
			int result = userMapper.updateCommodityBnumber(c);
			if(result != -1){
				bool = true;
				return bool;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bool;
	}
	public List<User> selectUserInfo(String s){
		return userMapper.selectUserInfo(s);
	}
	public boolean updateUserInfo(User u){
		boolean bool = false;
		try{
			int result = userMapper.updateUserInfo(u);
			if(result != -1){
				bool = true;
				return bool;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bool;
	}
	public List<BuyCar> selectBuyCar(String s){
		return userMapper.selectBuyCar(s);
	}
	public boolean addBuyCar(BuyCar bc){
		boolean bool = false;
		try{
			int result = userMapper.addBuyCar(bc);
			if(result != -1){
				bool = true;
				return bool;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bool;
	}
	public List<Commodity> selectCommodityById(int i){
		return userMapper.selectCommodityById(i);
	}
	public List<NoOrder> selectNoOrderByUsername(String s){
		return userMapper.selectNoOrderByUsername(s);
	}
	public boolean deleteBuyCarById(int i){
		boolean bool = false;
		try{
			int result = userMapper.deleteBuyCarById(i);
			if(result != -1){
				bool = true;
				return bool;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bool;
	}
}
