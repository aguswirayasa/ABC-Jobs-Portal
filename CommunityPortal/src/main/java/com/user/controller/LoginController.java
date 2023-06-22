package com.user.controller;

import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.user.model.Profile;
import com.user.model.User;
import com.user.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	LoginService ls;

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView login(HttpSession session,Model model) {
		User user = new User();
		Profile profile = new Profile();
		user.setProfile(profile);
		model.addAttribute("user",user);
		return new ModelAndView("login");
	}

	@RequestMapping(value = "/auth", method = RequestMethod.POST)
	public ModelAndView authUser(@ModelAttribute("user")User user, Model model,HttpServletRequest req, HttpServletResponse res ) {
		HttpSession session = req.getSession();
		User isLogin = ls.authenticateUser(user);
		boolean isAdmin = true;
		if (isLogin !=null) {
			if (isLogin.getRoleId()==1) {
				session.setAttribute("admin", isAdmin);
			}
			session.setAttribute("user", isLogin);
			return new ModelAndView("redirect:/dashboard");
		}else {
			String msg = "Invalid email or password";
			model.addAttribute("message", msg);
            return new ModelAndView("login") ;
        }
		
		

	}
	@RequestMapping("logout")
	public ModelAndView logOut(Model model,HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		session.removeAttribute("admin");
		return new ModelAndView("index");
	}
	
	@RequestMapping("/forget-password")
	public ModelAndView forgetPassword() {
		return new ModelAndView("forget-password");
	}
	
	@RequestMapping("/verify-email")
	public ModelAndView verifyEmail(@Param("email") String email,HttpServletRequest req) {
		User user = new User();
		System.out.println(email);
		HttpSession session = req.getSession();
		user = ls.checkEmail(email);
		System.out.println("cheking email");
		if (user!=null) {			
			session.setAttribute("user", user);
		} else {
			System.out.println("somewhen wrong user is null");
		}
		return new ModelAndView("reset-password-confirm");
	}
	@RequestMapping("/reset")
	public ModelAndView getResetPasswort(@Param("email") String email,HttpSession session) {
		return new ModelAndView("reset-password");
	}
	@RequestMapping("/reset/success")
	public ModelAndView resetSuccess(@Param("email") String email,HttpSession session) {
		return new ModelAndView("reset-password-success");
	}
	@RequestMapping("/reset/save")
	public ModelAndView resetPasswort(@Param("password") String password,HttpSession session) {
		User user = (User) session.getAttribute("user");
		user.setPassword(password);
		boolean isResetSuccess = ls.resetPassword(user);
		if (isResetSuccess) {
			return new ModelAndView("redirect:/reset/success");
		} else {
			return new ModelAndView("/forget-password");
		}
	
	}
	
	@RequestMapping("/dashboard")
	public ModelAndView home(HttpSession session,Model model) {
		
		// Get user from session
		User user = (User) session.getAttribute("user");
		// Get user profile imagge
		byte[] imageData = user.getProfile().getProfileImage();
        if (imageData!=null) {
        	// Convert the image data to a base64 string
        	String base64Image = Base64.getEncoder().encodeToString(imageData);
        	model.addAttribute("profileImage", base64Image);
		}else {
			model.addAttribute("profileImage", null);
		}
        // Get some user for recommendation
        List<User> listUser = ls.getThereUser();
        model.addAttribute("listUser",listUser);
		return new ModelAndView("dashboard") ;
	}
}
