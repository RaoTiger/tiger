package com.hzyc.e_shop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hzyc.e_shop.bean.Admin;
import com.hzyc.e_shop.bean.Advertising;
import com.hzyc.e_shop.bean.Commodity;
import com.hzyc.e_shop.bean.Navigation;
import com.hzyc.e_shop.bean.NoOrder;
import com.hzyc.e_shop.bean.Type;
import com.hzyc.e_shop.mapper.AdminMapper;

@Service
public class AdminService {

	@Autowired
	private AdminMapper adminMapper;
	//��ѯ������
	public List<Navigation> selectNavigation(){
		List<Navigation> list = new ArrayList<Navigation>();
		try{
			list = adminMapper.selectNavigation();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	//�޸Ĺ�����
	public boolean updateNavigation(Navigation n){
		boolean bool = false;
		try{
			int result = -1;
        result = adminMapper.updateNavigation(n);
        if(result != -1){
        	bool = true;
        	return bool;
        }else{
        	return bool;
        }
	}catch(Exception e){
		e.printStackTrace();}
	return bool;
	}
	//�����Ʒ
	public boolean addCommodity(Commodity c){
		boolean bool = false;
		try{
			int result = adminMapper.addCommodity(c);
			if(result != -1){
				bool = true;
				return bool;
			}else{
				return bool;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bool;
	}
	//��ѯ���
	public List<Type> selectType(){
		List<Type> list = new ArrayList<Type>();
		try{
			list = adminMapper.selectType();
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	//������
	public boolean addType(Type t){
		boolean bool = false;
		try{
			int result = adminMapper.addType(t);
			if(result != -1){
				bool = true;
				return bool;
			}
			else{
				return bool;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bool;
	}
	//��ѯ����Ա����
	public String selectAdminPassword(String s){
		String value = "";
		try{
			value = adminMapper.selectAdminPassword(s);
		}catch(Exception e){
			e.printStackTrace();
		}
		return value;
	}
	//��ѯ����Ա��Ϣ
	public List<Admin> selectAdminByadminname(String s){
		List<Admin> list = new ArrayList<Admin>();
		try{
			list = adminMapper.selectAdminByadminname(s);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	//�޸Ĺ���Ա��Ϣ
	public boolean updataAdminInfo(Admin a){
		boolean bool = false;
		try{
			int result = adminMapper.updataAdminInfo(a);
			if(result != -1){
				bool = true;
				return bool;
			}else{
				return bool;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bool;
	}
	//��ѯ����Ա���������֤
	public List<Admin> selectAdminNameAndId_Card(Admin a){
		List<Admin> list = new ArrayList<Admin>();
		try{
			list = adminMapper.selectAdminNameAndId_Card(a);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	//�޸Ĺ���Ա����
	public boolean updateAdminPassword(Admin a){
		boolean bool = false;
		try{
			int result = adminMapper.updateAdminPassword(a);
			if(result != -1){
				bool = true;
				return bool;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bool;
	}
	public List<Commodity> adminCommodity(){
		return adminMapper.adminCommodity();
	}
	public List<Commodity> adminSelectCommodity(int i){
		return adminMapper.adminSelectCommodity(i);
	}
	public boolean adminUpdateCommodity(Commodity c){
		boolean bool = false;
		try{
			int result = adminMapper.adminUpdateCommodity(c);
			if(result != -1){
				bool = true;
				return bool;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bool;
	}
	public List<NoOrder> adminSelectNoOrder(){
     return adminMapper.adminSelectNoOrder();
	}
	public boolean adminUpdateOrderState(String s){
		boolean bool = false;
		try{
			int result = adminMapper.adminUpdateOrderState(s);
			if(result != -1){
				bool = true;
				return bool;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return bool;
	}
	public boolean adminDeleteOrder(String s){
		boolean bool = false;
		try{
			int result = adminMapper.adminDeleteOrder(s);
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
