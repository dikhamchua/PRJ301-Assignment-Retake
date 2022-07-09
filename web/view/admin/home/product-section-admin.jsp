<%-- 
    Document   : product-section-admin
    Created on : Jul 9, 2022, 11:19:03 PM
    Author     : PHAM KHAC VINH
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section id="product">
            <!-- Category -->
            <div class="row">
                <div class="col-md-2 mb-sm-5">
                    <ul class="list-group">
                        <c:forEach items="${sessionScope.listCategories}" var="category">
                            <li class="list-group-item">
                                <a href="filterCategory?categoryId=${category.id}"> ${category.name} </a>
                            </li>
                        </c:forEach>
                    </ul>

                </div>
                <!-- Product details -->
                <c:choose>

                    <c:when test="${sessionScope.listProducts == null || 
                                    sessionScope.listProducts.size() == 0}">
                        <h3>NOT FOUND</h3>
                    </c:when>

                    <c:otherwise>
                        <div class="col-md-10 product-details">
                            <!-- First row -->
                            <div class="row">
                                <c:forEach items="${sessionScope.listProducts}" var ="product" 
                                           begin ="${pageControl.begin}" end="${pageControl.end}">
                                    <!-- First product - first row -->
                                    <div class="col-lg-4 mb-md-5 ">
                                        ${product.id}
                                        <div class="card h-100">
                                            <a href="productDetail?productID=${product.id}">
                                                <img src="${product.imageUrl}" alt="..." class="card-img-top">
                                            </a>
                                            <div class="card-body">
                                                <div class="text-center">
                                                    <h5 class="card-title">${product.name}</h5>
                                                    ${product.price}$
                                                </div>
                                            </div>

                                            <div class="card-footer  bg-transparent border-top-0">
                                                <div class="text-center">
                                                    <a href="productDetail?productID=${product.id}" class="btn btn-outline-dark">View Product</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
    </body>
</html>
