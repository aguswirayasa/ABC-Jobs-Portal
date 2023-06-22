<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Reset Password</title>
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
                            <img src="image/reset.jpg" alt="login form" class="img-fluid h-100 w-100" />
                        </div>
                        <div class="col-md-4 col-lg-5 d-flex align-items-center card">
                            <div class="card-body p-4 p-lg-5 text-black">

                                <form action="<c:url value='/reset/save'/>" method="post" class="needs-validation"
                                    novalidate="novalidate" id="reset">

                                    <div class="d-flex align-items-center mb-3 pb-1">
                                        <img alt="logo" src="image/logo.png" width="200px" class="ps-1">
                                    </div>

                                    <h1 class="fw-normal mb-3 pb-3 fs-3" style="letter-spacing: 1px;">Enter Your New
                                        Password</h1>

                                    <div class="form-outline mb-4" style="position: relative;">
                                        <input type="password" id="password"
                                            class="form-control form-control-lg password" required="required"
                                            name="password" />
                                         <img src="image/eye-close.svg" alt="eye" class="toggle-position" width="20px" height="20px" onclick="togglePassword()">
                                        <label class="form-label" for="password">Password</label>
                                        <div class="invalid-feedback">
                                            Please enter a password.
                                        </div>
                                    </div>

                                    <div class="form-outline mb-4" style="position: relative;">
                                        <input type="password" id="confirmPassword"
                                            class="form-control form-control-lg confirm-password" required="required" />
                                           <img src="image/eye-close.svg" alt="eye" class="toggle-position toggle" width="20px" height="20px" onclick="togglePassword()">
                                        <label class="form-label" for="confirmPassword">Confirm Password</label>
                                        <div class="invalid-feedback">
                                            Please enter a password.
                                        </div>
                                    </div>

                                    <div class="pt-1 mb-4">
                                        <button class="btn btn-primary btn-lg btn-block" type="submit" id="submitBtn"
                                            disabled>Continue</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp" />
    <script type="text/javascript">
        const passwordInput = document.getElementById("password");
        const confirmPasswordInput = document.getElementById("confirmPassword");
        const submitBtn = document.getElementById("submitBtn");

        confirmPasswordInput.addEventListener("input", function () {
            if (passwordInput.value === confirmPasswordInput.value) {
                confirmPasswordInput.setCustomValidity("");
                submitBtn.disabled = false;
            } else {
                confirmPasswordInput.setCustomValidity("Passwords do not match");
                submitBtn.disabled = true;
            }
        });
        
        function togglePassword() {
        	  let password = document.querySelector(".password");
        	  let confirmPassword = document.querySelector(".confirm-password");
        	  let togglePassword = document.querySelector(".toggle-position");
        	  let togglePassword2 = document.querySelector(".toggle");

        	  if (password.type === "password" || confirmPassword === "password") {
        	    password.type = "text";
        	    confirmPassword.type = "text";
        	    togglePassword.src = "image/eye.svg";
        	    togglePassword2.src = "image/eye.svg";
        	  } else {
        	    password.type = "password";
        	    confirmPassword.type = "password";
        	    togglePassword.src = "image/eye-close.svg";
        	    togglePassword2.src = "image/eye-close.svg";
        	  
        	  }

        	}
    </script>

</body>

</html>