package com.elm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.elm.mapper.BusinessMapper;
import com.elm.mapper.CartMapper;
import com.elm.mapper.OrderDetailetMapper;
import com.elm.mapper.OrdersMapper;
import com.elm.pojo.Business;
import com.elm.pojo.Cart;
import com.elm.pojo.OrderDetailet;
import com.elm.pojo.Orders;
import com.elm.service.OrdersService;
import com.elm.util.CommonUtil;

@Service
public class OrdersServiceImpl implements OrdersService{

	@Autowired
	private OrdersMapper ordersMapper;
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private BusinessMapper businessMapper;
	@Autowired
	private OrderDetailetMapper orderDetailetMapper;
	
	//Controller需要传递过来三个参数：userId,businessId,daId
	@Override
	@Transactional
	public int createOrders(Orders orders) {
		int orderId = 0;
		
		//1、查询当前用户购物车中当前商家的所有食品
		Cart cart = new Cart();
		cart.setBusinessId(orders.getBusinessId());
		cart.setUserId(orders.getUserId());
		List<Cart> cartList = cartMapper.listCart(cart);
		
		//2、查询商家信息（需要使用商家的配送费信息）
		Business business = businessMapper.getBusinessById(orders.getBusinessId());
		
		//3、获取订单总额
		Double ordersTotal = 0.0;  //订单总额
		for(Cart c : cartList) {
			//累计所有食品总价格
			ordersTotal += c.getFood().getFoodPrice()*c.getQuantity();
		}
		//加上配送费
		ordersTotal += business.getDeliveryPrice();
		
		//4、创建订单，并获取订单编号（已有userId,businessId,daId，再需要添加ordersTotal、orderDate数据）
		orders.setOrderTotal(ordersTotal);
		orders.setOrderDate(CommonUtil.getCurrentDate());
		//这里就不获取insert返回值了，因为没有什么用
		orderId = ordersMapper.saveOrders(orders);
		//这里获取insert后，自增列返回的orderId
		orderId = orders.getOrderId();
		
		//5、处理相关数据：获取订单明细集合
		List<OrderDetailet> orderDetailetList = new ArrayList<>();  //订单明细集合
		for(Cart c : cartList) {
			OrderDetailet od = new OrderDetailet();
			od.setOrderId(orderId);
			od.setFoodId(c.getFoodId());
			od.setQuantity(c.getQuantity());
			orderDetailetList.add(od);
		}
		
		//6、批量添加订单明细
		orderDetailetMapper.saveOrderDetailetBatch(orderDetailetList);
		
		//7、清空当前用户购物车中当前商家的所有食品
		cartMapper.removeCart(cart);
		
		return orderId;
	}

	
	@Override
	public Orders getOrdersById(Integer orderId) {
		return ordersMapper.getOrdersById(orderId);
	}
	
	@Override
	public List<Orders> listOrdersByUserId(String userId){
		return ordersMapper.listOrdersByUserId(userId);
	}

	@Override
	@Transactional
	public int updateState(Integer orderId) {
		return ordersMapper.updateState(orderId);
	}
}
