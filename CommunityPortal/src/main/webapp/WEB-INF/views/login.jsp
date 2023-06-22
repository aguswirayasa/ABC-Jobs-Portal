<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

  <style type="text/css">
   
   .toggle-position{
	position: absolute;
	top: 15px;
	right: 30px;
	cursor: pointer;
	transition: 0.5s;
}
   </style>
</head>
<body>
	 <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-xl-10">
        <div class="card" style="border-radius: 1rem;">
          <div class="row g-0">
            <div class="col-md-8 col-lg-7 d-none d-md-block">
              <img src="image/login.jpg"
                alt="login form" class="img-fluid h-100 w-100" style="border-radius: 1rem 0 0 1rem;" />
            </div>
            <div class="col-md-4 col-lg-5 d-flex align-items-center card">
              <div class="card-body p-4 p-lg-5 text-black">
                <form:form action="auth" method="post" class="needs-validation" modelAttribute="user" novalidate="novalidate">

                  <div class="d-flex align-items-center mb-3 pb-1">
                    <img alt="logo" src="image/logo.png" width="200px" class="ps-1">
                  </div>

                  <h1 class="fw-normal mb-3 pb-3 fs-3" style="letter-spacing: 1px;">Sign into your account</h1>

                  <div class="form-outline mb-4">
                    <form:input type="email" id="validationCustom01" class="form-control form-control-lg" required="required" path="email"/>
                    <label class="form-label" for="validationCustom01">Email address</label>
                    <div class="invalid-feedback">
					  Please enter a valid email.
					</div>
                  </div>

                  <div class="form-outline mb-4" style="position: relative;">
                    <form:input type="password" id="validationCustom02" class="form-control form-control-lg password" required="required" path="password"/>
                     <img src="image/eye-close.svg" alt="eye" class="toggle-position" width="20px" height="20px" onclick="togglePassword()">
                    <label class="form-label" for="validationCustom02">Password</label>
                    <div class="invalid-feedback">
					  Please enter your password.
					</div>
                  </div>
					<div class="alert alert-danger alert-dismissible fade show my-3 ${ message == null ? " d-none" : "d-block" }" role="alert">
      						${ message }
     					 <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
   					 </div>	

                  <div class="pt-1 mb-4">
                  	  <button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>
                  </div>

                  <a class="small text-muted" href="forget-password">Forgot password?</a>
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="register"
                      style="color: #393f81;">Register here</a></p>
                  <a href="#!" class="small text-muted">Terms of use.</a>
                  <a href="#!" class="small text-muted">Privacy policy</a>
                </form:form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="footer.jsp" />
  <script type="text/javascript" src="/CommunityPortal/js/toggle.js"></script>
</body>
</html>