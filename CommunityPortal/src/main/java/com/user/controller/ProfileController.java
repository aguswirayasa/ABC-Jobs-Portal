package com.user.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.user.model.Education;
import com.user.model.Experience;
import com.user.model.Profile;
import com.user.model.User;
import com.user.service.AdminService;
import com.user.service.ProfileService;

@Controller
public class ProfileController {
	
	@Autowired
	ProfileService ps;
	

		@RequestMapping("/profile")
		public ModelAndView viewProfile(Model model, HttpSession session) {
			User user = (User) session.getAttribute("user");
			if(user!=null) {
				// Create model object for form
				Profile profile = new Profile();
				Education edu = new Education();
				Experience exp = new Experience();
				model.addAttribute("profile",profile);
				model.addAttribute("edu",edu);
				model.addAttribute("exp",exp);
				// Fetch user education,experience and image
				Long profileId = user.getProfile().getProfileId();
				List<Education> userEducation = ps.getUserEducation(profileId);
				List<Experience> userExperience = ps.getUserExperience(profileId);
				model.addAttribute("education",userEducation);
				model.addAttribute("experience",userExperience);
				
			    byte[] imageData = user.getProfile().getProfileImage();
	
		        if (imageData!=null) {
		        	// Convert the image data to a base64 string
		        	String base64Image = Base64.getEncoder().encodeToString(imageData);
					model.addAttribute("profileImage",base64Image);
				}else {
					model.addAttribute("profileImage",null);

				}
				return new ModelAndView("profile");
			}else {
				return new ModelAndView("redirect:/");
			}
		

		}
		@RequestMapping(value="/profile/edit" ,method= RequestMethod.POST)
		public ModelAndView editProfile(@ModelAttribute("profile")Profile profile, Model model,HttpSession session) {
			User user = (User) session.getAttribute("user");
			// Check if the request comes from admin or user
			if (user.getProfile().getProfileId() == profile.getProfileId()) {
				Long profileId = user.getProfile().getProfileId();
				Profile updatedProfile = ps.updateProfile(profileId, profile);
				user.setProfile(updatedProfile);
				session.setAttribute("user", user);				
				return new ModelAndView("redirect:/profile");
			}else {
				ps.updateProfile(profile.getProfileId(), profile);
				return new ModelAndView("redirect:/admin/administer");
			}
		

		}
		
		
		@RequestMapping(value="/profile/add/education", method = RequestMethod.POST)
		public ModelAndView saveEducation(@ModelAttribute("edu") Education education,@RequestParam("profileId") Long id,HttpSession session,Model model) {
			User user = (User) session.getAttribute("user");
			Long profileId = user.getProfile().getProfileId();
			
			// Check if the request comes from admin or user
			if (user.getProfile().getProfileId() == id) {
				ps.addEducation(profileId, education);
				return new ModelAndView("redirect:/profile");
			}else {
				ps.addEducation(id, education);
				return new ModelAndView("redirect:/admin/administer");
			}
			
		}
		
		@RequestMapping(value="/profile/add/experience", method = RequestMethod.POST)
		public ModelAndView saveExperience(@ModelAttribute("exp") Experience experience,@RequestParam("profileId") Long id,HttpSession session,Model model) {;
			User user = (User) session.getAttribute("user");
			Long profileId = user.getProfile().getProfileId();
			// Check if the request comes from admin or user
			if (user.getProfile().getProfileId() == id) {
				ps.addExperience(profileId, experience);
				return new ModelAndView("redirect:/profile");
			}else {
				ps.addExperience(id, experience);
				return new ModelAndView("redirect:/admin/administer");
			}
			
		}
		
		
		@RequestMapping(value="/upload-image", method = RequestMethod.POST)
		public ModelAndView uploadImage(@RequestParam("file") MultipartFile file,@RequestParam("id") Long profileId, RedirectAttributes redirectAttributes,HttpSession session,Model model) {
			if (file.isEmpty()) {
		        redirectAttributes.addFlashAttribute("message", "Please select a file to upload.");
		        return new ModelAndView("redirect:/profile");
		    }

		    try {
		    	// Getting User Profile		    	
		    	User user = (User) session.getAttribute("user");
		    	Profile profile = new Profile()
		    		;
		        // Convert MultipartFile to byte array
		        byte[] imageData = file.getBytes();
		        
		        // Check if it from user or admin
		        // Save image data to database using service layer
		        if (user.getProfile().getProfileId() == profileId) {
					profile = user.getProfile();
					ps.saveImage(profile,imageData);
					redirectAttributes.addFlashAttribute("message", "Image uploaded successfully!");
					System.out.println("Image uploaded successfully!");

					return new ModelAndView("redirect:/profile");
				} else {
					profile = ps.getProfile(profileId);
					ps.saveImage(profile,imageData);
					redirectAttributes.addFlashAttribute("message", "Image uploaded successfully!");
					System.out.println("Image uploaded successfully!");
					return new ModelAndView("redirect:/admin/administer");
				}
		        

		    } catch (IOException e) {
		        e.printStackTrace();
		        redirectAttributes.addFlashAttribute("message", "Failed to upload image.");
		        System.out.println("Failed to upload image.");
		        return new ModelAndView("redirect:/dashboard");
		    }

		}



}
