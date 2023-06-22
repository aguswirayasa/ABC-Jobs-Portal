<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Home Header</title>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="image/logo.png" alt="Logo" style="width: 200px; height: 100px">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
               	<c:if test="${isLogin}">
                    <li class="nav-item text-center mx-2 p-2">
                       <i class="fa-solid fa-house fs-5"></i>
                        <a class="nav-link p-0 fs-6" href="<c:url value='/dashboard'/>">Dashboard</a>
                    </li>
                  </c:if>
                    <li class="nav-item text-center mx-2 p-2">
                        <i class="fa-solid fa-briefcase fs-5"></i>
                        <a class="nav-link p-0 fs-6" href="#">Jobs</a>
                    </li>
                    <li class="nav-item text-center mx-2 p-2">
                        <i class="fa-solid fa-users fs-5"></i>
                        <a class="nav-link p-0 fs-6" href="#">Connect</a>
                    </li>
                    <li class="nav-item border-end ">
                    </li>
                     <c:if test="${isLogin}">
                      <li class="nav-item p-2">
                        <a class="nav-link" href="<c:url value='/logout'/>"><button class="btn btn-outline-primary px-3">Log Out</button></a>
                    </li>
                     </c:if>
                   <c:if test="${not isLogin}">
                    <li class="nav-item p-2">
                        <a class="nav-link" href="login"><button class="btn btn-outline-primary px-3">Login</button></a>
                    </li>
                    <li class="nav-item p-2">
                        <a class="nav-link" href="register"><button class="btn btn-outline-primary px-3">Join
                                Us</button></a>
                    </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
    <script type="text/javascript" src="/CommunityPortal/webjars/popper.js/2.9.3/umd/popper.min.js"></script>
    <script type="text/javascript" src="/CommunityPortal/webjars/bootstrap/5.2.3/js/bootstrap.min.js"></script>
</body>

</html>