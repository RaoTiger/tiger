package com.hzyc.e_shop.mapper;

import java.util.List;

import com.hzyc.e_shop.bean.Admin;
import com.hzyc.e_shop.bean.Advertising;
import com.hzyc.e_shop.bean.Commodity;
import com.hzyc.e_shop.bean.Navigation;
import com.hzyc.e_shop.bean.NoOrder;
import com.hzyc.e_shop.bean.Type;

public interface AdminMapper {
//��ѯ������
public List<Navigation> selectNavigation();
//�޸Ĺ�����
public int updateNavigation(Navigation n);
//�����Ʒ
public int addCommodity(Commodity c);
//��ѯ���
public List<Type> selectType();
//������
public int addType(Type t);
//��ѯ����Ա����
public String selectAdminPassword(String s);
//��ѯ����Ա��Ϣ
public List<Admin> selectAdminByadminname(String s);
//�޸Ĺ���Ա��Ϣ
public int updataAdminInfo(Admin a);
//��ѯ����Ա���������֤
public List<Admin> selectAdminNameAndId_Card(Admin a);
//�޸Ĺ���Ա����
public int updateAdminPassword(Admin a);
public List<Commodity> adminCommodity();
public List<Commodity> adminSelectCommodity(int i);
public int adminUpdateCommodity(Commodity c);
public List<NoOrder> adminSelectNoOrder();
public int adminUpdateOrderState(String id);
public int adminDeleteOrder(String s);
}
