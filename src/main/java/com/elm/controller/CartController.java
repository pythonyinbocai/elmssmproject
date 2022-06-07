package com.elm.controller;

import java.util.List;

import com.elm.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.elm.pojo.Cart;
import com.elm.service.CartService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/CartController")
public class CartController {
	
	@Autowired
	private CartService cartService;

	@RequestMapping("/listCart")
	public List<Cart> listCart(Cart cart) throws Exception{
		return cartService.listCart(cart);
	}
	
	@RequestMapping("/saveCart")
	public @ResponseBody String saveCart(HttpSession session, @RequestBody Cart cart) throws Exception{
		Object loginuser = session.getAttribute("loginuser");
		if(loginuser==null){
			return "nologin";
		}
		cart.setUserId(((User)loginuser).getUserId());
		cartService.saveCart(cart);
		Cart scart = new Cart();
		scart.setUserId(((User) loginuser).getUserId());
		session.setAttribute("cartList",cartService.listCart(scart));
		return "success";
	}

	@RequestMapping("/updateCart")
	public @ResponseBody String updateCart(HttpSession session, @RequestBody Cart cart) throws Exception{
		Object loginuser = session.getAttribute("loginuser");
		if(loginuser==null){
			return "nologin";
		}
		cart.setUserId(((User)loginuser).getUserId());
		cartService.updateCart(cart);
		Cart scart = new Cart();
		scart.setUserId(((User) loginuser).getUserId());
		session.setAttribute("cartList",cartService.listCart(scart));
		return "success";
	}

	@RequestMapping("/removeCart")
	public @ResponseBody String removeCart(HttpSession session, @RequestBody Cart cart) throws Exception{
		Object loginuser = session.getAttribute("loginuser");
		if(loginuser==null){
			return "nologin";
		}
		cart.setUserId(((User)loginuser).getUserId());
		cartService.removeCart(cart);
		Cart scart = new Cart();
		scart.setUserId(((User) loginuser).getUserId());
		session.setAttribute("cartList",cartService.listCart(scart));
		return "success";
	}
	
}
