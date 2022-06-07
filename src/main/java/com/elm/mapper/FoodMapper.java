package com.elm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.elm.pojo.Food;

@Mapper
public interface FoodMapper {

	@Select("select * from food where foodId = #{foodId} order by foodId")
	public Food getFoodById(Integer foodId);
	
	@Select("select * from food where businessId = #{businessId} order by foodId")
	public List<Food> listFoodByBusinessId(Integer businessId);
}
