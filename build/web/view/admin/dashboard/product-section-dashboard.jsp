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
        <title>JSP Page</title>
    </head>
    <body>
        <section id="product-section">

                <!--Shopping cart empty-->
            <c:if test="${sessionScope.listProducts == null || 
                          sessionScope.listProducts.size()==0}">
                  <h1>List Cart is Empty</h1>
            </c:if>

            <!--Shopping cart have order-->
            <c:if test="${sessionScope.listProducts.size() > 0}">

                <div class="container-fluid">
                    <div class="row">

                        <!--Customer information-->
                        <div class="col-xl-2 text-left customer-info">
                            <ul class="list-group">
                                <c:forEach items="${sessionScope.listCategories}" var="category">
                                    <li class="list-group-item">
                                        <a href="filterCategory?categoryId=${category.id}"> ${category.name} </a>
                                    </li>
                                </c:forEach>
                        </div>
                        <!--Order detail-->
                        <div class="col-xl-10">
                            <table class="table table-hover ">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Price</th>
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
                                                <img src="${product.imageUrl}" alt="alt"/> 
                                            </td>
                                            <!--Name-->
                                            <td>${product.name}</td>

                                            <!--Quantity-->
                                            <td>
                                                ${product.quantity}
                                            </td>

                                            <!--Price-->
                                            <td>
                                                <fmt:formatNumber type="currency" value="${product.price}">
                                                </fmt:formatNumber>
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
    </body>
</html>
