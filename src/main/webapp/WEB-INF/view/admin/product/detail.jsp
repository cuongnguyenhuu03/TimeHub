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
                            <h1 class="mt-4">Manage Product</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">Product</li>
                            </ol>
                            <div class="mt-5">
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex justify-content-between">
                                            <h3>Product detail</h3>
                                        </div>
                                        <hr />
                                        <div class="row">

                                            <div class="col-12 col-md-8 col-lg-12">
                                                <div class="productImages"
                                                    style=" margin: 0 in !important; display: flex; justify-content: space-between; border:1px solid #dad5d5; border-radius: 8px;">
                                                    <c:forEach var="productImage" items="${productImages}">
                                                        <div class="product-item col-12 col-md-8 col-lg-2"
                                                            style="padding: 10px;">
                                                            <img style="width: 100%;"
                                                                src="/images/product/${productImage.imageUrl}"
                                                                alt="${product.name}">
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-8 col-lg-12">
                                                <div class="card mt-4">
                                                    <div class="card-header">
                                                        User Infomation
                                                    </div>
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item"><strong>ID:</strong> ${product.id}
                                                        </li>
                                                        <li class="list-group-item"><strong>name:</strong>
                                                            ${product.name}
                                                        <li class="list-group-item"><strong>Price:</strong>
                                                            ${product.price}
                                                        <li class="list-group-item"><strong>Short
                                                                Description:</strong><br>
                                                            ${product.shortDescription}
                                                        </li>
                                                        <li class="list-group-item"><strong>Description:</strong><br>
                                                            ${product.description}
                                                        </li>

                                                        <li class="list-group-item"><strong>Quantity:</strong>
                                                            ${product.quantity}
                                                        </li>

                                                        <li class="list-group-item"><strong>Origin:</strong>
                                                            ${product.origin}
                                                        </li>

                                                        <li class="list-group-item"><strong>Category:</strong>
                                                            ${product.category.name}
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                        <a href="/admin/product" class="btn btn-success mt-3">Back</a>
                                        <a href="/admin/product/update/${product.id}" style="margin-left: 80px;"
                                            class="btn btn-warning mt-3">Update</a>
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

                console.log("${product}");
            </script>