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
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Manage Order</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">Order</li>
                            </ol>
                            <div class=" mt-5 mb-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Update a Order</h3>
                                        <hr />
                                        <form:form method="post" action="/admin/order/update" modelAttribute="order"
                                            class="row">

                                            <div class="mb-3 col-12 col-md-6" style="display: none;">
                                                <label class="form-label">ID:</label>
                                                <form:input type="text" class="form-control" path="id" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Reciever:</label>
                                                <form:input type="text" class="form-control" path="fullName"
                                                    disabled="true" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">phone</label>
                                                <form:input type="text" class="form-control" path="phoneNumber"
                                                    disabled="true" />
                                            </div>

                                            <div class=" mb-3 col-12 col-md-6">
                                                <label class="form-label">Manager:</label>
                                                <input type="text" class="form-control" value="ADMIN" disabled="true" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Total price:</label>
                                                <form:input type="text" class="form-control" path="totalMoney"
                                                    disabled="true" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Status:</label>
                                                <form:select class="form-select" aria-label="Default select example"
                                                    path="status">
                                                    <option value="pending">pending</option>
                                                    <option value="processing">processing</option>
                                                    <option value="shipped">shipped</option>
                                                    <option value="delivered">delivered</option>
                                                    <option value="cancelled">cancelled</option>
                                                </form:select>
                                            </div>

                                            <hr />
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

            <script>
                console.log('${order.id}');

            </script>