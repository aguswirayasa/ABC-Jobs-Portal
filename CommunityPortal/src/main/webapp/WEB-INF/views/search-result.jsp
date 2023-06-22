<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
</head>
<body>
<jsp:include page="header.jsp" />

	<div class="container">
		<div class="card d-flex flex-column justify-content-center align-items-center p-3">
			<div class="d-grid place-items-center w-100">
			<c:if test="${not empty profile}">
			   <c:forEach items="${profile}" var="pfp">
				<div class="card my-3">
  					<div class="card-body">
    					<h4 class="m-1"><a href="profile/${pfp.getFullName()}" class="nav-link">${pfp.getFullName()}</a></h4>
   						 <h6 class="m-1">${pfp.getHeadline()}</h6>
   						 <p class="m-1">${pfp.getCity()},${pfp.getCountry()}</p>
    					<a href="profile/${pfp.getFullName()}" class="btn btn-outline-primary">See Profile</a>
  					</div>
				</div>
				</c:forEach>
			  </c:if>
		        <c:if test="${empty profile}">
		            <div class="p-4 text-center"  style="background-color: #f8f9fa;">
					  <h1>No Search Result Found</h1> 
		            </div>
		        </c:if>
					</div>
				</div>
			</div>

<jsp:include page="footer.jsp" />
</body>
</html>