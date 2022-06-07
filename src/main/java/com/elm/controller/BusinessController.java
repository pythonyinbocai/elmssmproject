package com.elm.controller;

import java.util.List;

import com.elm.pojo.Cart;
import com.elm.pojo.Food;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.elm.pojo.Business;
import com.elm.service.BusinessService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/business")
public class BusinessController {
	
	@Autowired
	private BusinessService businessService;

	@RequestMapping("/listBusinessByOrderTypeId")
	/**
	 * 注意点：
	 * 1、使用post请求，如果前端做了参数序列化，那么服务器端就不能使用@RequestBody。
	 * 2、使用post请求，如果前端没做参数序列化，那么就使用@RequestBody，在服务器端做参数序列化处理。
	 * 3、使用post请求，前端传的是序列化的JSON对象，Controller接收时也要使用对象或集合接收。
	 */
	public String listBusinessByOrderTypeId(Model model, HttpSession session, Integer orderTypeId) throws Exception{
		List<Business> businessList=businessService.listBusinessByOrderTypeId(orderTypeId);
		List<Cart> cartList = (List<Cart>)session.getAttribute("cartList");
		if(cartList!=null&&cartList.size()>0){//如果当前登录用户购物车有数据，就遍历所有商家
            for (int i=0;i<businessList.size();i++){
				//给每一个商家添加一个数量属性，默认为0
				businessList.get(i).setQuantity(0);
				for (Cart cart:cartList){//遍历当前用户的购物车
					if(businessList.get(i).getBusinessId().equals(cart.getBusinessId())){//判断当前用户购物车中是否有当前商家的食品，如果有，就把数量加上
						businessList.get(i).setQuantity(businessList.get(i).getQuantity()+cart.getQuantity());
					}
				}
			}
			//按照数量排序
			businessList.sort((a, b) -> b.getQuantity() - a.getQuantity());
		}
		model.addAttribute("businessList",businessList);
		return "businessList";
	}
	
	@RequestMapping("/getBusinessById")
	public String getBusinessById(HttpSession session,Model model,Integer id) throws Exception{
		Business business=businessService.getBusinessById(id);
		List<Cart> cartList = (List<Cart>)session.getAttribute("cartList");
		if(cartList!=null&&cartList.size()>0) {//如果当前登录用户购物车有数据，就遍历所有食品
			for (int i=0;i<business.getFoodList().size();i++){
				business.getFoodList().get(i).setQuantity(0);
				for (Cart cart:cartList){//遍历当前用户的购物车
					if(business.getFoodList().get(i).getFoodId().equals(cart.getFoodId())&&business.getBusinessId().equals(cart.getBusinessId())){//判断当前用户购物车中是否有当前商家的食品，如果有，就把数量加上
						business.getFoodList().get(i).setQuantity(business.getFoodList().get(i).getQuantity()+cart.getQuantity());
					}
				}
			}
			//按照数量排序
			business.getFoodList().sort((a, b) -> b.getQuantity() - a.getQuantity());
		}
		model.addAttribute("business",business);
		return "businessInfo";
	}
	
}
