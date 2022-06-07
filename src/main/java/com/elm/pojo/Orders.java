package com.elm.pojo;

import java.util.ArrayList;
import java.util.List;

/**
 * 注意：表名一定不能为order，因为这是sql关键词
 */
public class Orders {
	
	private Integer orderId;
	private String userId;
	private Integer businessId;
	private String orderDate;
	private Double orderTotal;
	private Integer daId;         //送货地址编号
	private Integer orderState;   //订单状态（0：未支付； 1：已支付）
	private DeliveryAddress deliveryAddress;
	//所属商家（多对一）（一个商家一个订单）
	private Business business = new Business();
	//所属订单明细（一对多）
	private List<OrderDetailet> odList = new ArrayList<>();

	public DeliveryAddress getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(DeliveryAddress deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public Double getOrderTotal() {
		return orderTotal;
	}
	public void setOrderTotal(Double orderTotal) {
		this.orderTotal = orderTotal;
	}
	public Integer getOrderState() {
		return orderState;
	}
	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}
	public Integer getBusinessId() {
		return businessId;
	}
	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}
	public Integer getDaId() {
		return daId;
	}
	public void setDaId(Integer daId) {
		this.daId = daId;
	}
	public Business getBusiness() {
		return business;
	}
	public void setBusiness(Business business) {
		this.business = business;
	}
	public List<OrderDetailet> getOdList() {
		return odList;
	}
	public void setOdList(List<OrderDetailet> odList) {
		this.odList = odList;
	}
}
