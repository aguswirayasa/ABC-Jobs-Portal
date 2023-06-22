# ABC-Jobs-Portal

A web application that allow users to find jobs and make connection. On this application users can register and login to the website, search another user, edit profile, change password. The application also includes administration that has authority to manage the user data.

## Project Overview

There are 2 types of users in this Community portal. They are

    Software Programmer
    Administrator

Software Programmer can perform following functions in the portal

    Login and Register in to the portal
    Search & Find Other Programmers after login and view their profile.
    Change password retrieval functionality.
    Update their Profile after logging in.
    Create Threads & Post Replies to a Thread
    Post Job Opportunities in the Portal
    Apply for Job Opportunities in the portal

Administrator can perform following functions in the portal

    Administer user data.
    Send bulk email inviting programmers to register on the community portal

## Technologies Used

The ABC-Cars-Portal project utilizes the following technologies:

- Front-end: JSP(Jakarta Server Page)
- Back-end: Spring MVC and Java 
- Database: MySQL
- Server: Apache Tomcat 9
- UI/UX Design: CSS, JS and Bootstrap 

## Installation and Setup

To run the Know Your Neighborhood project locally, please follow these steps:

1. Import Existing Project into Visual Studio Code or other IDE that supports Java.
2. Create MySQL database
   ```
   mysql> create database abcjobs
   ```
4. Configure persistence.xml for Database Username and Passwor
   ````````````````````````````````````````````````````````
   <persistence-unit name="community">
		<properties>
			<property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/abcjobs"/>
			<property name="javax.persistence.jdbc.user" value="<YOUR_DATABASE_USERNAME>" />
			<property name="javax.persistence.jdbc.password" value="<YOUR_DATABASE_PASSWORD>" />
			<property name="javax.persistence.jdbc.driver" value="com.mysql.jdbc.Driver" />
			<property name="hibernate.show_sql" value="true" />
			<property name="hibernate.format_sql" value="true" />
		</properties>
	</persistence-unit>
</persistence>
   `````````````````````````````````````````````````````````
6. Run application on Tomcat Server 9.0

## Screenshoot
### Landing Page
![landing page](https://github.com/aguswirayasa/kyn/blob/master/Know%20Your%20Neighborhood%20Screenshoot/landing.png)

### About us Page
![About us page](https://github.com/aguswirayasa/kyn/blob/master/Know%20Your%20Neighborhood%20Screenshoot/about-us.jpeg)
### Contact us Page

![Contact us page](https://github.com/aguswirayasa/kyn/blob/master/Know%20Your%20Neighborhood%20Screenshoot/contact-us.png)

### Login Page
![Login page](https://github.com/aguswirayasa/kyn/blob/master/Know%20Your%20Neighborhood%20Screenshoot/login.png)

### Registration Page
![Registration page](https://github.com/aguswirayasa/kyn/blob/master/Know%20Your%20Neighborhood%20Screenshoot/registration.png)

### Dashboard
![Dashboard page](https://github.com/aguswirayasa/kyn/blob/master/Know%20Your%20Neighborhood%20Screenshoot/profile.png)

### Manage user Page
![Manage user page](https://github.com/aguswirayasa/kyn/blob/master/Know%20Your%20Neighborhood%20Screenshoot/manage-user.png)

