<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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

            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Document</title>
                <!-- Latest compiled and minified CSS -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                <!-- notification-toast -->
                <script src="/template/notification-toast/toast-plugin.js"></script>
                <link rel="stylesheet" href="/template/notification-toast/styles.css">
                <link rel="stylesheet" href="/css/demo.css">
            </head>

            <body>
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
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div class="d-flex justify-content-between">
                                <h3>Table user</h3>
                                <a href="/admin/user/create" class="btn btn-primary">Create user</a>
                            </div>
                            <hr />
                            <table class="table table-hover table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Full Name </th>
                                        <th scope="col">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${users}">
                                        <tr>
                                            <th>${user.id}</th>
                                            <td>${user.email}</td>
                                            <td>${user.fullname}</td>
                                            <td>
                                                <a href="/admin/user/${user.id}" class="btn btn-success">View</a>
                                                <a href="/admin/user/update/${user.id}"
                                                    class="btn btn-warning  mx-2">Update</a>
                                                <a data-bs-toggle="modal"
                                                    data-bs-target="#confirmDeleteModal-${user.id}"
                                                    class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>

                                        <!-- Modal for delete user -->
                                        <!-- Modal với ID động -->
                                        <div class="modal fade" id="confirmDeleteModal-${user.id}" tabindex="-1"
                                            aria-labelledby="exampleModalLabel-${user.id}" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel-${user.id}">
                                                            Confirm deletion</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Are you sure you want to delete user <br>
                                                        <b>${user.fullname}</b> ?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-success"
                                                            data-bs-dismiss="modal">No</button>
                                                        <button type="button" class="btn btn-danger"
                                                            onclick="deleteUser('${user.id}')">Yes</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </body>

            </html>
            <script>

                function deleteUser(userId) {

                    $.ajax({
                        url: '/admin/user/delete/' + userId,
                        type: 'DELETE',
                        success: function (result) {
                            window.location.href = "/admin/user?message=delete_success";
                        },
                        error: function (error) {
                            window.location.href = "/admin/user?message=delete_false";
                        }
                    });

                    const modalId = '#confirmDeleteModal-' + userId;
                    const modalElement = document.querySelector(modalId);
                    const modalInstance = bootstrap.Modal.getInstance(modalElement);
                    modalInstance.hide();
                }
            </script>