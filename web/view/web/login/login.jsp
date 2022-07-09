<%-- 
    Document   : login.jsp
    Created on : Jul 5, 2022, 4:35:49 PM
    Author     : PHAM KHAC VINH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
        <!--<link rel="stylesheet" href="css/styles-login.css">-->
        <title>Document</title>
    </head>
    <body>
        <jsp:include page="/decorate/navigation-section.jsp" ></jsp:include>
            <div class="main">

                <section id="login-section">
                    <div class="container py-5 h-100">
                        <div class="row d-flex justify-content-center  h-100">
                            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                                <div class="card bg-dark text-white" style="border-radius: 1rem;">
                                    <div class="card-body p-5">

                                        <div class="mb-md-5 mt-md-4 pb-5">

                                            <div class="text-center">
                                                <h2 class="fw-bold-2 mb-2 text-uppercase">Login</h2>
                                                <p class="text-white-50 mb-5">Please enter your login and password!</p>
                                            </div>
                                            <form action="login" method="POST">
                                                <div class="form-group form-white mb-4">
                                                    <label class="form-label text-justify-left" for="typeEmailX">Username</label>
                                                    <input type="text" id="typeEmailX" name="username" class="form-control form-control-lg" />
                                                </div>

                                                <div class="form-outline form-white mb-4">
                                                    <label class="form-label" for="typePasswordX">Password</label>
                                                    <input type="password" id="typePasswordX" name="password" class="form-control form-control-lg" />
                                                </div>

                                                <p class="small mb-5 pb-lg-2"><a class="text-white" href="#!">Forgot password?</a></p>

                                                <div class="justify-content-center text-center">
                                                    <button class="btn btn-outline-light btn-lg px-5 " type="submit">Login</button>
                                                </div>
                                                <div class="justify-content-center text-center">
                                                <c:if test="${requestScope.error != null}">
                                                    <span class="text-danger">${requestScope.error}</span>
                                                </c:if>
                                            </div>

                                        </form>
                                    </div>

                                    <div class="justify-content-center text-center">
                                        <p class="mb-0">Don't have an account? <a href="#!" class="text-white-50 fw-bold">Sign
                                                Up</a>
                                        </p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>

        </div>
    </body>

    <script src="js/script.js"></script>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            // Mong muốn của chúng ta
            Validator({
                form: '#form-1',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isRequired('#fullname', 'Vui lòng nhập tên đầy đủ của bạn'),
                    Validator.isEmail('#email'),
                    Validator.isPhone('#phone'),
                    Validator.minLength('#password', 6),
                    Validator.isRequired('#password_confirmation'),
                    Validator.isConfirmed('#password_confirmation', function () {
                        return document.querySelector('#form-1 #password').value;
                    }, 'Mật khẩu nhập lại không chính xác')
                ],
                onSubmit: function (data) {
                    // Call API
                    console.log(data);
                }
            });


            Validator({
                form: '#form-2',
                formGroupSelector: '.form-group',
                errorSelector: '.form-message',
                rules: [
                    Validator.isRequired('#username', 'Please enter username'),
                    Validator.minLength('#password', 6),
                ],
                onSubmit: function (data) {
                    // Call API
                    console.log(data);
                }
            });
        });

    </script>
</html>
