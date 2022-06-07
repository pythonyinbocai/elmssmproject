package com.elm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class ContextPathController {
    @RequestMapping("/")
    public String toindex(){
        return "index";
    }
    @RequestMapping("/my")
    public  String toMy(Model model,HttpSession session){
        Object loginuser = session.getAttribute("loginuser");
        if(loginuser==null){
            return "redirect:/UserController/tologin";
        }else{
            model.addAttribute("user",loginuser);
            return "userInfo";
        }
    }
}
