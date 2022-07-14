<%-- 
    Document   : navigation-admin
    Created on : Jul 9, 2022, 11:17:25 PM
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
        <!-- Navigation Bar -->
    <section id="navigation-bar" class ="sticky-top bg-dark ">
        <div class="container-fluid ">
            <nav class="navbar navbar-expand-lg navbar-light  ">
                <a href="#" class="navbar-brand text-white">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
                    aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item"> <a href="search?keyword=" class="nav-link text-white">Home</a> </li>
                        <li class="nav-item"><a href="home" class="nav-link text-white">About</a></li>
                        <li class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle text-white" id="navbarDropdownMenuLink"
                                data-toggle="dropdown" aria-expanded="false">Download</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <li><a class="dropdown-item" href="#">All Products</a></li>
                                <li class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Popular Items</a></li>
                                <li><a class="dropdown-item" href="#">New Arrivals</a></li>

                            </ul>
                        </li>
                    </ul>
                    <!--Button Search-->
                    <nav class="navbar navbar-light bg-light button-search mr-sm-2">
                        <form action="search" class="form-inline">
                            <input class="form-control" name="keyword" type="search" placeholder="Search"
                                aria-label="Search">
                            <button class="btn btn-outline-light ml-sm-2 " type="submit">Search</button>
                        </form>
                    </nav>
                    <!--Button Cart-->
                    <a class="btn btn-outline-light " type="submit" href="dashboard">
                        <i class="fa-solid fa-house-chimney-user"></i>
                        Dashboard
                        <span class="badge bg-dark text-white mr-auto rounded-pill"></span>
                    </a>

                    <!--Button Login-->
                    <c:choose>
                        <c:when test="${sessionScope.account != null}">
                            <a class="btn btn-outline-primary ml-2" href="login">
                                DisplayName
                            </a>
                            <a class="btn btn-outline-primary ml-2" href="../logout">
                                Logout
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-outline-light ml-2" href="login">
                                Login
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>

            </nav>
        </div>
    </section>
    </body>
</html>
