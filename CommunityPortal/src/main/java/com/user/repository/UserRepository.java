package com.user.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.user.model.User;

public interface UserRepository extends JpaRepository<User, Long>{
	@Query(value = "SELECT*FROM users WHERE :email = email AND :password = password",nativeQuery = true)
	User login(@Param("email")String email, @Param("password")String password);
	
	@Query(value = "SELECT*FROM users WHERE email = :email",nativeQuery = true)
	User getUserByEmail(@Param("email")String email);
	
	 @Query("SELECT u FROM User u LEFT JOIN FETCH u.profile")
	   List<User> findAllWithProfile();
	 
	 @Modifying
	 @Query(value = "UPDATE users u JOIN user_profile p ON u.user_id = p.user_id SET u.email = :email, u.password = :password, "
	 		+ "p.first_name = :firstName, p.last_name = :lastName WHERE u.user_id = :userId", nativeQuery = true)
	 void updateUserAndProfile(@Param("userId") Long userId, @Param("email") String email, @Param("password") String password, 
			 @Param("firstName") String firstName, @Param("lastName") String lastName);
	 
	 @Query(value="SELECT * FROM users u JOIN user_profile p ON u.user_id = p.user_id LIMIT 3", nativeQuery = true)
	 List<User> getThreeUser();

}
