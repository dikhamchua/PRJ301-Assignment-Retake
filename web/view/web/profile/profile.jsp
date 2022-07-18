<%-- 
    Document   : profile
    Created on : Jul 18, 2022, 3:24:58 AM
    Author     : PHAM KHAC VINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <!-- CSS stylesheet -->
        <link rel="stylesheet" href="css/styles-profile-web.css"/>
        <!-- Bootstrap CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />


        <!-- Font Awesome -->
        <script src="https://kit.fontawesome.com/65d7426ab6.js" crossorigin="anonymous"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    </head>
    <body>

        <!--        Navigation-->
        <jsp:include page="/decorate/navigation-section.jsp"></jsp:include>

            <!--Profile-->
            <div class="wrapper">
                <div class="row">
                    <div class="sidebar col-md-2">
                        <h2>Sidebar</h2>
                        <ul>
                            <li><a href="view-profile"><i class="fas fa-home"></i>Home</a></li>
                            <li><a href="view-profile"><i class="fas fa-user"></i>Profile</a></li>
                            <li><a href="view-invoice"><i class="fas fa-address-card"></i>View Order</a></li>
                            <!--                    <li><a href="#"><i class="fas fa-project-diagram"></i>portfolio</a></li>
                                                <li><a href="#"><i class="fas fa-blog"></i>Blogs</a></li>
                                                <li><a href="#"><i class="fas fa-address-book"></i>Contact</a></li>
                                                <li><a href="#"><i class="fas fa-map-pin"></i>Map</a></li>-->
                        </ul> 
                    </div>
                    <div class="container-fluid profile col-md-10">
                        <div class="row">
                            <div class="col-xl-4">
                                <!-- Profile picture card-->
                                <div class="card mb-4 mb-xl-0">
                                    <div class="card-header">Profile Picture</div>
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <img class="img-account-profile rounded-circle mb-2" 
                                             src="http://bootdey.com/img/Content/avatar/avatar1.png"
                                        width="315" height="315" alt="">
                                    <!-- Profile picture upload button-->
                                    <a class="btn btn-outline-primary" type="button">Upload new image</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-8">
                            <!-- Account details card-->
                            <div class="card mb-4">
                                <div class="card-header">Account Details</div>
                                <div class="card-body">
                                    <!--Form-->
                                    <form action="view-profile" method="POST"  id="form-1" >
                                        <!--Username-->
                                        <div class="mb-3 form-group">
                                            <label class="small mb-1" for="inputUsername">Username</label>
                                            <input class="form-control" id="inputUsername" type="text" 
                                                   readonly  value="${account.username}" name="username"
                                                   >
                                            <span class="form-message"></span>
                                        </div>
                                        <!--Display Name-->
                                        <div class="mb-3 form-group">
                                            <label class="small mb-1" for="displayName">Display Name</label>
                                            <input class="form-control" name="displayName" id="displayName" type="text" 
                                                   value="${account.displayName}"
                                                   required />
                                            <span class="form-message"></span>
                                        </div>
                                        <!--Address-->
                                        <div class="mb-3 form-group">
                                            <label class="small mb-1" for="address">Address</label>
                                            <input class="form-control" id="address" type="text" 
                                                   value="${account.address}" name="address"
                                                   required />
                                            <span class="form-message"></span>
                                        </div>
                                        <!--Email-->
                                        <div class="mb-3 form-group">
                                            <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                            <input class="form-control" id="inputEmailAddress" type="email" 
                                                   placeholder="Enter your email address" 
                                                   value="${account.email}" name="email"
                                                   required />
                                            <span class="form-message"></span>
                                        </div>
                                        <!--Phone-->
                                        <div class="mb-3 form-group">
                                            <label class="small mb-1" for="phone">Phone</label>
                                            <input class="form-control" id="inputEmailAddress" type="text" 
                                                   placeholder="Enter your phone" 
                                                   value="${account.phone}"
                                                   name="phone"
                                                   required />
                                            <span class="form-message"></span>
                                        </div>
                                        <!-- Save changes button-->
                                        <input class="btn btn-primary" type="submit" value="Save changes"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!--Footer-->
        <jsp:include page="/decorate/footer-section.jsp"></jsp:include>
    </body>

    <script src="/js/profile-js.js"></script>
    <script>

        document.addEventListener('DOMContentLoaded', function () {
            // Mong muốn của chúng ta
            Validator({
            form: '#form-1',
                    formGroupSelector: '.form-group',
                    errorSelector: '.form-message',
                    rules: [
                            Validator.isRequired('#displayName', 'Please input display name'),
                            Validator.isEmail('#email'),
                            Validator.minLength('#password', 6),
                            Validator.isRequired('#password_confirmation'),
                            Validator.isConfirmed('#password_confirmation', function () {
                            return document.querySelector('#form-1 #password').value;
                            }, 'Mật khẩu nhập lại không chính xác')
                            Validator.isRequired()
                    ],
            onSubmit: function (data) {
                // Call API
                console.log(data);
            }
        });

    </script>
</html>
