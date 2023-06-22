<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="webjars/font-awesome/6.3.0/css/all.min.css" />
    <title>Homepage</title>
  </head>
  <body style="background-color: #e5e7eb">
    <jsp:include page="header.jsp" />
    <div class="container my-3">
      <div class="row">
        <div class="col-3 d-none d-xl-block">
          <div class="card text-center">
            <div class="card-header p-0">
              <div
                class="header-bg position-relative rounded-top"
                style="background-image: url('image/hero.webp'); height: 100px"
              >
               <c:if test="${not empty profileImage}">
                <img
                  src="data:image/jpeg;base64,${profileImage}"
                  alt="Profile Picture"
                  class="rounded-circle profile-pic profile-pic-middle mt-5"
                />
                </c:if>
                 <c:if test="${empty profileImage}">
                  <img
                  src="image/default-profile.png"
                  alt="Profile Picture"
                  class="rounded-circle profile-pic profile-pic-middle mt-5"
                />
                  </c:if>
              </div>
            </div>
            <div class="card-body">
              <h5 class="mt-3 mb-0">${user.getProfile().getFirstName()}</h5>
              <c:if test="${empty profileImage}">
              <a class="mb-3 nav-link" href="profile">Add Photo Profile</a>
              </c:if>
            </div>
          </div>
        </div>
        <div class="col-12 col-xxl-6">
        <div class="card">
          <div class="d-flex gap-3 p-3">
           <c:if test="${not empty profileImage}">
            <img
              src="data:image/jpeg;base64,${profileImage}"
              alt="Profile Picture"
              class="rounded-circle profile-pic"
            />
            </c:if>
             <c:if test="${empty profileImage}">
              <img
              src="image/default-profile.png"
              alt="Profile Picture"
              class="rounded-circle profile-pic"
            />
              </c:if>
            <div
              class="d-flex justify-content-center flex-column my-3 w-100 gap-3"
            >
              <button class="btn btn-primary w-100 rounded-pill">Post</button>
              <div class="d-flex justify-content-center">
                <i class="fa-regular fa-image fs-3 pe-1"></i>
                <p class="pe-3">Image</p>
                <i class="fa-sharp fa-solid fa-film fs-3 pe-1"></i>
                <p class="pe-3">Video</p>
                <i class="fa-solid fa-code fs-3 pe-1"></i>
                <p class="pe-3">Code Snippet</p>
                <i class="fa-sharp fa-regular fa-calendar-days fs-3 pe-1"></i>
                <p class="pe-3">Event</p>
              </div>
            </div>
          </div>
          </div>

          <div>
            <div class="card my-5">
              <div class="row">
                <div class="d-flex border-bottom p-3">
                   <c:if test="${not empty profileImage}">
                  <img
                     src="data:image/jpeg;base64,${profileImage}"
                    alt="Profile Picture"
                    class="rounded-circle profile-pic m-1"
                  />
                    </c:if>
                 <c:if test="${empty profileImage}">
                  <img
                    src="image/default-profile.png"
                    alt="Profile Picture"
                    class="rounded-circle profile-pic m-1"
                  />
                    </c:if>
                  <div class="p-3">
                    <h5 class="card-title m-0">${user.getProfile().getFullName()}</h5>
                    <p class="card-text m-0">
                      Student at Institut Teknologi dan Bisnis STIKOM Bali
                    </p>
                  </div>
                </div>
                <div class="">
                  <div class="card-body">
                    <p class="card-text">
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                      Nulla sodales justo at odio fringilla, ac euismod ante
                      dapibus. Fusce a lacinia turpis.
                    </p>
                  </div>
                  <div class="d-flex justify-content-center">
                    <div class="d-flex justify-content-center border-top p-3">
                      <i class="fa-regular fa-heart fs-3 pe-1"></i>
                      <p class="pe-3">Like</p>
                      <i class="fa-regular fa-comment fs-3 pe-1"></i>
                      <p class="pe-3">Comment</p>
                      <i class="fa-regular fa-share-from-square fs-3 pe-1"></i>
                      <p class="pe-3">Share</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-3 d-none d-xl-block">
          <div class="card">
            <h4 class="my-4 text-center">People to Connect</h4>
             <c:if test="${not empty listUser}">
            <c:forEach items="${listUser}" var="user">
            <div class="border px-2 pt-1">
              <div class="row g-0">
                <div class="col-md-12">
                  <div class="card-body p-3">
                    <h4>${user.getProfile().getFullName()}</h4>
                    <h6>${user.getProfile().getHeadline()}</h6>
                    <p>${user.getProfile().getCity()},${user.getProfile().getCountry()}</p>
                    <button class="btn btn-outline-primary w-100">Connect</button>
                  </div>
                </div>
              </div>
            </div>
         </c:forEach>
        </c:if>
        <c:if test="${empty listUser}">
        	<h3>No User Available</h3>
             </c:if>
            <div class="d-flex justify-content-center my-4">
              <button class="btn btn-outline-primary">See More People</button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="footer.jsp" />
      <script type="text/javascript" src="/MavenTest/webjars/popper.js/2.9.3/umd/popper.min.js"></script>
<script type="text/javascript" src="/MavenTest/webjars/bootstrap/5.2.3/js/bootstrap.min.js"></script>
  </body>
</html>
