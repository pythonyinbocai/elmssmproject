package com.elm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.elm.pojo.OrderDetailet;

@Mapper
public interface OrderDetailetMapper {

	public int saveOrderDetailetBatch(List<OrderDetailet> list);
	
	//查询订单明细的同时，需要查询所属食品信息（多对一）
	public List<OrderDetailet> listOrderDetailetByOrderId(Integer orderId);
}
