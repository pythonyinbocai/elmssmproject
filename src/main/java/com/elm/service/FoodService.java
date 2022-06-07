package com.elm.service;

import java.util.List;

import com.elm.pojo.Food;

public interface FoodService {

	public List<Food> listFoodByBusinessId(Integer businessId);
}
