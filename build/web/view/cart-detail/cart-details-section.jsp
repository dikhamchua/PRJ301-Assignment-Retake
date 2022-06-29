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
            <h1>Shopping Cart</h1>
            <table class="table ">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">Image</th>
                        <th scope="col">Name</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Amount</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.cartHashMap}" var="product">
                        <tr>
                            <th scope="row">1</th>
                            <td>
                                <img src="${product.key.imageUrl}" alt="alt"/> 
                            </td>
                            <td>${product.key.name}</td>
                            <td>${product.key.quantity}</td>
                            <td>${product.key.price}</td>
                            <td>${product.key.quantity}</td>
                            <td><a href="#">Update</a> <a href="">Delete</a></td>
                        </tr>

                    </c:forEach>
                </tbody>
            </table>
        </section>
    </body>
</html>
