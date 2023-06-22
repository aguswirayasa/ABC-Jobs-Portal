package com.user.repository;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.user.model.Profile;

public interface ProfileRepository extends JpaRepository<Profile, Long>{

		
	List<Profile> findAll(Specification<Profile> spec);
	
	 @Query("SELECT p FROM Profile p WHERE p.firstName LIKE %:input% OR p.lastName LIKE %:input% OR p.city LIKE %:input% OR p.country LIKE %:input%")
	    List<Profile> searchProfiles(@Param("input") String input);


}
