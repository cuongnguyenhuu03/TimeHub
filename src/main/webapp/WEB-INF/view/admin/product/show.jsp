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
                                <h3>Table product</h3>
                                <a href="/admin/product/create" class="btn btn-primary">Create product</a>
                            </div>
                            <hr />
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Category</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="product" items="${product}">
                                        <tr>
                                            <th>${product.id}</th>
                                            <td>${product.name}</td>
                                            <td>${product.price}</td>
                                            <td>${product.category}</td>
                                            <td>${product.quantity}</td>
                                            <td>
                                                <a href="/admin/product/${product.id}" class="btn btn-success">View</a>
                                                <a href="/admin/product/update/${product.id}"
                                                    class="btn btn-warning  mx-2">Update</a>
                                                <a data-bs-toggle="modal"
                                                    data-bs-target="#confirmDeleteModal-${product.id}"
                                                    class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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