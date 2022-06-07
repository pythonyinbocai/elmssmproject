package com.elm.controller;

import com.elm.pojo.Cart;
import com.elm.pojo.DeliveryAddress;
import com.elm.pojo.User;
import com.elm.service.BusinessService;
import com.elm.service.CartService;
import com.elm.service.DeliveryAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/pay")
public class PayController {
    @Autowired
    private CartService cartService;
    @Autowired
    private DeliveryAddressService deliveryAddressService;
    @Autowired
    private BusinessService businessService;
    @RequestMapping("/topayment")
    public String topayment(Model model,HttpSession session, Integer businessId,Double total,Double realDeliveryPrice){
        Object loginuser = session.getAttribute("loginuser");
        if(loginuser==null){
            return "login";
        }
        Cart cart = new Cart();
        cart.setBusinessId(businessId);
        cart.setUserId(((User)loginuser).getUserId());
        model.addAttribute("total",total);
        model.addAttribute("business",businessService.getBusinessById(businessId));
        model.addAttribute("cartList",cartService.listCart(cart));
        model.addAttribute("addressList",deliveryAddressService.listDeliveryAddressByUserId(((User)loginuser).getUserId()));
        return "payment";
    }

}
