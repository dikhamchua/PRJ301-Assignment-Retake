<%-- 
    Document   : cart-details
    Created on : Jun 28, 2022, 3:48:43 PM
    Author     : PHAM KHAC VINH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="css/styles-cart.css" />

    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/65d7426ab6.js" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    </head>
    <body>
        <!--Navigation-->
        <jsp:include page="/decorate/navigation-section.jsp" ></jsp:include>
        
        <section id="cart-details">
            <!--Shopping cart empty-->
            <c:if test="${sessionScope.cartHashMap.size() == 0 ||
                          sessionScope.cartHashMap eq null}">
                  <h1>Shopping Cart Is Empty</h1>
            </c:if>

            <!--Shopping cart have order-->
            <c:if test="${sessionScope.cartHashMap.size() != 0}">
                <h1>Shopping Cart</h1>
                <table class="table ">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">Image</th>
                            <th scope="col">Name</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            <th scope="col">Amount</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.cartHashMap}" var="cart" varStatus="status">
                            <tr>
                                <fmt:setLocale value = "en_US"/>
                                <th scope="row">${status.index + 1}</th>

                                <!--Image-->
                                <td>
                                    <img src="${cart.value.product.imageUrl}" alt="alt"/> 
                                </td>
                                <!--Name-->
                                <td>${cart.value.product.name}</td>

                                <!--Quantity-->
                                <td>
                                    <form action="order-update" method ="GET">
                                        <input type="hidden"
                                               name="productID" 
                                               value="${cart.value.product.id}" />
                                        <input onchange="this.form.submit()" 
                                               type="number"
                                               min ="1"
                                               name="quantity"
                                               value="${cart.value.quantity}" />
                                    </form>
                                </td>

                                <!--Price-->
                                <td>
                                    <fmt:formatNumber type="currency" value="${cart.value.product.price}">

                                    </fmt:formatNumber>
                                </td>

                                <!--Amount-->
                                <td>
                                    <fmt:formatNumber type="currency"
                                                      value="${cart.value.product.price * cart.value.quantity}"
                                                      maxFractionDigits="2">
                                    </fmt:formatNumber>
                                </td>

                                <!--Delete action-->
                                <td>
                                    <a href="order-delete?productID=${cart.key}">
                                        <i class="fa-solid fa-trash fa-2x text-danger"></i>
                                    </a> 
                                </td>
                            </tr>

                        </c:forEach>
                        <tr>
                            <td></td>
                            <td>
                                <h3>Total Money</h3>
                            </td>
                            <td colspan="3"></td>
                            <td>
                                <h3>
                                    <fmt:formatNumber type="currency"
                                                      value="${requestScope.totalMoney}"
                                                      maxFractionDigits="2">
                                    </fmt:formatNumber>
                                </h3>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </c:if>

        </section>
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
