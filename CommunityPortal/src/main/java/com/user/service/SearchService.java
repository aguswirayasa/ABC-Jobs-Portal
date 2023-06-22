package com.user.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.model.Profile;
import com.user.repository.ProfileRepository;

import javax.persistence.criteria.Predicate;



@Service
@Transactional
public class SearchService {
	
	@Autowired
	ProfileRepository profileRepository;
	public List<Profile> search(String firstName, String lastName, String city, String country) {
	    return profileRepository.searchProfiles(firstName);
	       
	}

	public List<Profile> findAnyMatches(String input) {
		return profileRepository.searchProfiles(input);
		
	}
}
