package com.user.model;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="user_profile")
public class Profile {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "profile_id")
	private Long profileId;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "user_id")
	private User user;
	
	
  
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "profile")
    private List<Education> education = new ArrayList<>();
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "profile")
	private List<Experience> experience = new ArrayList<>();


	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;

	@Column(name = "country")
	private String country;
	
	@Column(name = "city")
	private String city;
	
	private String headline;

	@Column(name = "profile_image")
	private byte[] profileImage;
	
	public Profile() {

	}
	public Profile(User user,Education education, String first_name, String last_name, String country, String city,String headline) {
		super();
		this.user = user;
		this.firstName = first_name;
		this.lastName = last_name;
		this.country = country;
		this.city = city;
		this.headline = headline;
	}
	public Profile(User user, String first_name, String last_name, String country, String city) {
		super();
		this.user = user;
		this.firstName = first_name;
		this.lastName = last_name;
		this.country = country;
		this.city = city;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public String getFirstName() {
	return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}

	public String getFullName() {
		return this.firstName +" "+ this.lastName;

	}
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	  public Long getProfileId() {
			return profileId;
	}
	public void setProfileId(Long profileId) {
			this.profileId = profileId;
	}
	public List<Education> getEducation() {
		return education;
	}
	public void setEducation(List<Education> education) {
		this.education = education;
	}
	public List<Experience> getExperience() {
		return experience;
	}
	public void setExperience(List<Experience> experience) {
		this.experience = experience;
	}
	public byte[] getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(byte[] profileImage) {
		this.profileImage = profileImage;
	}
	
	
	
}
