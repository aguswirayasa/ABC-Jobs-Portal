package com.user.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User {


		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "user_id")
		private Long userId;

		private String email;
		private String password;
		
		@Column(name = "role_id")
		private int roleId;


		@OneToOne(cascade = CascadeType.ALL, mappedBy = "user")
		Profile profile;


		public User() {

		}

		public User(String email, String password, Profile profile,int roleId) {
			super();
			this.email = email;
			this.password = password;
			this.profile = profile;
			this.roleId = roleId;
		}

		public Profile getProfile() {
			return profile;
		}

	

		public Long getUserId() {
			return userId;
		}

		public void setUserId(Long userId) {
			this.userId = userId;
		}

		public void setProfile(Profile profile) {
			this.profile = profile;
		}

		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}

		public int getRoleId() {
			return roleId;
		}

		public void setRoleId(int role_id) {
			this.roleId = role_id;
		}
}
