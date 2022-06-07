package com.elm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.elm.pojo.Cart;

@Mapper
public interface CartMapper {

	/**
	 * 1、在"显示商家列表（BusinessList）"业务中，会根据userId查询当前用户购物车中有哪些商家的食品
	 * 2、在"显示商家信息及此商家食品（BusinessInfo）"业务中，会根据userId、businessId查询当前用户购物车中当前商家的食品
	 * 3、在"创建订单"业务中，会根据userId、businessId查询当前用户购物车中当前商家的食品
	 * 4、还需要Cart中的Food和Business的多对一数据
	 * 所以，此sql语句放在映射文件中书写，判断多条件查询与多对一映射
	 */
	public List<Cart> listCart(Cart cart);
	
	@Insert("insert into cart values(null,#{foodId},#{businessId},#{userId},1)")
	public int saveCart(Cart cart);
	
	@Insert("update cart set quantity=#{quantity} where foodId=#{foodId} and businessId=#{businessId} and userId=#{userId}")
	public int updateCart(Cart cart);
	
	/**
	 * 1、在"显示商家信息及此商家食品（BusinessInfo）"业务中，如果此商品订购数量减为0，就会根据userId、businessId、foodId删除购物车中的这条食品记录
	 * 2、在"创建订单"业务中，会根据userId、businessId删除当前用户购物车中当前商家的所有食品
	 * 所以，此sql语句放在映射文件中书写，判断多条件删除
	 */
	public int removeCart(Cart cart);
}
