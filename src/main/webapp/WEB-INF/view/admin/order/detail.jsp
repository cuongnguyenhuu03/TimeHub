<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <title>Dashboard - SB Admin</title>
                    <link rel="stylesheet" href="/admin/css/style.css">
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
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
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-12 mx-auto">
                                            <div class="d-flex justify-content-between">
                                                <h3>Order Detail</h3>
                                            </div>
                                            <hr />
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">Products</th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Quantity</th>
                                                        <th scope="col">Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${orderDetails}" var="orderDetail"
                                                        varStatus="status">
                                                        <tr>
                                                            <th scope="row">
                                                                <div class="d-flex align-items-center">
                                                                    <img src="/images/product/${orderDetail.product.thumbnail}"
                                                                        class="img-fluid me-5 rounded-circle"
                                                                        style="width: 80px; height: 80px;" alt="">
                                                                </div>
                                                            </th>
                                                            <td>
                                                                <p class="mb-0 mt-4">
                                                                    <a href="/product/${orderDetail.product.id}">
                                                                        ${orderDetail.product.name}
                                                                    </a>

                                                                </p>
                                                            </td>
                                                            <td>
                                                                <p class="mb-0 mt-4">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${orderDetail.price}" /> $
                                                                </p>
                                                            </td>
                                                            <td>
                                                                <div class="input-group quantity mt-4"
                                                                    style="width: 100px;">
                                                                    <input type="text"
                                                                        class="form-control form-control-sm text-center border-0"
                                                                        value="${orderDetail.numberOfProducts}">
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <p class="mb-0 mt-4"
                                                                    data-cart-detail-id="${orderDetail.id}">
                                                                    <fmt:formatNumber type="number"
                                                                        value="${orderDetail.price * orderDetail.numberOfProducts}" />
                                                                    $
                                                                </p>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>


                                            </table>
                                            <div class="d-flex"
                                                style="flex-direction: row-reverse; margin: 40px 50px 0 0;">
                                                <strong>Total Price:
                                                    <fmt:formatNumber type="number" value="${totalPrice}" /> $
                                                </strong>
                                            </div>
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