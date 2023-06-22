<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page isELIgnored="false" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>Admin</title>
</head>

<body>
    <jsp:include page="header.jsp" />

    <div class="p-5 table-responsive">
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th class="text-center">Action</th>
                </tr>
            </thead>

            <tbody>
                <c:forEach items="${alluser}" var="user">
                    <tr>
                        <td>${user.getUserId()}</td>
                        <td>${user.getProfile().getFullName()}</td>
                        <td>${user.getEmail()}</td>
                        <td>${user.getPassword()}</td>
                        <td class="d-flex justify-content-center gap-3">
                            <button class="btn btn-outline-success px-3" data-bs-toggle="modal"
                                data-bs-target="#editModal-${user.userId}">
                                Edit
                            </button>
                            <a href="<c:url value='/delete/${user.getUserId()}'/>"><button
                                    class="btn btn-outline-danger">Delete</button></a>
                            <a href="<c:url value='/view-profile/${user.getProfile().getFullName()}'/>"><button
                                    class="btn btn-outline-primary">Profile</button></a>
                        </td>
                    </tr>
                    <!-- Edit Modal for the User -->
                    <div class="modal fade" id="editModal-${user.userId}" tabindex="-1" role="dialog"
                        aria-labelledby="editModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editModalLabel">Edit User</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <c:url var="addExperienceUrl" value="/admin/edit" />
                                <form action="${addExperienceUrl}" method="post">
                                    <div class="modal-body">
                                        <input type="hidden" name="userId" value="${user.userId}" />
                                        <div class="form-group">
                                            <label for="firstName">First Name</label>
                                            <input type="text" class="form-control" id="firstName" name="firstName"
                                                value="${user.profile.firstName}" required="required" />
                                        </div>
                                        <div class="form-group">
                                            <label for="lastName">Last Name</label>
                                            <input type="text" class="form-control" id="lastName" name="lastName"
                                                value="${user.profile.lastName}" required="required" />
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="email" class="form-control" name="email" id="email"
                                                value="${user.email}" required="required" />
                                        </div>
                                        <div class="form-group">
                                            <label for="text">Password</label>
                                            <input class="form-control" id="password" name="password"
                                                value="${user.password}" required="required" />
                                        </div>

                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary">
                                                Save Changes
                                            </button>
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                Close
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <jsp:include page="footer.jsp" />
    <script type="text/javascript" src="/CommunityPortal/webjars/popper.js/2.9.3/umd/popper.min.js"></script>
    <script type="text/javascript" src="/CommunityPortal/webjars/bootstrap/5.2.3/js/bootstrap.min.js"></script>
</body>

</html>