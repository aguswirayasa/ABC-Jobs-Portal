package com.user.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.user.model.Education;
import com.user.model.Experience;
import com.user.model.Profile;
import com.user.model.User;
import com.user.service.AdminService;
import com.user.service.ProfileService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService as;
	
	@Autowired
	ProfileService ps;
	
	private Map<Long, User> userMap = new HashMap<>();
	
	@RequestMapping(value="/admin/administer",method = RequestMethod.GET)
	public ModelAndView admin(Model model) {
		// Create model object
		User userModel = new User();
		Profile profile = new Profile();
		userModel.setProfile(profile);
		// Fetch all user from database
		List<User> allUser = as.getAllUser();
		// Map user to a Hashmap
		for (User user : allUser) {
			userMap.put(user.getUserId(), user);
    	}
		model.addAttribute("alluser",allUser);
		model.addAttribute("user",userModel);
		return new ModelAndView("admin");
		
	}
	
	@RequestMapping(value = "/view-profile/{fullName}", method = RequestMethod.GET)
	public ModelAndView viewProfileByFullName(@PathVariable("fullName") String fullName, Model model) {

	    // Find the user profile based on the fullName path variable
	    User user = null;
	    for (Map.Entry<Long, User> entry : userMap.entrySet()) {
	        if (entry.getValue().getProfile().getFullName().equals(fullName)) {
	            user = entry.getValue();
	            break;
	        }
	    }

	    // If no profile is found, redirect to the search page with an error message
	    if (user == null) {
	        System.out.println("user null");
	        return new ModelAndView("redirect:/admin/administer") ;
	    }
	    
	    // Get the user's education and experience based on their profile ID
	    Long profileId = user.getProfile().getProfileId();
	    List<Education> ed = ps.getUserEducation(profileId);
	    List<Experience> exp = ps.getUserExperience(profileId);
	    
	    // Get user profile image
	    byte[] imageData = user.getProfile().getProfileImage();
		
        if (imageData!=null) {
        	// Convert the image data to a base64 string
        	String base64Image = Base64.getEncoder().encodeToString(imageData);
			System.out.println("we have the images");
			model.addAttribute("profileImage",base64Image);
		}else {
			System.out.println("we dont have it");
			model.addAttribute("profileImage",null);

		}
        
        // Create new model object for add/edit
	    Profile profile = new Profile();
	    Education education = new Education();
	    Experience experience = new Experience();

	    // Add the profile, education, and experience to the Model object
	    model.addAttribute("user", user);
	    model.addAttribute("education", ed);
	    model.addAttribute("experience", exp);
	    model.addAttribute("profile", profile);
	    model.addAttribute("edu",education);
	    model.addAttribute("exp",experience);
	    

	    // Return the public-profile view
	    return new ModelAndView("profile");
	}
	
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ModelAndView deleteUser(@PathVariable("id") Long userId) {
		as.deleteUserById(userId);
		return new ModelAndView("redirect:/admin/administer") ;
		
	}
	
	@RequestMapping(value = "/admin/edit", method = RequestMethod.POST)
	public ModelAndView editUser(@RequestParam("userId")Long userId,@RequestParam("email")String email,
			@RequestParam("password")String password,@RequestParam("firstName")String firstName,
			@RequestParam("lastName")String lastName) {
		as.editUser(userId, email, password, firstName, lastName);
		return new ModelAndView("redirect:/admin/administer");
		
	}

	
}
