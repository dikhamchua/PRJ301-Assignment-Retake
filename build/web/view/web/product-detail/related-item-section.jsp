<%-- 
    Document   : related-item
    Created on : Jun 28, 2022, 12:41:43 AM
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
       <section id="related-items">
        <div class="container-fluid">
            <h2>Related products</h2>
            <!-- First row -->
            <div class="row">


                <!-- First product - first row -->
                <div class="col-lg-4 mb-md-5 ">
                    <div class="card h-100">
                        <img src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." class="card-img-top">
                        <div class="card-body">
                            <div class="text-center">
                                <h5 class="card-title">Fancy Product</h5>
                                $40.00 - $80.00
                            </div>
                        </div>

                        <div class="card-footer  bg-transparent border-top-0">
                            <div class="text-center">
                                <a href="#" class="btn btn-outline-dark">View option</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Second product - first row -->
                <div class="col-lg-4 mb-md-5 ">
                    <div class="card h-100">
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">
                            Sale
                        </div>
                        <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                        <div class="card-body ">
                            <div class="text-center">
                                <h5 class="card-title">Special Item</h5>
                                <div class="text-warning small">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                </div>
                                <span class="text-muted" style="text-decoration: line-through;">$20.00</span>
                                $18.00
                            </div>
                        </div>
                        <div class="card-footer bg-transparent border-top-0">
                            <div class="text-center">
                                <a href="#" class="btn btn-outline-dark">View option</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Third product - first row -->
                <div class="col-lg-4 mb-md-5 ">
                    <div class="card h-100">
                        <img src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." class="card-img-top">
                        <div class="card-body">
                            <div class="text-center">
                                <h5 class="card-title">Sale Item</h5>
                                <span class="text-muted" style="text-decoration: line-through;">$20.00</span>
                                $25.00
                            </div>
                        </div>
                        <div class="card-footer bg-transparent border-top-0">
                            <div class="text-center">
                                <a href="#" class="btn btn-outline-dark">View option</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    </body>
</html>
