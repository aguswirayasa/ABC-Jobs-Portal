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
<title>Profile</title>
</head>
<body style="background-color: #e5e7eb">
<jsp:include page="header.jsp" />
	<div class="container h-100 my-3 ">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col col-lg-12 col-xl-12">
        <div class="card">
          <div class="rounded-top text-white d-flex flex-row" style="background-color: #000; height:200px;">
            <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
              <c:if test="${not empty profileImage}">
                    <img src="data:image/jpeg;base64,${profileImage}" alt="Generic placeholder image"
                      class="img-fluid img-thumbnail mt-4 mb-1" style="width: 150px; z-index: 1; ">
                    </c:if>
                      <c:if test="${empty profileImage}">
                       <img src="/CommunityPortal/image/default-profile.png" alt="Generic placeholder image"
                         class="img-fluid img-thumbnail mt-4 mb-1" style="width: 150px; z-index: 1">
                    </c:if>
            </div>
            <div class="ms-3" style="margin-top: 100px;">
              <h5>${profile.getFullName()}</h5>
              <h6>${profile.getHeadline()}</h6>
              <p>${profile.getCountry()} , ${profile.getCity()}</p>
            </div>
          </div>
          <div class="p-3 w-full d-flex justify-content-end" style="height: 80px">
          	  <div>
                      <button type="button" class="btn btn-outline-primary"style="z-index: 1;">
                      	Connect
                      </button>
               </div>
          </div>
          <div class="row p-3">
  <div class="col-lg-11">
    <div class="text-black">
         <h4 class="mb-1">Education</h4>
        <c:if test="${not empty education}">
            <c:forEach items="${education}" var="edu">
				  <div class="border-bottom py-1">
				  <h5 class="m-0">${edu.school}</h5>
				  <p class="m-0 text-bold">${edu.degree} of ${edu.field}</p>
				  <c:set var="startYear" value="${edu.startDate.substring(0, 4)}" />
				  <c:set var="endYear" value="${edu.endDate.substring(0, 4)}" />
				  <p class="m-0 fw-light">${startYear} - ${endYear}</p>

            	  </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty education}">
            <div class="p-4" style="background-color: #f8f9fa;">
                <p class="font-italic mb-1">No education recorded</p>
            </div>
        </c:if>
    </div>
  </div>
</div>
          
          
          </div>
         <div class="card">
  <div class="row p-3">
    <div class="col-lg-11">
      <div class="text-black">
        <h4 class="mb-1">Experience</h4>
        <c:if test="${not empty experience}">
          <c:forEach items="${experience}" var="exp">
            <div class="border-bottom py-1">
              <h5 class="m-0">${exp.company}</h5>
              <h6 class="m-0 fw-normal">${exp.position}</h6>
              <p class="m-0">${exp.employmentType}</p>
              <c:set var="startYear" value="${exp.startDate.substring(0, 4)}" />
              <c:set var="endYear" value="${exp.endDate.substring(0, 4)}" />
              <p class="m-0 fw-lighter">${startYear} - ${endYear}</p>
            </div>
          </c:forEach>
        </c:if>
        <c:if test="${empty experience}">
          <div class="p-4" style="background-color: #f8f9fa;">
            <p class="font-italic mb-1">No experience recorded</p>
          </div>
        </c:if>
      </div>
    </div>
  </div>
</div>

          </div>
          </div>
        </div>
<jsp:include page="footer.jsp" />
</body>
</html>
