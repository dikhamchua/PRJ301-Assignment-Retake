<%-- 
    Document   : invoice
    Created on : Jul 1, 2022, 9:29:47 PM
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

        <section id="cart-details">

            <!--Shopping cart empty-->
            <c:if test="${sessionScope.cartHashMap == null || 
                          sessionScope.cartHashMap.size()==0}">
                  <h1>List Cart is Empty</h1>
            </c:if>

            <!--Shopping cart have order-->
            <c:if test="${sessionScope.cartHashMap.size() > 0}">
                <h1>Shopping Cart</h1>

                <div class="container-fluid">
                    <div class="row">
                        <!--Order detail-->
                        <div class="col-xl-8">
                            <table class="table table-hover ">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Amount</th>
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
                                                ${cart.value.quantity}
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
                        </div>

                        <!--Customer information-->
                        <div class="col-xl-4 text-left customer-info">
                            <form class="form-customer" action="check-out" method="POST">
                                <h1>Information Of Customer</h1>
                                <!--Name Customer-->
                                <label for="inputName">Name</label>
                                <input type="text" class="form-control"
                                       name="nameCustomer"
                                       id="inputName" 
                                       placeholder="Enter name">
                                <!--Phone-->
                                <label for="inputPhone">Phone</label>
                                <input type="text"
                                       name="phoneCustomer"
                                       class="form-control"
                                       id="inputPhone" 
                                       placeholder="Enter phone">
                                <!--Address-->
                                <label for="inputAddress">Address</label>
                                <input type="text" class="form-control"
                                       name="addressCustomer"
                                       id="inputAddress" 
                                       placeholder="Enter address">
                                <!--Note-->
                                <label for="inputNote">Note</label>
                                <textarea class="form-control"
                                          name="noteCustomer"
                                          id="inputNote"
                                          rows="3"></textarea>
                                <button type="submit" class="btn btn-primary customer-submit">
                                    Submit
                                </button>
                            </form>
                        </div>
                    </div>
                </div>

            </c:if>
        </section>

    </body>
</html>
