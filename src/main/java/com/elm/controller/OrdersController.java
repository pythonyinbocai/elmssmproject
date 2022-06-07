package com.elm.controller;

import java.util.List;

import com.elm.pojo.Cart;
import com.elm.pojo.User;
import com.elm.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.elm.pojo.Orders;
import com.elm.service.OrdersService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/OrdersController")
public class OrdersController {
	
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private CartService cartService;

	@RequestMapping("/createOrders")
	public String createOrders(HttpSession session,Orders orders) throws Exception{
		Object loginuser = session.getAttribute("loginuser");
		if(loginuser==null){
			return "login";
		}
		orders.setUserId(((User)loginuser).getUserId());
		ordersService.createOrders(orders);//需要传递三个参数：userId,businessId,daId
		Cart scart = new Cart();
		scart.setUserId(((User) loginuser).getUserId());
		session.setAttribute("cartList",cartService.listCart(scart));
		return "redirect:listOrdersByUserId";
	}
	
	@RequestMapping("/getOrdersById")
	public String getOrdersById(Model model, Orders orders) throws Exception{
		model.addAttribute("order",ordersService.getOrdersById(orders.getOrderId()));
		return "order";
	}	
	
	@RequestMapping("/listOrdersByUserId")
	public String listOrdersByUserId(HttpSession session,Model model) throws Exception{
		Object loginuser = session.getAttribute("loginuser");
		if(loginuser==null){
			return "login";
		}
		model.addAttribute("orderList",ordersService.listOrdersByUserId(((User)loginuser).getUserId()));
		return "orderList";
	}
	@RequestMapping("/updateState")
	public String updateState(HttpSession session,Integer orderId){
		Object loginuser = session.getAttribute("loginuser");
		if(loginuser==null){
			return "login";
		}
		ordersService.updateState(orderId);
		return "redirect:listOrdersByUserId";
	}
}
