package com.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.user.model.Profile;
import com.user.model.User;
import com.user.repository.ProfileRepository;

@Service
@Transactional
public class RegisterService {

	@Autowired
	ProfileRepository profileRepo;

	public void saveRegister(User regUser) {
		User user = new User();
		Profile profile = new Profile();

		User userRegister = new User(regUser.getEmail(), regUser.getPassword(), profile,regUser.getRoleId());
		Profile userProfile = new Profile(user,
				regUser.getProfile().getFirstName(),
				regUser.getProfile().getLastName(),
				regUser.getProfile().getCountry(),
				regUser.getProfile().getCity());

		userRegister.setProfile(userProfile);
		userProfile.setUser(userRegister);

		profileRepo.save(userProfile);
	}

}