<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Dashboard - SB Admin</title>
                <link rel="stylesheet" href="/admin/css/style.css">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>

                    // preview avatar
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            var container = document.getElementById('avatarPreviewBox');
                            container.style.border = '1px solid #c6c4c4';
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Manage User</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">User</li>
                            </ol>
                            <div class="mt-5 mb-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Create a user</h3>
                                        <hr />
                                        <form:form method="post" action="/admin/user/create" modelAttribute="newUser"
                                            class="row" enctype="multipart/form-data">
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorEmail">
                                                    <form:errors path="email" />
                                                </c:set>
                                                <label class="form-label">Email:</label>
                                                <form:input type="email"
                                                    class="form-control  ${not empty errorEmail? 'is-invalid':''}"
                                                    path="email" />
                                                <form:errors path="email" cssClass="invalid-feedback" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorPassword">
                                                    <form:errors path="password" />
                                                </c:set>
                                                <label class="form-label">Password:</label>
                                                <form:input type="password"
                                                    class="form-control ${not empty errorPassword? 'is-invalid':''}"
                                                    path="password" />
                                                <form:errors path="password" cssClass="invalid-feedback" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorPhoneNumber">
                                                    <form:errors path="phone" />
                                                </c:set>
                                                <label class="form-label">Phone number:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorPhoneNumber? 'is-invalid':''}"
                                                    path="phone" />
                                                <form:errors path="phone" cssClass="invalid-feedback" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <c:set var="errorFullName">
                                                    <form:errors path="fullName" />
                                                </c:set>
                                                <label class="form-label">Full Name:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorFullName? 'is-invalid':''}"
                                                    path="fullName" />
                                                <form:errors path="fullName" cssClass="invalid-feedback" />
                                            </div>
                                            <div class="mb-3">
                                                <c:set var="errorAddress">
                                                    <form:errors path="address" />
                                                </c:set>
                                                <label class="form-label">Address:</label>
                                                <form:input type="text"
                                                    class="form-control ${not empty errorAddress? 'is-invalid':''}"
                                                    path="address" />
                                                <form:errors path="address" cssClass="invalid-feedback" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Role:</label>
                                                <form:select class="form-select" aria-label="Default select example"
                                                    path="role.id">
                                                    <c:forEach items="${roles}" var="role">
                                                        <form:option value="${role.id}">${role.name}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="avatarFile" class="form-label">Avatar</label>
                                                <input class="form-control" type="file" id="avatarFile"
                                                    accept=".png, .jpg, .jpeg" name="avatarFile" />
                                            </div>

                                            <div class="col-12 mb-3 mt-3">
                                                <div id="avatarPreviewBox" style="border-radius: 5px;">
                                                    <img style=" max-height: 140px; display: none; border-radius: 5px; margin: 10px;"
                                                        alt="avatar preview" id="avatarPreview">
                                                </div>
                                            </div>
                                            <hr />
                                            <button type="submit" class="btn btn-primary mt-2">Create</button>
                                        </form:form>
                                    </div>

                                </div>

                            </div>
                        </div>

                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/admin/js/script.js"></script>
            </body>

            </html>