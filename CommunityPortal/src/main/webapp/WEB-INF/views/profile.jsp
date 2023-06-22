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
    <title>Profile</title>
</head>

<body style="background-color: #e5e7eb">
    <jsp:include page="header.jsp" />
    <div class="container h-100 my-3 ">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col col-lg-12 col-xl-12">
                <div class="card">
                    <div class="rounded-top text-white d-flex flex-row" style="background-color: #000; height:200px;">
                        <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px; height: 200px;">
                            <c:if test="${not empty profileImage}">
                                <img src="data:image/jpeg;base64,${profileImage}" alt="Generic placeholder image"
                                    class="img-fluid img-thumbnail mt-4 mb-2" style="width: 150px; z-index: 1; ">

                            </c:if>
                            <c:if test="${empty profileImage}">
                                <img src="/MavenTest/image/default-profile.png" alt="Generic placeholder image"
                                    class="img-fluid img-thumbnail mt-4 mb-2" style="width: 150px; z-index: 1">
                            </c:if>
                        </div>

                        <div class="ms-3" style="margin-top: 100px;">
                            <h5>${user.getProfile().getFullName()}</h5>
                            <h6>${user.getProfile().getHeadline()}</h6>
                            <p>${user.getProfile().getCountry()} , ${user.getProfile().getCity()}</p>
                        </div>
                    </div>
                    <div class="p-3 w-full d-flex justify-content-end" style="height: 100px">
                        <div>
                            <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop1" style="z-index: 1;">
                                Edit profile
                            </button>
                            <c:if test="${empty profileImage}">

                                <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal"
                                    data-bs-target="#staticBackdrop4" style="z-index: 1;">
                                    Add Profile Picture
                                </button>

                            </c:if>
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
                        <div class="col-lg-1 d-flex justify-content-end">
                            <div class="btn-group" role="group">
                                <a><button class="btn btn-outline-primary mx-1" type="button" data-bs-toggle="modal"
                                        data-bs-target="#staticBackdrop2">Add</button></a>
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
                        <div class="col-lg-1 d-flex justify-content-end">
                            <div class="btn-group" role="group">
                                <a><button class="btn btn-outline-primary mx-1" type="button" data-bs-toggle="modal"
                                        data-bs-target="#staticBackdrop3">Add</button></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>



    <!-- Modal Edit Profile-->

    <div class="modal fade" id="staticBackdrop1" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Edit Profile</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <c:url var="editProfileUrl" value="/profile/edit" />
                <form:form action="${editProfileUrl}" method="post" class="needs-validation" novalidate="novalidate"
                    modelAttribute="profile">
                    <div class="modal-body mx-3">

                        <div class="md-form mb-5">
                            <label data-error="wrong" data-success="right" for="form3">First Name</label>
                            <form:input type="text" id="form3" class="form-control validate" required="required"
                                path="firstName" value="${user.getProfile().getFirstName()}" />
                            <input type="hidden" id="form3" class="form-control validate" required="required"
                                name="profileId" value="${user.getProfile().getProfileId()}" />
                        </div>

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form2">Last Name</label>
                            <form:input type="text" id="form2" class="form-control validate" required="required"
                                path="lastName" value="${user.getProfile().getLastName()}" />
                        </div>

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form2">City</label>
                            <form:input type="text" id="form2" class="form-control validate" required="required"
                                path="city" value="${user.getProfile().getCity()}" />
                        </div>

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form2">Country</label>
                            <form:input type="text" id="form2" class="form-control validate" required="required"
                                path="country" value="${user.getProfile().getCountry()}" />
                        </div>

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form2">Headline</label>
                            <form:input type="text" id="form2" class="form-control validate" required="required"
                                path="headline" value="${user.getProfile().getHeadline()}" />
                        </div>

                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button class="btn btn-indigo" type="submit">Save <i
                                class="fas fa-paper-plane-o ml-1"></i></button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <!-- Modal Education-->

    <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Add Education</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <c:url var="addEducationUrl" value="/profile/add/education" />
                <form:form action="${addEducationUrl}" method="post" class="needs-validation" novalidate="novalidate"
                    modelAttribute="edu">
                    <div class="modal-body mx-3">

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form3">School</label>
                            <form:input type="text" id="form3" class="form-control validate" required="required"
                                path="school" />
                            <input type="hidden" id="form3" class="form-control validate" required="required"
                                name="profileId" value="${user.getProfile().getProfileId()}" />
                        </div>

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form2">Field</label>
                            <form:input type="text" id="form2" class="form-control validate" required="required"
                                path="field" />
                        </div>

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form2">Degree</label>
                            <form:select id="form2" class="form-control validate" required="required" path="degree">
                                <option value="">Select Degree</option>
                                <option value="Associate">Associate</option>
                                <option value="Bachelor's">Bachelor's</option>
                                <option value="Master's">Master's</option>
                                <option value="Doctorate">Doctorate</option>
                            </form:select>
                        </div>

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form2">Start Date</label>
                            <form:input type="date" id="form2" class="form-control validate" required="required"
                                path="startDate" />
                        </div>

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form2">End Date</label>
                            <form:input type="date" id="form2" class="form-control validate" required="required"
                                path="endDate" />
                        </div>


                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button class="btn btn-indigo" type="submit">Save <i
                                class="fas fa-paper-plane-o ml-1"></i></button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <!-- Modal Experience -->

    <div class="modal fade" id="staticBackdrop3" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Add Experience</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <c:url var="addExperienceUrl" value="/profile/add/experience" />
                <form:form action="${addExperienceUrl}" method="post" class="needs-validation" novalidate="novalidate"
                    modelAttribute="exp">
                    <div class="modal-body mx-3">

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form3">Company</label>
                            <form:input type="text" id="form3" class="form-control validate" required="required"
                                path="company" />
                            <input type="hidden" id="form3" class="form-control validate" required="required"
                                name="profileId" value="${user.getProfile().getProfileId()}" />
                        </div>

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form2">Position</label>
                            <form:input type="text" id="form2" class="form-control validate" required="required"
                                path="position" />
                        </div>

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form2">Employment Type</label>
                            <form:select id="form2" class="form-control validate" required="required"
                                path="employmentType">
                                <option value="">Select Emplyoment Type</option>
                                <option value="Full-time">Full Time</option>
                                <option value="Intership">Internship</option>
                                <option value="Part-time">Part Time</option>
                            </form:select>
                        </div>

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form2">Start Date</label>
                            <form:input type="date" id="form2" class="form-control validate" required="required"
                                path="startDate" />
                        </div>

                        <div class="md-form mb-4">
                            <label data-error="wrong" data-success="right" for="form2">End Date</label>
                            <form:input type="date" id="form2" class="form-control validate" required="required"
                                path="endDate" />
                        </div>


                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button class="btn btn-indigo" type="submit">Save <i
                                class="fas fa-paper-plane-o ml-1"></i></button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>

    <!-- Modal Upload Photo -->
    <div class="modal fade" id="staticBackdrop4" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold">Select Profile Picture</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="POST" action="<c:url value='/upload-image'/>" enctype="multipart/form-data"
                    class="needs-validation" novalidate="novalidate">
                    <div class="modal-body d-flex flex-column align-items-center justify-content-center">
                        <div class="mb-3">
                            <label for="fileInput" class="form-label">Select an Image</label>
                            <input type="file" class="form-control" id="fileInput" name="file" accept=".jpg, .png, .gif"
                                required>
                        </div>
                        <input type="hidden" name="id" value="${user.getProfile().getProfileId()}">
                    </div>
                    <div class="modal-footer d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary">Upload</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="/MavenTest/webjars/popper.js/2.9.3/umd/popper.min.js"></script>
    <script type="text/javascript" src="/MavenTest/webjars/bootstrap/5.2.3/js/bootstrap.min.js"></script>
</body>

</html>