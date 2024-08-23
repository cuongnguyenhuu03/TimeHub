<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="utf-8" />
                        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                        <title>Dashboard - SB Admin</title>
                        <!-- Google Web Fonts -->
                        <link rel="preconnect" href="https://fonts.googleapis.com">
                        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                        <link
                            href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                            rel="stylesheet">

                        <!-- Icon Font Stylesheet -->
                        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                            rel="stylesheet">

                        <!-- Libraries Stylesheet -->
                        <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                        <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                        <!-- Customized Bootstrap Stylesheet -->
                        <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                        <!-- Template Stylesheet -->
                        <link href="/client/css/style.css" rel="stylesheet">
                    </head>

                    <body>
                        <!-- Navbar start -->
                        <jsp:include page="../layout/header.jsp" />
                        <!-- Navbar End -->

                        <!-- Cart Page Start -->

                        <div class="container-fluid py-5">
                            <div class="container py-5 mt-5">
                                <ol class="breadcrumb mb-4 mt-5">
                                    <li class="breadcrumb-item"><a href="/admin">Cart</a></li>
                                    <li class="breadcrumb-item active">Check out</li>
                                </ol>
                                <div class="table-responsive mt-5">
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
                                            <c:forEach items="${cartDetails}" var="cartDetail">
                                                <tr>
                                                    <th scope="row">
                                                        <div class="d-flex align-items-center">
                                                            <img src="/images/product/${cartDetail.product.thumbnail}"
                                                                class="img-fluid me-5 rounded-circle"
                                                                style="width: 80px; height: 80px;" alt="">
                                                        </div>
                                                    </th>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            <a href="/product/${cartDetail.product.id}">
                                                                ${cartDetail.product.name}
                                                            </a>

                                                        </p>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4">
                                                            <fmt:formatNumber type="number"
                                                                value="${cartDetail.price}" /> $
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <div class="input-group quantity mt-4" style="width: 100px;">
                                                            <input type="text"
                                                                class="form-control form-control-sm text-center border-0"
                                                                value="${cartDetail.quantity}"
                                                                data-cart-detail-id="${cartDetail.id}"
                                                                data-cart-detail-price="${cartDetail.price}">
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                            <fmt:formatNumber type="number"
                                                                value="${cartDetail.price * cartDetail.quantity}" />
                                                            $
                                                        </p>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <form:form action="/place-order" method="post" modelAttribute="cart">
                                    <div class="row g-4 mt-3">

                                        <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6">

                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div class="">
                                                <div class="col-12 col-md-10">
                                                    <div class="p-4 ">
                                                        <h5 class="mb-3">Recipient information
                                                        </h5>
                                                        <div class="row">
                                                            <div class="col-12 form-group mb-3">
                                                                <label>Recipient name</label>
                                                                <input class="form-control" name="receiverName"
                                                                    required />
                                                            </div>
                                                            <div class="col-12 form-group mb-3">
                                                                <label>Address</label>
                                                                <input class="form-control" name="receiverAddress"
                                                                    required />
                                                            </div>
                                                            <div class="col-12 form-group mb-3">
                                                                <label>Phone Number</label>
                                                                <input class="form-control" name="receiverPhone"
                                                                    required />
                                                            </div>
                                                            <div class="mt-4">
                                                                <i class="fas fa-arrow-left"></i>
                                                                <a href="/cart">Return to cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6">
                                            <div class="bg-light rounded">
                                                <div class="p-4">
                                                    <h2 class="mb-4">Cart <span class="fw-normal">Total</span></h2>
                                                    <div class="d-flex justify-content-between mb-4">
                                                        <h5 class="mb-0 me-4">Subtotal:</h5>
                                                        <p class="mb-0" data-cart-total-price="${totalPrice}">
                                                            <fmt:formatNumber type="number" value="${totalPrice}" /> $
                                                        </p>
                                                    </div>
                                                    <div class="d-flex justify-content-between">
                                                        <h5 class="mb-0 me-4">Shipping</h5>
                                                        <div class="">
                                                            <p class="mb-0">Flat rate: 0$</p>
                                                        </div>
                                                    </div>
                                                    <p class="mb-0 text-end">Shipping to Ukraine.</p>
                                                </div>
                                                <div
                                                    class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                                    <h5 class="mb-0 ps-4 me-4">Total</h5>
                                                    <p class="mb-0 pe-4" data-cart-total-price="${totalPrice}">
                                                        <fmt:formatNumber type="number" value="${totalPrice}" /> $
                                                    </p>
                                                </div>
                                                <button
                                                    class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">
                                                    Xác nhận thanh toán
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                </form:form>
                            </div>
                        </div>



                        <!-- Cart Page End -->

                        <!-- Footer Start -->
                        <jsp:include page="../layout/footer.jsp" />
                        <!-- Footer End -->


                        <!-- JavaScript Libraries -->
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                        <script src="/client/lib/easing/easing.min.js"></script>
                        <script src="/client/lib/waypoints/waypoints.min.js"></script>
                        <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                        <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                        <!-- Template Javascript -->
                        <script src="/client/js/main.js"></script>
                    </body>

                    </html>
                    <script>
                        console.log(1);

                        console.log('${cartDetails}');

                    </script>