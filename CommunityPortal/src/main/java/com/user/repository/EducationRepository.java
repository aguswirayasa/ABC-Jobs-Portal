package com.user.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.user.model.Education;

public interface EducationRepository extends JpaRepository<Education, Long>{
	@Query(value = "SELECT*FROM education WHERE :profile_id = profile_id",nativeQuery = true)
	List<Education> getEducation(@Param("profile_id")Long profileId);
}
