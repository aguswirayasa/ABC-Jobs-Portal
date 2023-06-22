<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm Email</title>
</head>
<body>
	<div class="container d-flex justify-content-center align-items-center flex-column my-5">
	<img alt="mail" src="image/mail.png" width="250px" height="200px" class="my-3">
	<h1 class="fs-2 my-3">Please Verify Your Email</h1>
	<div class="w-25 text-center ">
		<p class="fs-6">A verification mail has been sent to you. Please check your email.</p>	
	</div>
	<div class="d-flex justify-content-center align-items-center my-3" style="width: 450px">
	<form action="save-user" method="post" novalidate="novalidate" class="needs-validation">
	<div class="d-flex">
		<input type="text" class="form-control mx-2 text-center" maxlength="1" id="validationCustom01" required="required">
		<input type="text" class="form-control mx-2 text-center" maxlength="1" id="validationCustom02" required>
		<input type="text" class="form-control mx-2 text-center" maxlength="1" id="validationCustom03" required>
		<input type="text" class="form-control mx-2 text-center" maxlength="1" id="validationCustom04" required>
		<input type="text" class="form-control mx-2 text-center" maxlength="1" id="validationCustom05" required>
		<input type="text" class="form-control mx-2 text-center" maxlength="1" id="validationCustom06" required>
	</div>
	<button class="btn btn-primary w-100 my-3" type="submit">Verify</button>
	</form>
	</div>
</div>

<jsp:include page="footer.jsp" />
<script>

</script>

</body>
</html>