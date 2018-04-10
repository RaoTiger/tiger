package com.hzyc.e_shop.bean;

public class Page {
 private int page = 1;
 private int size = 8;
 private String condition;
 

 public Page(){
	 vaildPage();
 }
 void vaildPage(){
	 
	 setPage((getPage() - 1)*getSize());
 }

public String getCondition() {
	return condition;
}
public void setCondition(String condition) {
	this.condition = condition;
}
public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}



 
}
