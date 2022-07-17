<%-- 
    Document   : edit-product
    Created on : Jul 14, 2022, 6:10:58 AM
    Author     : PHAM KHAC VINH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <!-- Bootstrap CDN -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />

        <!-- CSS stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles-admin-edit-product.css" />

        <!-- Font Awesome -->
        <script src="https://kit.fontawesome.com/65d7426ab6.js" crossorigin="anonymous"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <jsp:include page="../home/navigation-section-admin.jsp"></jsp:include> 

            <section id="product-item">
                <div class="row">
                    <!-- Image product item -->

                    <img class="col-sm-6" src="${pageContext.request.contextPath}/${product.imageUrl}"
                     width ="600"  height = "600" alt="Wrong" />
                <!-- Description -->
                <div class="product-description col-sm-6">
                    <form action="edit-product" method="POST" enctype="multipart/form-data" >
                        <!--Name Product-->
                        <input type="hidden" name="id" value="${product.id}"/>
                        <div class="form-group"> 
                            <h1>
                                <label for="nameProduct">Name Product</label>
                                <input type="text" id="nameProduct" class="form-control" 
                                       name="name" value="${product.name}" placeholder="Input name product"/>
                            </h1>
                        </div>

                        <!--Price product-->
                        <div class="form-group"> 
                            <h2>
                                <label for="priceProduct">Price</label>
                                <input type="text" id="priceProduct" class="form-control" min="0" step ="0.1"
                                       onkeypress="return event.charCode != 45"
                                       name="price" value="${product.price}" placeholder="Input price product"/>
                            </h2>
                        </div>    
                        <!--Description product-->
                        <div class="form-group">
                            <h2>
                                <label for="descriptionProduct">Description</label>
                                <textarea id="descriptionProduct" class="form-control" 
                                          name="description" rows="4">${product.description}</textarea>
                            </h2>

                        </div>
                        <!--Quantity product-->
                        <div class="form-group"> 
                            <h2>
                                <label for="quantityProduct">Quantity</label>
                                <input type="number" class="form-control"
                                       id="quantityProduct"
                                       min="0" step="1"  
                                       onkeypress="return event.charCode >= 48 && event.charCode <= 57"
                                       name="quantity" value="${product.quantity}"/>

                            </h2>
                        </div>

                        <!--Image product-->
                        <div class="form-group"> 
                            <h2>
                                <label for="changeImage">Change Image</label>
                                <input type="file" 
                                       class="form-control" name="photo" placeholder="Enter photo">

                            </h2>
                        </div>

                        <!--Category-->
                        <div class="form-group">
                            <label for="categoryProduct">Category</label>
                            <select class="form-control" id="categoryProduct" name="categoryProduct">
                                <c:forEach items="${sessionScope.listCategories}" var="category">
                                    <option value="${category.id}">${category.name}</option>
                                </c:forEach>
                            </select>
                        </div>


                        <!--Submit button-->
                        <input type="submit" class="btn btn-lg btn-outline-dark" value="Submit"/>
                    </form>
                </div>
            </div>
        </section>

        <!--Pagination section-->
        <jsp:include page="/decorate/footer-section.jsp"></jsp:include>           
    </body>


    <!-- Bootstrap Scripts -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
    crossorigin="anonymous"></script>
</html>
