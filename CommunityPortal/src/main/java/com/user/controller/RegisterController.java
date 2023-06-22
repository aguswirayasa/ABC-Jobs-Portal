package com.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.user.model.Profile;
import com.user.model.User;
import com.user.service.RegisterService;

@Controller
public class RegisterController {

	@Autowired
	RegisterService registerService;

	@RequestMapping("/register")
	public String registerPage(HttpSession session, Model model) {


			User user = new User();
			Profile profile = new Profile();
			user.setProfile(profile);
			model.addAttribute("register", user);


		return "registration";
	}
	
	@RequestMapping(value = "confirm-email", method = RequestMethod.POST)
	public String verifyEmail(@ModelAttribute("register") User user, Model model, HttpSession session) {
		session.setAttribute("user", user);
		return "email-confirmation";
	}
	
	
	@RequestMapping(value = "save-user", method = RequestMethod.POST)
	public String registerUser(HttpSession session) {
		User user = (User) session.getAttribute("user");
		user.setRoleId(2);
		registerService.saveRegister(user);
	

		return "thank-you";

	}
}
