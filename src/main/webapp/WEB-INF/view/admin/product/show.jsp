<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">
            <script>
                function showSuccessToast() {
                    $.toast({
                        title: "Success!",
                        message: "Your action was completed successfully.",
                        type: "success",
                        duration: 3000
                    });
                }

                function showErrorToast() {
                    $.toast({
                        title: "Error!",
                        message: "An error occurred while processing your request.",
                        type: "error",
                        duration: 3000
                    });
                }
            </script>

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <title>Dashboard - SB Admin</title>
                <link rel="stylesheet" href="/admin/css/style.css">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                <!-- notification-toast -->
                <script src="/template/notification-toast/toast-plugin.js"></script>
                <link rel="stylesheet" href="/template/notification-toast/styles.css">
                <link rel="stylesheet" href="/admin/css/style.css">
                <script src="/admin/js/script.js"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <c:if test="${not empty messageResponse}">
                            <script type="text/javascript">
                                const urlParams = new URLSearchParams(window.location.search);
                                const message = urlParams.get('message');

                                if (message) {
                                    // delete param message in URL
                                    urlParams.delete('message');
                                    const newUrl = window.location.pathname + '?' + urlParams.toString();
                                    window.history.replaceState({}, document.title, newUrl);
                                    showSuccessToast();
                                }
                            </script>
                        </c:if>
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
                                                <c:forEach var="product" items="${products}">
                                                    <tr>
                                                        <th>${product.id}</th>
                                                        <td>${product.name}</td>
                                                        <td>${product.price} $</td>
                                                        <td>${product.category.name}</td>
                                                        <td>${product.quantity}</td>

                                                        <td>
                                                            <a href="/admin/product/${product.id}"
                                                                class="btn btn-success">View</a>
                                                            <a href="/admin/product/update/${product.id}"
                                                                class="btn btn-warning  mx-2">Update</a>
                                                            <a data-bs-toggle="modal"
                                                                data-bs-target="#confirmDeleteModal-${product.id}"
                                                                class="btn btn-danger">Delete</a>
                                                        </td>

                                                        <div class="modal fade" id="confirmDeleteModal-${product.id}"
                                                            tabindex="-1" role="dialog"
                                                            aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h5 class="modal-title" id="exampleModalLabel">
                                                                            Confirm deletion</h5>


                                                                        <button type="button" class="btn-close"
                                                                            data-bs-dismiss="modal"
                                                                            aria-label="Close"></button>
                                                                    </div>
                                                                    <div class="modal-body">
                                                                        Are you sure you want to delete product <br>
                                                                        <b>${product.name}</b> ?
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-success"
                                                                            data-bs-dismiss="modal">Close</button>
                                                                        <button type="button"
                                                                            onclick="deleteProduct('${product.id}')"
                                                                            class="btn btn-danger">Delete</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
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

            <script>
                function deleteProduct(id) {
                    console.log(id);

                    $.ajax({
                        url: '/admin/product/delete/' + id,
                        type: 'DELETE',
                        success: function (result) {
                            window.location.href = "/admin/product?message=delete_success";
                        },
                        error: function (error) {
                            window.location.href = "/admin/product?message=delete_false";
                        }
                    });

                    const modalId = '#confirmDeleteModal-' + id;
                    const modalElement = document.querySelector(modalId);
                    const modalInstance = bootstrap.Modal.getInstance(modalElement);
                    modalInstance.hide();

                }
            </script>