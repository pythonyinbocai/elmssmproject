package com.elm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.elm.pojo.User;

@Mapper
public interface UserMapper {

	@Select("select * from user where userId=#{userId} and password=#{password}")
	public User getUserByIdByPass(User user);
}
