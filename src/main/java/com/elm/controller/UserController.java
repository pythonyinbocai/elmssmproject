package com.elm.controller;

import com.elm.pojo.Cart;
import com.elm.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.elm.pojo.User;
import com.elm.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/UserController")
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService;

	@RequestMapping("/tologin")
	public String tologin(HttpServletRequest request){
		HttpSession session = request.getSession();
		String refererStr=request.getHeader("Referer");
		//如果登陆前页面不是登录页面，保存登录前的页面
		if(!refererStr.contains("login")) {
			session.setAttribute("privatePage", refererStr);
		}
		return "login";

	}
	@RequestMapping("/toregister")
	public String toregister(){
		return "register";
	}
	@RequestMapping("/getUserByIdByPass")
	public String getUserByIdByPass(HttpSession session, User user) throws Exception{
		User loginuser = userService.getUserByIdByPass(user);
		if(loginuser==null){
			return "redirect:tologin";
		}
			session.setAttribute("loginuser",loginuser);
			Cart cart = new Cart();
			cart.setUserId(loginuser.getUserId());
			session.setAttribute("cartList",cartService.listCart(cart));
		//判断用户来源
		//获取用户登录前以页面
		Object privatePage = session.getAttribute("privatePage");
		if(privatePage==null) {
			//直接登录到主页
			return "redirect:/";
		}else {
			return "redirect:"+privatePage.toString();
		}
	}
	
}
