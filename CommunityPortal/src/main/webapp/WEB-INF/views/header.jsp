<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/MavenTest//css/index.css">
<link rel="stylesheet" type="text/css" href="/MavenTest//webjars/bootstrap/5.2.3/css/bootstrap.min.css">
<link rel="stylesheet" href="/MavenTest/l/webjars/font-awesome/6.3.0/css/all.min.css"/>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand mx-auto mx-xl-3 text-center" href="<c:url value='/'/>">
      <img alt="logo" src="/MavenTest/image/logo.png" class="logo" style="width: 200px; height: 80px">
    </a>
    <form action="<c:url value='/search'/>" method="post" class="d-flex me-auto" role="search">
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="input">
      <button class="btn btn-outline-primary" type="submit">Search</button>
    </form>
    <button class="navbar-toggler toggle-down" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse toggle-up" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto me-5 mb-2 mb-lg-0">
        <c:if test="${not empty admin}">
      	<li class="nav-item">
          <a class="nav-link"  aria-current="page" href="<c:url value='/admin/administer'/>">Administer</a>
        </li>
        </c:if>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="<c:url value='/dashboard'/>">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Job</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Connection</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Message</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Notification</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" type="button"  id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Profile
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="<c:url value='/profile'/>">Personal Profile</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="<c:url value='/logout'/>">Log out</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

<script type="text/javascript" src="/MavenTest/js/dropdown.js">
</script>
</body>
</html>
