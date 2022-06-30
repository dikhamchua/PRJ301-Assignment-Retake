<%-- 
    Document   : navigation
    Created on : Jun 23, 2022, 1:26:00 AM
    Author     : PHAM KHAC VINH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <!-- Navigation Bar -->
        <section id="navigation-bar">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-lg navbar-light ">
                    <a href="#" class="navbar-brand">Start Bootstrap</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01"
                            aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item"> <a href="/Shopping_Testing_2/home" class="nav-link">Home</a> </li>
                            <li class="nav-item"><a href="home" class="nav-link">About</a></li>
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
                                   data-toggle="dropdown" aria-expanded="false">Download</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <li><a class="dropdown-item" href="#">All Products</a></li>
                                    <li class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="#">Popular Items</a></li>
                                    <li><a class="dropdown-item" href="#">New Arrivals</a></li>

                                </ul>
                            </li>
                        </ul>

                        <nav class="navbar navbar-light bg-light pl-sm-0">
                            <form action="search" class="form-inline">
                                <input class="form-control mr-sm-2" name="keyword" type="search" placeholder="Search" aria-label="Search">
                                <button class="btn btn-outline-success my-2 my-sm-0 ml-sm-0" type="submit">Search</button>
                            </form>
                        </nav>
                        <a class="btn btn-outline-dark" type="submit" href="cart">
                            <i class="fa-solid fa-cart-shopping"></i>
                            Cart
                            <span class="badge bg-dark text-white mr-auto rounded-pill">${sessionScope.cartHashMap.size()}</span>
                        </a>

                        <button class="btn btn-outline-primary ml-2">Login</button>
                    </div>

                </nav>
            </div>
        </section>
    </body>
    <!--     Bootstrap Scripts 
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>-->
</html>