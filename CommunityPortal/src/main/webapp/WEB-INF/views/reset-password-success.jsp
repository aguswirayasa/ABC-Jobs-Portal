<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Success</title>
</head>
<body>
	<div class="container d-flex justify-content-center align-items-center flex-column my-5">
	<img alt="thank-you" src="/MavenTest/image/reset-success.png">
	<div class="w-50 text-center">
		<h1>Your password has been reset!</h1>	
		<p>Congratulations! Your password has been successfully reset. 
		You can now log in using your new password and access your account. 
		If you have any questions or concerns, please don't hesitate to contact 
		our support team. Thank you for using our service</p>
	</div>
		<a href="<c:url value='/login'/>" class="w-50"><button class="btn btn-primary my-3 w-100 py-2">Login</button></a>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>