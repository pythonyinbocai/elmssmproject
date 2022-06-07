package com.elm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.*;

import com.elm.pojo.Business;
import org.apache.ibatis.mapping.FetchType;

@Mapper
public interface BusinessMapper {

	@Select("select * from business where orderTypeId=#{orderTypeId} order by businessId")
	public List<Business> listBusinessByOrderTypeId(Integer orderTypeId);

	@Select("select * from business where businessId=#{businessId}")
    @Results(id = "businessMap",value={
            @Result(id = true,column ="businessId",property = "businessId"),
            @Result(column ="businessName",property = "businessName"),
            @Result(column ="businessAddress",property = "businessAddress"),
            @Result(column ="businessExplain",property = "businessExplain"),
            @Result(column ="businessImg",property = "businessImg"),
            @Result(column ="quantity",property = "quantity"),
            @Result(column ="orderTypeId",property = "orderTypeId"),
            @Result(column ="starPrice",property = "starPrice"),
            @Result(column ="deliveryPrice",property = "deliveryPrice"),
            @Result(column ="remarks",property = "remarks"),
            @Result(column ="businessId",property = "foodList",many = @Many(select = "com.elm.mapper.FoodMapper.listFoodByBusinessId",fetchType = FetchType.LAZY))
    })
    public Business getBusinessById(Integer businessId);


}
