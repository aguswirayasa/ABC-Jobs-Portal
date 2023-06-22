package com.user.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.user.model.User;
import com.user.service.RegisterService;



@Controller
public class UserController {

	@Autowired
	RegisterService registerService;

	@RequestMapping("/")
	public String landing(HttpSession session,Model model) {
		User user = (User) session.getAttribute("user");
		boolean isLogin = false;
		if (user!=null) {
			isLogin = true;
			model.addAttribute("isLogin",isLogin);
		}else {
			model.addAttribute("isLogin",isLogin);
		}
		return "index";
	}
	
	
	@RequestMapping("/profile/home")
	public String redirecthome() {
		return "home";
	}

	@RequestMapping("/verify")
	public String verifyEmail() {
		return "email-confirmation";
	}
	@RequestMapping("/thanks")
	public String thankYou() {
		return "thank-you";
	}


	@RequestMapping("/login")
	public String login() {
		return "login";
	}



	@RequestMapping("/result")
	public String search() {
		return "search";
	}

}
