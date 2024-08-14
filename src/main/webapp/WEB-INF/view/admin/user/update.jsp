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
                        const avatarUpdateFile = $("#avatarUpdateFile");
                        console.log(avatarUpdateFile);

                        avatarUpdateFile.on("change", function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarUpdatePreview").attr("src", imgURL);
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
                            <div class=" mt-5 mb-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Upadte a user</h3>
                                        <hr />
                                        <form:form method="post" action="/admin/user/update"
                                            modelAttribute="currentUser" class="row" enctype="multipart/form-data">
                                            <div class="mb-3 col-12 col-md-6" style="display: none;">
                                                <label class="form-label">ID</label>
                                                <form:input type="text" class="form-control" path="id" value="${id}" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-12">
                                                <label class="form-label">Email:</label>
                                                <form:input type="email" class="form-control" path="email"
                                                    disabled="true" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Phone number:</label>
                                                <form:input type="text" class="form-control" path="phone" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Full Name:</label>
                                                <form:input type="text" class="form-control" path="fullName" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-12">
                                                <label class="form-label">Address:</label>
                                                <form:input type="text" class="form-control" path="address" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="avatarUpdateFile" class="form-label">Avatar</label>
                                                <input class="form-control" type="file" id="avatarUpdateFile"
                                                    accept=".png, .jpg, .jpeg" name="avatarUpdateFile" />
                                            </div>

                                            <div class="col-12 mb-3">
                                                <div id="avatarPreviewBox"
                                                    style="border-radius: 5px; border: 1px solid #c6c4c4">
                                                    <img style="max-height: 140px; border-radius: 5px; margin: 10px; ;"
                                                        alt="avatar preview" src="/images/avatar/${currentUser.avatar}"
                                                        id="avatarUpdatePreview">
                                                </div>
                                            </div>
                                            <hr />
                                            <!-- <a href="/admin/user" class="btn btn-success">Back</a> -->
                                            <button type="submit" class="btn btn-warning mt-3">Update</button>
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