<%-- 
    Document   : product-section
    Created on : Jul 11, 2022, 3:30:56 AM
    Author     : PHAM KHAC VINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles-admin-dashboard.css" />
        <title>JSP Page</title>
    </head>
    <body>


        <div class="wrapper">
            <div class="sidebar">
                <h2>Sidebar</h2>
                <ul>
                    <li><a href="#"><i class="fas fa-home"></i>Home</a></li>
                    <li><a href="#"><i class="fas fa-user"></i>Profile</a></li>
                    <li><a href="#"><i class="fas fa-address-card"></i>About</a></li>
                    <li><a href="#"><i class="fas fa-project-diagram"></i>portfolio</a></li>
                    <li><a href="#"><i class="fas fa-blog"></i>Blogs</a></li>
                    <li><a href="#"><i class="fas fa-address-book"></i>Contact</a></li>
                    <li><a href="#"><i class="fas fa-map-pin"></i>Map</a></li>
                </ul> 
                <div class="social_media">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="main_content">
                <div class="header">Shopping Cart</div>  
                <div class="info">
                    <section id="product-section">

                        <c:if test="${sessionScope.listProducts == null || 
                                      sessionScope.listProducts.size()==0}">
                              <h1>List Cart is Empty</h1>
                        </c:if>

                        <c:if test="${sessionScope.listProducts.size() > 0}">

                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-xl-12">
                                        <table class="table table-hover ">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th scope="col">No</th>
                                                    <th scope="col">Image</th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Quantity</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Edit</th>
                                                    <th scope="col">Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.listProducts}" var="product" 
                                                           varStatus="status"
                                                           begin ="${pageControl.begin}" end="${pageControl.end}">
                                                    <tr>
                                                        <fmt:setLocale value = "en_US"/>
                                                        <th scope="row">${status.index + 1}</th>

                                                        <!--Image-->
                                                        <td>
                                                            <img src="${pageContext.request.contextPath}/${product.imageUrl}" 
                                                                 width="300" height="300" alt="alt"/> 
                                                        </td>
                                                        <!--Name-->
                                                        <td>${product.name}</td>

                                                        <!--Quantity-->
                                                        <td>
                                                            <form action="update-quantity-admin" method ="GET">
                                                                <input type="hidden"
                                                                       name="productID" 
                                                                       value="${product.id}" />
                                                                <input onchange="this.form.submit()" 
                                                                       type="number"
                                                                       min ="0"
                                                                       name="quantity"
                                                                       value="${product.quantity}" />
                                                            </form>


                                                        </td>

                                                        <!--Price-->
                                                        <td>
                                                            <fmt:formatNumber type="currency" value="${product.price}">
                                                            </fmt:formatNumber>
                                                        </td>
                                                        <!--Edit-->
                                                        <td>
                                                            <a href="edit-product?productID=${product.id}">
                                                                <i class="fa-solid fa-pen-to-square fa-2x"></i>
                                                            </a>
                                                        </td>

                                                        <!--Delete-->
                                                        <td>
                                                            <a href="#">
                                                                <i class="fa-solid fa-trash fa-2x text-danger"></i>
                                                            </a>
                                                        </td>

                                                    </tr>

                                                </c:forEach>

                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>


                                </div>
                            </div>

                        </c:if>
                    </section>
                </div>
            </div>
        </div>

    </body>
</html>
