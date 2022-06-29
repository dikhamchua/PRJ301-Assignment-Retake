<%-- 
    Document   : item
    Created on : Jun 28, 2022, 12:21:33 AM
    Author     : PHAM KHAC VINH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <section id="product-item">
            <div class="row">
                <!-- Image product item -->
                
                <img class="col-sm-6" src="${product.imageUrl}" alt="Wrong" />
                <!-- Description -->
                <div class="product-description col-sm-6">
                    <h1>${product.name}</h1>
                    <span class="text-muted product-price" style="text-decoration: line-through;">$20.00</span>
                    ${product.price}$
                    <p class="description">${product.description}</p>

                    <div class="d-flex product-cart">
                        <a href="add-cart?productID=${product.id}" class="btn btn-outline-dark flex-shrink-0" type="button">
                            <i class="bi-cart-fill me-1"></i>
                            Add to cart
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
