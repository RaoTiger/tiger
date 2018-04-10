package com.hzyc.e_shop.mapper;

import java.util.List;

import com.hzyc.e_shop.bean.City;
import com.hzyc.e_shop.bean.Province;
import com.hzyc.e_shop.bean.Town;

public interface GetCityMapper {
public List<Province> selectProvince();
public List<City> selectCity(String s);
public List<Town> selectTown(String s);
}
