package com.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.user.model.Profile;
import com.user.model.User;
import com.user.repository.ProfileRepository;
import com.user.repository.UserRepository;

@Service
@Transactional
public class AdminService {
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	ProfileRepository profileRepository;
	
	public List<User> getAllUser(){
		return userRepository.findAllWithProfile();
	}
	
	public void editUser(Long id,String email,String password,String firstName,String lastName) {
		userRepository.updateUserAndProfile(id, email, password, firstName, lastName);
	}
	
	public void  deleteUserById(Long userId) {
		userRepository.deleteById(userId);
	}
}
