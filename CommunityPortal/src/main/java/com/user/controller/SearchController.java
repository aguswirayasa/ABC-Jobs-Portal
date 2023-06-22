package com.user.controller;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.user.model.Education;
import com.user.model.Experience;
import com.user.model.Profile;
import com.user.service.ProfileService;
import com.user.service.SearchService;

@Controller
public class SearchController {
	
	@Autowired
	SearchService ss;
	
	@Autowired
	ProfileService ps;
	
	private Map<Long, Profile> profileMap = new HashMap<>();
	
	@RequestMapping(value= "/result", method = RequestMethod.GET)
	public ModelAndView getSearch(Model model) {
		model.addAttribute("profile",profileMap);
		return new ModelAndView("search-result");
	}
	
	    
	@RequestMapping(value="/search", method = RequestMethod.POST)
	public ModelAndView searchProfiles(@RequestParam("input") String searchInput,Model model) {
		List<Profile> profiles = null;
	    String[] searchTerms = searchInput.split(",");
	    String[] input = searchInput.split(" ");
	    String firstName = null;
	    String lastName = null;
	    String city = null;
	    String country = null;
	    
	    if (input.length > 1 || searchTerms.length > 1) {
			System.out.println("input =" + input.length);
			System.out.println("input =" + searchTerms.length);
	    	for (String term : searchTerms) {
	    		term = term.trim();
	    		if (term.contains(" ")) {
	    			String[] names = term.split(" ");
	    			if (names.length == 2) {
	    				if (firstName == null) {
	    					firstName = names[0];
	    				}
	    				if (lastName == null) {
	    					lastName = names[1];
	    				}
	    			}
	    		} else if (city == null) {
	    			city = term;
	    		} else if (country == null) {
	    			country = term;
	    		}
	    	}
	    	profiles = ss.search(firstName, lastName, city, country);
		}else {
			System.out.println(searchInput);
			   
			   profiles = ss.findAnyMatches(searchInput);
		}
	    profileMap.clear();
	    if (profiles!=null) {
	    	for (Profile profile : profiles) {
	    		profileMap.put(profile.getProfileId(), profile);
	    	}
			model.addAttribute("profile",profiles);
			return new ModelAndView("search-result");
		}else {
			String err = "no user found";
			model.addAttribute("err",err);
			return new ModelAndView("home");
		}
	
	    
	}
	
	
	@RequestMapping(value = "/profile/{fullName}", method = RequestMethod.GET)
	public ModelAndView showProfile(@PathVariable("fullName") String fullName, Model model) {

	    // Find the user profile based on the fullName path variable
	    Profile profile = null;
	    for (Map.Entry<Long, Profile> entry : profileMap.entrySet()) {
	        if (entry.getValue().getFullName().equals(fullName)) {
	            profile = entry.getValue();
	            break;
	        }
	    }

	    // If no profile is found, redirect to the search page with an error message
	    if (profile == null) {
	        String msg = "Profile not found";
	        model.addAttribute("msg", msg);
	        System.out.println("profile null");
	        return new ModelAndView("redirect:/search") ;
	    }

	    // Get the user's education and experience based on their profile ID
	    Long profileId = profile.getProfileId();
	    List<Education> ed = ps.getUserEducation(profileId);
	    List<Experience> exp = ps.getUserExperience(profileId);
	    
	    // Get the user's profile image
	    byte[] imageData = profile.getProfileImage();
		
        if (imageData!=null) {
        	// Convert the image data to a base64 string
        	String base64Image = Base64.getEncoder().encodeToString(imageData);
			model.addAttribute("profileImage",base64Image);
		}else {
			model.addAttribute("profileImage",null);

		}

	    // Add the profile, education, and experience to the Model object
	    model.addAttribute("profile", profile);
	    model.addAttribute("education", ed);
	    model.addAttribute("experience", exp);

	    // Return the public-profile view
	    return new ModelAndView("public-profile");
	}


}
