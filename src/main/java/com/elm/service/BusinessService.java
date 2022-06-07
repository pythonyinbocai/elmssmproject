package com.elm.service;

import java.util.List;

import com.elm.pojo.Business;

public interface BusinessService {

	public List<Business> listBusinessByOrderTypeId(Integer orderTypeId);
	public Business getBusinessById(Integer businessId);
}
