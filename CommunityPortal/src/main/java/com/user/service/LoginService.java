package com.user.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.model.User;
import com.user.repository.UserRepository;

@Service
@Transactional
public class LoginService {

	@Autowired
	UserRepository repo;

	public User authenticateUser(User user) {

		try {
			User login = repo.login(user.getEmail(), user.getPassword());
			return login;

		} catch (Exception e) {
			System.out.println("wrong credentials"+e);
		}
		return null;
	}
	
	public User checkEmail(String email) {
		return repo.getUserByEmail(email);
		
	}
	
	public boolean resetPassword(User user) {
		try {
			repo.save(user);	
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
	public List<User> getThereUser(){
		return repo.getThreeUser();
		
	}
}
