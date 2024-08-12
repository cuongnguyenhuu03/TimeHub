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

                    // <img style="max-height: 250px; display: none;" alt="avatar preview"
                    // id="ProductImgPreview">

                    $(document).ready(() => {
                        const productFiles = $("#productFiles");
                        var container = document.getElementById('ProductImagePreview');
                        productFiles.change(function (e) {
                            container.innerHTML = ''
                            container.style.border = '1px solid #c6c4c4';
                            Array.from(e.target.files)
                                .forEach((element, index) => {
                                    var img = document.createElement('img');
                                    img.src = URL.createObjectURL(element);
                                    img.alt = 'product image';
                                    img.style.width = '20%';
                                    img.style.margin = '10px';
                                    img.style.borderRadius = '5px';
                                    if (container) {
                                        container.appendChild(img);
                                    }
                                });
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
                            <h1 class="mt-4">Manage Product</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                <li class="breadcrumb-item active">Product</li>
                            </ol>
                            <div class="mt-5 mb-5">
                                <div class="row">
                                    <div class="col-md-6 col-12 mx-auto">
                                        <h3>Create a product</h3>
                                        <hr />
                                        <form:form method="post" action="/admin/user/create" modelAttribute="product"
                                            class="row" enctype="multipart/form-data">
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Name:</label>
                                                <form:input type="text" class="form-control" path="name" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Price:</label>
                                                <form:input type="text" class="form-control" path="price" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-12">
                                                <label class="form-label">Short Description</label>
                                                <form:input type="text" class="form-control" path="shortDescription" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-12">
                                                <label class="form-label">Description</label>
                                                <form:input type="text" class="form-control" path="description" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Quantity:</label>
                                                <form:input type="number" class="form-control" path="quantity" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Target:</label>
                                                <form:input type="text" class="form-control" path="target" />
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Category:</label>
                                                <form:select class="form-select" aria-label="Default select example"
                                                    path="category">
                                                    <option selected>select category </option>
                                                    <option value="1">One</option>
                                                    <option value="2">Two</option>
                                                    <option value="3">Three</option>
                                                </form:select>
                                            </div>

                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="productFiles" class="form-label">Product image (maximun 5
                                                    pics)</label>
                                                <input class="form-control" type="file" id="productFiles"
                                                    accept=".png, .jpg, .jpeg" name="productFiles" multiple />
                                            </div>

                                            <div class="col-12 mb-3 mt-4">
                                                <div id="ProductImagePreview" style="border-radius: 5px;"> </div>
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