package com.elm.pojo;

public class DeliveryAddress {

	private Integer daId;
	private String contactName;
	private Integer contactSex;
	private String contactTel;
	private String address;
	private String userId;
	
	public DeliveryAddress() {}
	
	public DeliveryAddress(String contactName,Integer contactSex,String contactTel,String address,String userId) {
		this.contactName = contactName;
		this.contactSex = contactSex;
		this.contactTel = contactTel;
		this.address = address;
		this.userId = userId;
	}
	
	public Integer getDaId() {
		return daId;
	}
	public void setDaId(Integer daId) {
		this.daId = daId;
	}
	public String getContactName() {
		return contactName;
	}
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	public Integer getContactSex() {
		return contactSex;
	}
	public void setContactSex(Integer contactSex) {
		this.contactSex = contactSex;
	}
	public String getContactTel() {
		return contactTel;
	}
	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}
