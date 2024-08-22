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


                <!-- Modal Search Start -->
                <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog modal-fullscreen">
                        <div class="modal-content rounded-0">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body d-flex align-items-center">
                                <div class="input-group w-75 mx-auto d-flex">
                                    <input type="search" class="form-control p-3" placeholder="keywords"
                                        aria-describedby="search-icon-1">
                                    <span id="search-icon-1" class="input-group-text p-3"><i
                                            class="fa fa-search"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Search End -->


                <!-- Hero Start -->
                <jsp:include page="../layout/banner.jsp" />
                <!-- Hero End -->


                <!-- Featurs Section Start -->
                <div class="container-fluid featurs py-5">
                    <div class="container py-5">
                        <div class="row g-4">
                            <div class="col-md-6 col-lg-3">
                                <div class="featurs-item text-center rounded bg-light p-4">
                                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                        <i class="fas fa-car-side fa-3x text-white"></i>
                                    </div>
                                    <div class="featurs-content text-center">
                                        <h5>Free Shipping</h5>
                                        <p class="mb-0">Free on order over $300</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="featurs-item text-center rounded bg-light p-4">
                                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                        <i class="fas fa-user-shield fa-3x text-white"></i>
                                    </div>
                                    <div class="featurs-content text-center">
                                        <h5>Security Payment</h5>
                                        <p class="mb-0">100% security payment</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="featurs-item text-center rounded bg-light p-4">
                                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                        <i class="fas fa-exchange-alt fa-3x text-white"></i>
                                    </div>
                                    <div class="featurs-content text-center">
                                        <h5>30 Day Return</h5>
                                        <p class="mb-0">30 day money guarantee</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-3">
                                <div class="featurs-item text-center rounded bg-light p-4">
                                    <div class="featurs-icon btn-square rounded-circle bg-secondary mb-5 mx-auto">
                                        <i class="fa fa-phone-alt fa-3x text-white"></i>
                                    </div>
                                    <div class="featurs-content text-center">
                                        <h5>24/7 Support</h5>
                                        <p class="mb-0">Support every time fast</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Featurs Section End -->


                <!-- Fruits Shop Start-->
                <div class="container-fluid fruite py-5">
                    <div class="container py-5">
                        <div class="tab-class text-center">
                            <div class="row g-4">
                                <div class="col-lg-4 text-start mb-4">
                                    <h1>Products</h1>
                                </div>

                            </div>
                            <div class="tab-content">
                                <div id="tab-1" class="tab-pane fade show p-0 active">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <c:forEach items="${products}" var="product">
                                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                                        <div class="rounded position-relative fruite-item">
                                                            <div class="fruite-img">
                                                                <img src="/images/product/${product.thumbnail}"
                                                                    class="img-fluid w-100 rounded-top" alt="">
                                                            </div>
                                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                                style="top: 10px; left: 10px;">New</div>
                                                            <div class="p-4 border border-secondary rounded-bottom"
                                                                style="height: 200px;">
                                                                <div class=""
                                                                    style="height: 50px; width: 240px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                                    <a href="/product/${product.id}">
                                                                        <h4
                                                                            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                                            ${product.name}</h4>
                                                                    </a>
                                                                </div>

                                                                <div class="" style="height: 50px; width: 240px;">
                                                                    <p
                                                                        style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                                        ${product.shortDescription}</p>
                                                                </div>
                                                                <div
                                                                    class="d-flex justify-content-between flex-lg-wrap">
                                                                    <p class="text-dark fs-5 fw-bold mb-0">
                                                                        ${product.price}
                                                                    </p>

                                                                    <form action="/add-product-to-cart/${product.id}"
                                                                        method="post">
                                                                        <button
                                                                            class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                                class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                            Add to cart
                                                                        </button>
                                                                        <div>
                                                                            <input type="hidden"
                                                                                name="${_csrf.parameterName}"
                                                                                value="${_csrf.token}" />

                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-2" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/client/img/fruite-item-5.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Fruits</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Grapes</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed do
                                                                eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Add to
                                                                    cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/client/img/fruite-item-2.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Fruits</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Raspberries</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed do
                                                                eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Add to
                                                                    cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-3" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/client/img/fruite-item-1.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Fruits</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Oranges</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed do
                                                                eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Add to
                                                                    cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/client/img/fruite-item-6.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Fruits</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Apple</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed do
                                                                eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Add to
                                                                    cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-4" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/client/img/fruite-item-5.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Fruits</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Grapes</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed do
                                                                eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Add to
                                                                    cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/client/img/fruite-item-4.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Fruits</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Apricots</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed do
                                                                eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Add to
                                                                    cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab-5" class="tab-pane fade show p-0">
                                    <div class="row g-4">
                                        <div class="col-lg-12">
                                            <div class="row g-4">
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/client/img/fruite-item-3.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Fruits</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Banana</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed do
                                                                eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Add to
                                                                    cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/client/img/fruite-item-2.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Fruits</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Raspberries</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed do
                                                                eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Add to
                                                                    cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 col-lg-4 col-xl-3">
                                                    <div class="rounded position-relative fruite-item">
                                                        <div class="fruite-img">
                                                            <img src="/client/img/fruite-item-1.jpg"
                                                                class="img-fluid w-100 rounded-top" alt="">
                                                        </div>
                                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                            style="top: 10px; left: 10px;">Fruits</div>
                                                        <div
                                                            class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                            <h4>Oranges</h4>
                                                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit
                                                                sed do
                                                                eiusmod te incididunt</p>
                                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                                <p class="text-dark fs-5 fw-bold mb-0">$4.99 / kg</p>
                                                                <a href="#"
                                                                    class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                                                        class="fa fa-shopping-bag me-2 text-primary"></i>
                                                                    Add to
                                                                    cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fruits Shop End-->


                <!-- Fact Start -->
                <div class="container-fluid py-5">
                    <div class="container">
                        <div class="bg-light p-5 rounded">
                            <div class="row g-4 justify-content-center">
                                <div class="col-md-6 col-lg-6 col-xl-3">
                                    <div class="counter bg-white rounded p-5">
                                        <i class="fa fa-users text-secondary"></i>
                                        <h4>satisfied customers</h4>
                                        <h1>1963</h1>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-6 col-xl-3">
                                    <div class="counter bg-white rounded p-5">
                                        <i class="fa fa-users text-secondary"></i>
                                        <h4>quality of service</h4>
                                        <h1>99%</h1>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-6 col-xl-3">
                                    <div class="counter bg-white rounded p-5">
                                        <i class="fa fa-users text-secondary"></i>
                                        <h4>quality certificates</h4>
                                        <h1>33</h1>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-6 col-xl-3">
                                    <div class="counter bg-white rounded p-5">
                                        <i class="fa fa-users text-secondary"></i>
                                        <h4>Available Products</h4>
                                        <h1>789</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Fact Start -->


                <!-- Tastimonial Start -->
                <div class="container-fluid testimonial py-5">
                    <div class="container py-5">
                        <div class="testimonial-header text-center">
                            <h4 class="text-primary">Our client feedback</h4>
                            <h1 class="display-5 mb-5 text-dark">Our Client Saying!</h1>
                        </div>
                        <div class="owl-carousel testimonial-carousel">
                            <div class="testimonial-item img-border-radius bg-light rounded p-4">
                                <div class="position-relative">
                                    <i class="fa fa-quote-right fa-2x text-secondary position-absolute"
                                        style="bottom: 30px; right: 0;"></i>
                                    <div class="mb-4 pb-4 border-bottom border-secondary">
                                        <p class="mb-0">Lorem Ipsum is simply dummy text of the printing Ipsum has been
                                            the
                                            industry's standard dummy text ever since the 1500s,
                                        </p>
                                    </div>
                                    <div class="d-flex align-items-center flex-nowrap">
                                        <div class="bg-secondary rounded">
                                            <img src="/client/img/avt1.jpg" class="img-fluid rounded"
                                                style="width: 100px; height: 100px;" alt="">
                                        </div>
                                        <div class="ms-4 d-block">
                                            <h4 class="text-dark">Cristiano Ronaldo</h4>
                                            <p class="m-0 pb-3">Profession</p>
                                            <div class="d-flex pe-5">
                                                <i class="fas fa-star text-primary"></i>
                                                <i class="fas fa-star text-primary"></i>
                                                <i class="fas fa-star text-primary"></i>
                                                <i class="fas fa-star text-primary"></i>
                                                <i class="fas fa-star"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="testimonial-item img-border-radius bg-light rounded p-4">
                                <div class="position-relative">
                                    <i class="fa fa-quote-right fa-2x text-secondary position-absolute"
                                        style="bottom: 30px; right: 0;"></i>
                                    <div class="mb-4 pb-4 border-bottom border-secondary">
                                        <p class="mb-0">Lorem Ipsum is simply dummy text of the printing Ipsum has been
                                            the
                                            industry's standard dummy text ever since the 1500s,
                                        </p>
                                    </div>
                                    <div class="d-flex align-items-center flex-nowrap">
                                        <div class="bg-secondary rounded">
                                            <img src="/client/img/avt2.jpg" class="img-fluid rounded"
                                                style="width: 100px; height: 100px;" alt="">
                                        </div>
                                        <div class="ms-4 d-block">
                                            <h4 class="text-dark">The Rock</h4>
                                            <p class="m-0 pb-3">Profession</p>
                                            <div class="d-flex pe-5">
                                                <i class="fas fa-star text-primary"></i>
                                                <i class="fas fa-star text-primary"></i>
                                                <i class="fas fa-star text-primary"></i>
                                                <i class="fas fa-star text-primary"></i>
                                                <i class="fas fa-star text-primary"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="testimonial-item img-border-radius bg-light rounded p-4">
                                <div class="position-relative">
                                    <i class="fa fa-quote-right fa-2x text-secondary position-absolute"
                                        style="bottom: 30px; right: 0;"></i>
                                    <div class="mb-4 pb-4 border-bottom border-secondary">
                                        <p class="mb-0">Lorem Ipsum is simply dummy text of the printing Ipsum has been
                                            the
                                            industry's standard dummy text ever since the 1500s,
                                        </p>
                                    </div>
                                    <div class="d-flex align-items-center flex-nowrap">
                                        <div class="bg-secondary rounded">
                                            <img src="/client/img/avt3.jpg" class="img-fluid rounded"
                                                style="width: 100px; height: 100px;" alt="">
                                        </div>
                                        <div class="ms-4 d-block">
                                            <h4 class="text-dark">Lionel Messi</h4>
                                            <p class="m-0 pb-3">Profession</p>
                                            <div class="d-flex pe-5">
                                                <i class="fas fa-star text-primary"></i>
                                                <i class="fas fa-star text-primary"></i>
                                                <i class="fas fa-star text-primary"></i>
                                                <i class="fas fa-star text-primary"></i>
                                                <i class="fas fa-star text-primary"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Tastimonial End -->


                <!-- Footer Start -->
                <jsp:include page="../layout/footer.jsp" />
                <!-- Footer End -->

                <!-- Copyright Start -->
                <div class="container-fluid copyright bg-dark py-4">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                                <span class="text-light"><a href="#"><i
                                            class="fas fa-copyright text-light me-2"></i>Your Site
                                        Name</a>, All right reserved.</span>
                            </div>
                            <div class="col-md-6 my-auto text-center text-md-end text-white">
                                <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                                <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                                <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                                Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                                Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Copyright End -->

                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
            </body>

            </html>

            <script>

            </script>