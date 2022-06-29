<%-- 
    Document   : cart-details
    Created on : Jun 28, 2022, 3:48:43 PM
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
                            <th scope="col">Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.cartHashMap}" var="cart" varStatus="status">
                            <tr>
                                <th scope="row">${status.index + 1}</th>
                                <td>
                                    <img src="${cart.value.product.imageUrl}" alt="alt"/> 
                                </td>
                                <td>${cart.value.product.name}</td>
                                <td>${cart.value.quantity}</td>
                                <td>${cart.value.product.price}</td>
                                <td>${cart.value.product.price * cart.value.quantity}</td>
                                <td>
                                    <!--Delete action-->
                                    <a href="cart-delete?productID=${cart.key}">
                                        <i class="fa-solid fa-trash fa-2x text-danger"></i>
                                    </a> 
                                </td>
                                <td>
                                    <!--Update Action-->
                                    <a href="cart-update">
                                        <i class="fa-solid fa-pencil fa-2x text-success"></i>
                                    </a>
                                </td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

        </section>
    </body>
</html>
