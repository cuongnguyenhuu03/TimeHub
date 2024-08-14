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
                            <div class="mt-5">
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h3>User detail</h3>
                                        </div>
                                        <hr />
                                        <div class="row">
                                            <div class="avt mb-5 col-12 col-md-4 col-lg-3">
                                                <img style="width: 100%;" src="/images/avatar/${user.avatar}" ;
                                                    class="rounded mx-auto d-block" alt="">
                                            </div>
                                            <div class="col-12 col-md-8 col-lg-6">
                                                <div class="card">
                                                    <div class="card-header">
                                                        User Infomation
                                                    </div>
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item"><strong>ID:</strong> ${user.id}</li>
                                                        <li class="list-group-item"><strong>Role:</strong>
                                                            ${user.role.name}
                                                        <li class="list-group-item"><strong>Phone Number:</strong>
                                                            ${user.phone}
                                                        <li class="list-group-item"><strong>Email:</strong>
                                                            ${user.email}
                                                        </li>
                                                        <li class="list-group-item"><strong>Full Name:</strong>
                                                            ${user.fullName}
                                                        </li>

                                                        <li class="list-group-item"><strong>Address:</strong>
                                                            ${user.address}
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                        </div>

                                        <a href="/admin/user" class="btn btn-success mt-3 mr-3"
                                            style="width: 90px;">Back</a>
                                        <a href="/admin/user/update/${user.id}" class="btn btn-warning mt-3 ml-3"
                                            style="margin-left: 80px !important;">update</a>

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