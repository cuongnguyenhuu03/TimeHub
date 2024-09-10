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



                <!-- Fruits Shop Start-->
                <div class="container-fluid fruite py-5" style="margin-top: 120px;">
                    <div class="container py-5">
                        <div class="tab-class">

                            <div class="tab-content">
                                <div class="row g-4">
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                                        <li class="breadcrumb-item active">Products</li>
                                    </ol>

                                </div>
                                <div id="tab-1" class="tab-pane fade show p-0 active">
                                    <div class="row g-4">
                                        <div class="col-lg-4">
                                            <h5>Filter Product</h5>

                                            <div class="row g-4">
                                                <div class="col-12" id="originFilter">
                                                    <div class="mb-2"><b>Origin</b></div>
                                                    <div class="form-check form-check-inline" style="width: 40%;">
                                                        <input class="form-check-input" type="checkbox" id="factory-1"
                                                            value="switzerland">
                                                        <label class="form-check-label"
                                                            for="factory-1">Switzerland</label>
                                                    </div>
                                                    <div class="form-check form-check-inline" style="width: 40%;">
                                                        <input class="form-check-input" type="checkbox" id="factory-2"
                                                            value="germany">
                                                        <label class="form-check-label" for="factory-2">Germany</label>
                                                    </div>

                                                    <div class="form-check form-check-inline" style="width: 40%;">
                                                        <input class="form-check-input" type="checkbox" id="factory-3"
                                                            value="usa">
                                                        <label class="form-check-label" for="factory-3">USA</label>
                                                    </div>

                                                    <div class="form-check form-check-inline" style="width: 40%;">
                                                        <input class="form-check-input" type="checkbox" id="factory-4"
                                                            value="japan">
                                                        <label class="form-check-label" for="factory-4">Japan</label>
                                                    </div>
                                                </div>
                                                <div class="col-12" id="categoryFilter">
                                                    <div class="mb-2"><b>Category</b></div>

                                                    <c:forEach items="${categories}" var="category">
                                                        <div class="form-check form-check-inline" style="width: 40%;">
                                                            <input class="form-check-input" type="checkbox"
                                                                id="target-1" value="${category.id}">
                                                            <label class="form-check-label"
                                                                for="target-1">${category.name}</label>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <div class="col-12" id="priceFilter">
                                                    <div class="mb-2"><b>Price</b></div>

                                                    <div class="form-check form-check-inline" style="width: 90%;">
                                                        <input class="form-check-input" type="checkbox" id="price-2"
                                                            value="under-1000-$">
                                                        <label class="form-check-label" for="price-2">Under
                                                            1000$</label>
                                                    </div>

                                                    <div class="form-check form-check-inline" style="width: 90%;">
                                                        <input class="form-check-input" type="checkbox" id="price-3"
                                                            value="1000-1500-$">
                                                        <label class="form-check-label" for="price-3">From 1000 -
                                                            1500$</label>
                                                    </div>

                                                    <div class="form-check form-check-inline" style="width: 90%;">
                                                        <input class="form-check-input" type="checkbox" id="price-4"
                                                            value="1500-2000-$">
                                                        <label class="form-check-label" for="price-4">From 1500 -
                                                            2000$</label>
                                                    </div>

                                                    <div class="form-check form-check-inline" style="width: 90%;">
                                                        <input class="form-check-input" type="checkbox" id="price-4"
                                                            value="2000-2500-$">
                                                        <label class="form-check-label" for="price-4">From 2000 -
                                                            2500$</label>
                                                    </div>

                                                    <div class="form-check form-check-inline" style="width: 90%;">
                                                        <input class="form-check-input" type="checkbox" id="price-4"
                                                            value="2500-3000-$">
                                                        <label class="form-check-label" for="price-4">From 2500 -
                                                            3000$</label>
                                                    </div>


                                                    <div class="form-check form-check-inline" style="width: 90%;">
                                                        <input class="form-check-input" type="checkbox" id="price-5"
                                                            value="over-3000-$">
                                                        <label class="form-check-label" for="price-5">Over 3000$</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="mb-2"><b>Sort</b></div>

                                                    <div class="form-check form-check-inline" style="width: 40%;">
                                                        <input class="form-check-input" type="radio" id="sort-1"
                                                            value="price-ascending" name="radio-sort">
                                                        <label class="form-check-label" for="sort-1">Price
                                                            ascending</label>
                                                    </div>

                                                    <div class="form-check form-check-inline" style="width: 40%;">
                                                        <input class="form-check-input" type="radio" id="sort-2"
                                                            value="price-descending" name="radio-sort">
                                                        <label class="form-check-label" for="sort-2">Price
                                                            descending</label>
                                                    </div>

                                                    <div class="form-check form-check-inline" style="width: 40%;">
                                                        <input class="form-check-input" type="radio" id="sort-3" checked
                                                            value="No order" name="radio-sort">
                                                        <label class="form-check-label" for="sort-3">No order</label>
                                                    </div>

                                                </div>
                                                <div class="col-12">
                                                    <button id="btnFilter"
                                                        class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4">
                                                        Filter products
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="row g-4">
                                                <c:forEach items="${products}" var="product">
                                                    <div class="col-md-6 col-lg-4 col-xl-4">
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
                                                                    style="height: 50px; width: 220px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                                    <a href="/product/${product.id}">
                                                                        <h5
                                                                            style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                                            ${product.name}</h5>
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
                                            <div class="col-12">
                                                <div
                                                    class="pagination d-flex justify-content-center align-items-center mt-5">
                                                    <a href="/products?page=${currentPage - 1}${queryString}"
                                                        class="rounded  ${1 eq currentPage ? 'd-none' : ''}  ">&laquo;</a>

                                                    <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                        <li class="page-item">
                                                            <a class="${(loop.index) eq currentPage ? 'active rounded' : 'rounded'}"
                                                                href="/products?page=${loop.index}${queryString}">
                                                                ${loop.index}
                                                            </a>
                                                        </li>
                                                    </c:forEach>
                                                    <a href="/products?page=${currentPage + 1}${queryString}"
                                                        class="rounded ${totalPages eq currentPage ? 'd-none' : ''}  ">&raquo;</a>
                                                </div>
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