package com.elm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;

import com.elm.pojo.Orders;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface OrdersMapper {

	@Insert("insert into orders(userId,businessId,orderDate,orderTotal,daId,orderState) values(#{userId},#{businessId},#{orderDate},#{orderTotal},#{daId},0)")
	@Options(useGeneratedKeys=true, keyProperty="orderId", keyColumn="orderId")
	public int saveOrders(Orders orders);
	
	/**
	 * 1、查询订单信息的同时，还需要查询所属商家信息（多对一）（注意：一个商家一个订单）。
	 * 2、查询订单信息的同时，还需要查询所属订单明细信息（一对多）。
	 */
	public Orders getOrdersById(Integer orderId);
	public List<Orders> listOrdersByUserId(String userId);
	@Update("UPDATE `orders` SET orderState=1 WHERE orderId=#{orderId}")
	public int updateState(Integer orderId);
}
