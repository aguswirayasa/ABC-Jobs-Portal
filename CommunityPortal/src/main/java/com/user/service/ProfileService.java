package com.user.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.model.Education;
import com.user.model.Experience;
import com.user.model.Profile;
import com.user.model.User;
import com.user.repository.EducationRepository;
import com.user.repository.ExperienceRepository;
import com.user.repository.ProfileRepository;
import com.user.repository.UserRepository;

@Service
@Transactional
public class ProfileService {

	@Autowired
	ProfileRepository profileRepo;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	EducationRepository educationRepository;
	
	@Autowired
	ExperienceRepository experienceRepository;

	public Profile updateProfile(Long profileId,Profile profile) {
		Profile updatedProfile = profileRepo.findById(profileId).get();

		updatedProfile.setFirstName(profile.getFirstName());
		updatedProfile.setLastName(profile.getLastName());
		updatedProfile.setCountry(profile.getCountry());
		updatedProfile.setCity(profile.getCity());
		updatedProfile.setHeadline(profile.getHeadline());

		return profileRepo.save(updatedProfile);
	}
	
	
    public Profile getProfile(Long id) {
        Optional<Profile> profile = profileRepo.findById(id);
        return profile.orElse(null);
    }
    
    public void saveProfile(Profile profile) {
        profileRepo.save(profile);
    }

    public void addEducation(Long profileId, Education education) {
    	System.out.println("adding");
        Profile profile = getProfile(profileId);
        if (profile != null) {
            education.setProfile(profile);
            educationRepository.save(education);
        }
       	System.out.println("Success");
    }
    
    public List<Education> getUserEducation(Long profileId){
    	try {
    		List<Education> education = educationRepository.getEducation(profileId);
    		System.out.println("education fetched");
    		return education;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
    	
    }
    public void addExperience(Long profileId, Experience experience) {
    	System.out.println("adding");
    	Profile profile = getProfile(profileId);
    	if (profile != null) {
    		experience.setProfile(profile);
    		experienceRepository.save(experience);
    	}
    	System.out.println("Success");
    }
    
    public List<Experience> getUserExperience(Long profileId){
    	try {
    		List<Experience> experience = experienceRepository.getExperience(profileId);
    		System.out.println("experience fetched");
    		return experience;
    		
    	} catch (Exception e) {
    		System.out.println(e);
    	}
    	return null;
    	
    }
    
    public void saveImage(Profile profile,byte[] imageData) {
        profile.setProfileImage(imageData);
        profileRepo.save(profile);
    }
    


}
