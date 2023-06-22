package com.user.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.user.model.Experience;

public interface ExperienceRepository extends JpaRepository<Experience, Long>{
	@Query(value = "SELECT*FROM experience WHERE :profile_id = profile_id",nativeQuery = true)
	List<Experience> getExperience(@Param("profile_id")Long profileId);
}
