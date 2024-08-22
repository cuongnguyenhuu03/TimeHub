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
                        <c:if test="${fn:length(cartDetails) > 0}">
                            <div class="container-fluid py-5">
                                <div class="container py-5 mt-5">
                                    <ol class="breadcrumb mb-4 mt-5">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item active">Users</li>
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
                                                    <th scope="col">Handle</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${cartDetails}" var="cartDetail" varStatus="status">
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
                                                            <div class="input-group quantity mt-4"
                                                                style="width: 100px;">
                                                                <div class="input-group-btn">
                                                                    <button
                                                                        class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                                        <i class="fa fa-minus"></i>
                                                                    </button>
                                                                </div>
                                                                <input type="text"
                                                                    class="form-control form-control-sm text-center border-0"
                                                                    value="${cartDetail.quantity}"
                                                                    data-cart-detail-id="${cartDetail.id}"
                                                                    data-cart-detail-price="${cartDetail.price}"
                                                                    data-cart-detail-index="${status.index}">
                                                                <div class="input-group-btn">
                                                                    <button
                                                                        class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                                        <i class="fa fa-plus"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <p class="mb-0 mt-4" data-cart-detail-id="${cartDetail.id}">
                                                                <fmt:formatNumber type="number"
                                                                    value="${cartDetail.price * cartDetail.quantity}" />
                                                                $
                                                            </p>
                                                        </td>
                                                        <td>
                                                            <form method="post"
                                                                action="/cart-detail/delete/${cartDetail.id}">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button
                                                                    class="btn btn-md rounded-circle bg-light border mt-4">
                                                                    <i class="fa fa-times text-danger"></i>
                                                                </button>
                                                            </form>
                                                        </td>

                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="row g-4 justify-content-start mt-3">
                                        <div class="col-8"></div>
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

                                                <form:form action="/confirm-checkout" method="post"
                                                    modelAttribute="cart">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}" />
                                                    <div style="display: none;">
                                                        <c:forEach var="cartDetail" items="${cart.cartDetails}"
                                                            varStatus="status">
                                                            <div class="mb-3">
                                                                <div class="form-group">
                                                                    <label>Id:</label>
                                                                    <form:input class="form-control" type="text"
                                                                        value="${cartDetail.id}"
                                                                        path="cartDetails[${status.index}].id" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <label>Quantity:</label>
                                                                    <form:input class="form-control" type="text"
                                                                        value="${cartDetail.quantity}"
                                                                        path="cartDetails[${status.index}].quantity" />
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                    <button
                                                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4">Payment
                                                        Confirmation
                                                    </button>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>


                        <!-- Cart Page End -->

                        <!-- Empty cart -->
                        <c:if test="${fn:length(cartDetails) == 0}">
                            <div style="margin-top: 120px;">
                                <div class="empty-cart mt-5">
                                    <svg viewBox="656 573 264 182" version="1.1" xmlns="http://www.w3.org/2000/svg"
                                        xmlns:xlink="http://www.w3.org/1999/xlink">
                                        <rect id="bg-line" stroke="none" fill-opacity="0.2" fill="#FFE100"
                                            fill-rule="evenodd" x="656" y="624" width="206" height="38" rx="19"></rect>
                                        <rect id="bg-line" stroke="none" fill-opacity="0.2" fill="#FFE100"
                                            fill-rule="evenodd" x="692" y="665" width="192" height="29" rx="14.5">
                                        </rect>
                                        <rect id="bg-line" stroke="none" fill-opacity="0.2" fill="#FFE100"
                                            fill-rule="evenodd" x="678" y="696" width="192" height="33" rx="16.5">
                                        </rect>
                                        <g id="shopping-bag" stroke="none" stroke-width="1" fill="none"
                                            fill-rule="evenodd" transform="translate(721.000000, 630.000000)">
                                            <polygon id="Fill-10" fill="#FFA800" points="4 29 120 29 120 0 4 0">
                                            </polygon>
                                            <polygon id="Fill-14" fill="#FFE100"
                                                points="120 29 120 0 115.75 0 103 12.4285714 115.75 29"></polygon>
                                            <polygon id="Fill-15" fill="#FFE100"
                                                points="4 29 4 0 8.25 0 21 12.4285714 8.25 29"></polygon>
                                            <polygon id="Fill-33" fill="#FFA800"
                                                points="110 112 121.573723 109.059187 122 29 110 29"></polygon>
                                            <polygon id="Fill-35" fill-opacity="0.5" fill="#FFFFFF"
                                                points="2 107.846154 10 112 10 31 2 31"></polygon>
                                            <path
                                                d="M107.709596,112 L15.2883462,112 C11.2635,112 8,108.70905 8,104.648275 L8,29 L115,29 L115,104.648275 C115,108.70905 111.7365,112 107.709596,112"
                                                id="Fill-36" fill="#FFE100"></path>
                                            <path
                                                d="M122,97.4615385 L122,104.230231 C122,108.521154 118.534483,112 114.257931,112 L9.74206897,112 C5.46551724,112 2,108.521154 2,104.230231 L2,58"
                                                id="Stroke-4916" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round">
                                            </path>
                                            <polyline id="Stroke-4917" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round" stroke-linejoin="round"
                                                points="2 41.5 2 29 122 29 122 79"></polyline>
                                            <path
                                                d="M4,50 C4,51.104 3.104,52 2,52 C0.896,52 0,51.104 0,50 C0,48.896 0.896,48 2,48 C3.104,48 4,48.896 4,50"
                                                id="Fill-4918" fill="#000000"></path>
                                            <path d="M122,87 L122,89" id="Stroke-4919" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round"></path>
                                            <polygon id="Stroke-4922" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round" stroke-linejoin="round"
                                                points="4 29 120 29 120 0 4 0"></polygon>
                                            <path
                                                d="M87,46 L87,58.3333333 C87,71.9 75.75,83 62,83 L62,83 C48.25,83 37,71.9 37,58.3333333 L37,46"
                                                id="Stroke-4923" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round">
                                            </path>
                                            <path d="M31,45 C31,41.686 33.686,39 37,39 C40.314,39 43,41.686 43,45"
                                                id="Stroke-4924" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round">
                                            </path>
                                            <path d="M81,45 C81,41.686 83.686,39 87,39 C90.314,39 93,41.686 93,45"
                                                id="Stroke-4925" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round">
                                            </path>
                                            <path d="M8,0 L20,12" id="Stroke-4928" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round"></path>
                                            <path d="M20,12 L8,29" id="Stroke-4929" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round"></path>
                                            <path d="M20,12 L20,29" id="Stroke-4930" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round"></path>
                                            <path d="M115,0 L103,12" id="Stroke-4931" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round"></path>
                                            <path d="M103,12 L115,29" id="Stroke-4932" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round"></path>
                                            <path d="M103,12 L103,29" id="Stroke-4933" stroke="#000000" stroke-width="3"
                                                stroke-linecap="round"></path>
                                        </g>
                                        <g id="glow" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"
                                            transform="translate(768.000000, 615.000000)">
                                            <rect id="Rectangle-2" fill="#000000" x="14" y="0" width="2" height="9"
                                                rx="1">
                                            </rect>
                                            <rect fill="#000000"
                                                transform="translate(7.601883, 6.142354) rotate(-12.000000) translate(-7.601883, -6.142354) "
                                                x="6.60188267" y="3.14235449" width="2" height="6" rx="1"></rect>
                                            <rect fill="#000000"
                                                transform="translate(1.540235, 7.782080) rotate(-25.000000) translate(-1.540235, -7.782080) "
                                                x="0.54023518" y="6.28207994" width="2" height="3" rx="1"></rect>
                                            <rect fill="#000000"
                                                transform="translate(29.540235, 7.782080) scale(-1, 1) rotate(-25.000000) translate(-29.540235, -7.782080) "
                                                x="28.5402352" y="6.28207994" width="2" height="3" rx="1"></rect>
                                            <rect fill="#000000"
                                                transform="translate(22.601883, 6.142354) scale(-1, 1) rotate(-12.000000) translate(-22.601883, -6.142354) "
                                                x="21.6018827" y="3.14235449" width="2" height="6" rx="1"></rect>
                                        </g>
                                        <polygon id="plus" stroke="none" fill="#7DBFEB" fill-rule="evenodd"
                                            points="689.681239 597.614697 689.681239 596 690.771974 596 690.771974 597.614697 692.408077 597.614697 692.408077 598.691161 690.771974 598.691161 690.771974 600.350404 689.681239 600.350404 689.681239 598.691161 688 598.691161 688 597.614697">
                                        </polygon>
                                        <polygon id="plus" stroke="none" fill="#EEE332" fill-rule="evenodd"
                                            points="913.288398 701.226961 913.288398 699 914.773039 699 914.773039 701.226961 917 701.226961 917 702.711602 914.773039 702.711602 914.773039 705 913.288398 705 913.288398 702.711602 911 702.711602 911 701.226961">
                                        </polygon>
                                        <polygon id="plus" stroke="none" fill="#FFA800" fill-rule="evenodd"
                                            points="662.288398 736.226961 662.288398 734 663.773039 734 663.773039 736.226961 666 736.226961 666 737.711602 663.773039 737.711602 663.773039 740 662.288398 740 662.288398 737.711602 660 737.711602 660 736.226961">
                                        </polygon>
                                        <circle id="oval" stroke="none" fill="#A5D6D3" fill-rule="evenodd" cx="699.5"
                                            cy="579.5" r="1.5"></circle>
                                        <circle id="oval" stroke="none" fill="#CFC94E" fill-rule="evenodd" cx="712.5"
                                            cy="617.5" r="1.5"></circle>
                                        <circle id="oval" stroke="none" fill="#8CC8C8" fill-rule="evenodd" cx="692.5"
                                            cy="738.5" r="1.5"></circle>
                                        <circle id="oval" stroke="none" fill="#3EC08D" fill-rule="evenodd" cx="884.5"
                                            cy="657.5" r="1.5"></circle>
                                        <circle id="oval" stroke="none" fill="#66739F" fill-rule="evenodd" cx="918.5"
                                            cy="681.5" r="1.5"></circle>
                                        <circle id="oval" stroke="none" fill="#C48C47" fill-rule="evenodd" cx="903.5"
                                            cy="723.5" r="1.5"></circle>
                                        <circle id="oval" stroke="none" fill="#A24C65" fill-rule="evenodd" cx="760.5"
                                            cy="587.5" r="1.5"></circle>
                                        <circle id="oval" stroke="#66739F" stroke-width="2" fill="none" cx="745"
                                            cy="603" r="3"></circle>
                                        <circle id="oval" stroke="#EFB549" stroke-width="2" fill="none" cx="716"
                                            cy="597" r="3"></circle>
                                        <circle id="oval" stroke="#FFE100" stroke-width="2" fill="none" cx="681"
                                            cy="751" r="3"></circle>
                                        <circle id="oval" stroke="#3CBC83" stroke-width="2" fill="none" cx="896"
                                            cy="680" r="3"></circle>
                                        <polygon id="diamond" stroke="#C46F82" stroke-width="2" stroke-linecap="round"
                                            stroke-linejoin="round" fill="none"
                                            points="886 705 889 708 886 711 883 708">
                                        </polygon>
                                        <path
                                            d="M736,577 C737.65825,577 739,578.34175 739,580 C739,578.34175 740.34175,577 742,577 C740.34175,577 739,575.65825 739,574 C739,575.65825 737.65825,577 736,577 Z"
                                            id="bubble-rounded" stroke="#3CBC83" stroke-width="1" stroke-linecap="round"
                                            stroke-linejoin="round" fill="none"></path>
                                    </svg>

                                    <h3>Your Cart is Empty</h3>
                                    <p class="text-empty-cart">It looks like you haven't added anything to your cart
                                        yet. Browse our products
                                        and find something you like!</p>
                                </div>
                            </div>

                        </c:if>

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