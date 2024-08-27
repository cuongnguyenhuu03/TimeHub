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

                <!-- csrf token -->
                <meta name="_csrf" content="${_csrf.token}" />
                <!-- default header name is X-CSRF-TOKEN -->
                <meta name="_csrf_header" content="${_csrf.headerName}" />

                <title>Dashboard - SB Admin</title>
                <link rel="stylesheet" href="/admin/css/style.css">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <!-- notification-toast -->
                <script src="/template/notification-toast/toast-plugin.js"></script>
                <link rel="stylesheet" href="/template/notification-toast/styles.css">
                <link rel="stylesheet" href="/admin/css/style.css">
                <script src="/admin/js/script.js"></script>
            </head>



            <body class="sb-nav-fixed">

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
                                            <h3>Table orders</h3>
                                        </div>
                                        <hr />
                                        <table class="table table-hover table-bordered">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Id</th>
                                                    <th scope="col">Total Money</th>
                                                    <th scope="col">Manager</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="order" items="${orders}">
                                                    <tr>
                                                        <th>${order.id}</th>
                                                        <td>${order.totalMoney}</td>
                                                        <td>ADMIN</td>
                                                        <td>${order.status}</td>
                                                        <td>
                                                            <a href="/admin/order/${order.id}"
                                                                class="btn btn-success">View</a>
                                                            <a href="/admin/order/update/${order.id}"
                                                                class="btn btn-warning  mx-2">Update</a>
                                                            <a data-bs-toggle="modal"
                                                                data-bs-target="#confirmDeleteModal-${order.id}"
                                                                class="btn btn-danger">Delete</a>
                                                        </td>
                                                    </tr>

                                                    <div class="modal fade" id="confirmDeleteModal-${order.id}"
                                                        tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                                        aria-hidden="true">
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
                                                                    Are you sure you want to delete Order
                                                                    <b>${order.id}</b> ?
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-success"
                                                                        data-bs-dismiss="modal">Close</button>
                                                                    <button type="button"
                                                                        onclick="deleteOrder('${order.id}')"
                                                                        class="btn btn-danger">Delete</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </c:forEach>
                                            </tbody>
                                        </table>

                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item">
                                                    <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                        href="/admin/order?page=1" aria-label="Previous">
                                                        <span aria-hidden="true">first</span>
                                                    </a>
                                                </li>
                                                <li class="page-item">
                                                    <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                        href="/admin/order?page=${currentPage - 1}"
                                                        aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>

                                                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                    <li class="page-item">
                                                        <a class="${(loop.index) eq currentPage ? 'active page-link' : 'page-link'}"
                                                            href="/admin/order?page=${loop.index}">
                                                            ${loop.index}
                                                        </a>
                                                    </li>
                                                </c:forEach>

                                                <li class="page-item">
                                                    <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                        href="/admin/order?page=${currentPage + 1}" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>

                                                <li class="page-item">
                                                    <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                        href="/admin/order?page=${totalPages}" aria-label="Previous">
                                                        <span aria-hidden="true">last</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
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

                // CSRF Variables
                var _tc = $("meta[name='_csrf']").attr("content");
                var _hc = $("meta[name='_csrf_header']").attr("content");

                // add CSRF header
                var headersStomp = {};
                headersStomp[_hc] = _tc;

                $(document).ajaxSend(function (e, xhr, options) {
                    xhr.setRequestHeader(_hc, _tc);
                });

                function deleteOrder(id) {
                    console.log(id);

                    $.ajax({
                        url: '/admin/order/delete/' + id,
                        type: 'DELETE',
                        success: function (result) {
                            window.location.href = "/admin/order?message=delete_success";
                        },
                        error: function (error) {
                            window.location.href = "/admin/order?message=delete_false";
                        }
                    });

                    const modalId = '#confirmDeleteModal-' + id;
                    const modalElement = document.querySelector(modalId);
                    const modalInstance = bootstrap.Modal.getInstance(modalElement);
                    modalInstance.hide();

                }
            </script>