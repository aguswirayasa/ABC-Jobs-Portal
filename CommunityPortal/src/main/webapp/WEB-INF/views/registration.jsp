<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/CommunityPortal/css/index.css">
<title>Registration</title>
<style type="text/css">
	.toggle-position{
	position: absolute;
	top: 40px;
	right: 30px;
	cursor: pointer;
	transition: 0.5s;
}
	
</style>
</head>
<body>
	<div class="container my-5 card" style="border-radius: 1rem;">
	<h1 class="my-5 text-center">Pursuit your dream with us</h1>
<form:form class="row g-3 needs-validation card-body"  action="confirm-email" method="post" novalidate="novalidate" modelAttribute="register">
  <div class="col-md-6">
    <label for="validationCustom01" class="form-label">First name</label>
	<form:input 
	type="text" 
	class="form-control"
	name="firstName"
	id="validationCustom01" 
	required="required"
	path="profile.firstName"
	/>	
    <div class="invalid-feedback">
      Please provide your first name.
    </div>
  </div>
  <div class="col-md-6">
    <label for="validationCustom02" class="form-label">Last name</label>
    <form:input 
    type="text" 
    class="form-control" 
    id="validationCustom02"  
    name="lastName"
    required="required"
    path="profile.lastName"
     />
    <div class="invalid-feedback">
      Please provide your last name.
    </div>
  </div>
  <div class="col-md-6">
    <label for="validationCustom03" class="form-label">Email</label>
    <form:input 
    type="email" 
    class="form-control" 
    id="validationCustom03"
    name="email" 
    required="required"
    path="email"
    />
    <div class="invalid-feedback">
      Please provide a valid email.
    </div>
  </div>
  <div class="col-md-6" style="position: relative">
    <label for="validationCustom04" class="form-label">Password</label>
    <form:input 
    type="password" 
    class="form-control password" 
    id="validationCustom04" 
    name="password"
    required="required"
    path="password"
    />
    <img src="image/eye-close.svg" alt="eye" class="toggle-position" width="20px" height="20px" onclick="togglePassword()">
    <div class="invalid-feedback">
      Please provide a password.
    </div>
  </div>
  <div class="col-md-6">
    <label for="validationCustom05" class="form-label">Country</label>
    <form:input 
    type="text" 
    class="form-control" 
    id="validationCustom05" 
    name="country"
    required="required"
    path="profile.country"
    />
    <div class="invalid-feedback">
      Please provide a country.
    </div>
  </div>
  <div class="col-md-6">
    <label for="validationCustom06" class="form-label">City</label>
    <form:input 
    type="text" 
    class="form-control" 
    id="validationCustom06" 
    name="city" 
    required="required"
    path="profile.city"
    />
    <div class="invalid-feedback">
      Please provide a city.
    </div>
  </div>
  <div class="col-12">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
      <label class="form-check-label" for="invalidCheck">
        Agree to Abc Jobs user agreement, privacy policy, and cookie policy.
      </label>
      <div class="invalid-feedback">
        You must agree before submitting.
      </div>
    </div>
  </div>
  <div class="col-12">
    <button class="btn btn-primary mb-5" type="submit">Register</button>
  </div>
</form:form>

	</div>	
	
<jsp:include page="footer.jsp" />
<script type="text/javascript" src="/CommunityPortal/js/toggle.js"></script>
</body>
</html>