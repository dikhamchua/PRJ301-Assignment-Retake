<%-- 
    Document   : pagination
    Created on : Jun 24, 2022, 1:17:15 AM
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
        <section id="page-navigation" class="d-flex justify-content-center">
            <ul class="pagination">
                <li class="page-item"><a class="page-link" href="home?page=${page-page+1}">Home</a></li>
                <li class="page-item" ><a class="page-link" href="home?page=${page-1}">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="home?page=${page}">${page}</a></li>

                <c:if test="${page+1 <= numberPage}" >
                    <li class="page-item">
                        <a class="page-link" href="home?page=${page+1}">${page + 1}</a>
                    </li>
                </c:if>
                <c:if test="${page+2 <= numberPage}" >
                    <li class="page-item">
                        <a class="page-link" href="home?page=${page+2}">${page + 2}</a>
                    </li>
                </c:if>
                <c:if test="${page+1 <= numberPage}" >
                    <li class="page-item">
                        <a class="page-link" href="home?page=${page+1}">Next</a>
                    </li>
                </c:if>
                <c:if test="${page+1 <= numberPage}" >
                    <li class="page-item">
                        <a class="page-link" href="home?page=${numberPage}">Last</a>
                    </li>
                </c:if>
            </ul>
        </section>

    </body>
</html>
