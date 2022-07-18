<%-- 
    Document   : viewInvoice
    Created on : Jul 18, 2022, 7:02:39 AM
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
                        </ul> 
                    </div>
                    <div class="container-fluid profile col-md-10">

                        <!--List Invoice is empty-->
                    <c:if test="${sessionScope.listInvoice == null || 
                                  sessionScope.listInvoice.size()== 0}">
                          <h1>You have never shopping before !!</h1>
                    </c:if>

                    <!--Shopping cart have order-->
                    <c:if test="${sessionScope.listInvoice.size() != 0}">
                        <h1>Invoice</h1>

                        <div class="container-fluid">
                            <!--Order detail-->

                            <table class="table table-hover ">
                                <thead class="thead-light">
                                    <tr>
                                        <th scope="col">No</th>
                                        <!--<th scope="col">Image</th>-->
                                        <th scope="col">Name</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Amount</th>
                                        <th scope="col">Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.listInvoice}" var="cart" varStatus="status">
                                        <th scope="row">${status.index + 1}</th>
                                        <c:set var="total" value="${0}"/>
                                        <c:forEach items="${cart.value}" var="item"> 


                                        <tr>
                                        <fmt:setLocale value = "en_US"/>
                                        
                                        <td></td>
                                        <!--Name-->
                                        <td>${item.name}</td>

                                        <!--Quantity-->
                                        <td>
                                            ${item.quantity}
                                        </td>

                                        <!--Price-->
                                        <td>
                                            ${item.price.price}
                                        </td>
                                        <!--Amount-->
                                        <td>
                                            ${item.price.price * item.quantity}
                                        </td>

                                        <c:set var="total" value="${total + item.price.price * item.quantity}" />
                                        <td>
                                            ${item.createdDate}
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
                                                ${total}
                                            </h3>
                                        </td>
                                    </tr>

                                </c:forEach>
                                </tbody>
                            </table>



                        </div>
                    </c:if>
                </div>
            </div>
        </div>

    </div>

    <!--Footer-->
</body>
</html>
