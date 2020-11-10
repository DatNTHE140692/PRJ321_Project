<%-- 
    Document   : history
    Created on : Nov 9, 2020, 10:28:01 PM
    Author     : #Panda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi" class="no-js">
    <%@ include file="components/head.jsp" %>
    <body>
        <%@ include file="components/header.jsp" %>
        <main>
            <!--? slider Area Start-->
            <div class="slider-area ">
                <div class="slider-active">
                    <div class="single-slider hero-overly2  slider-height2 d-flex align-items-center slider-bg2">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-6 col-lg-8 col-md-8">
                                    <div class="hero__caption hero__caption2">
                                        <h1 data-animation="fadeInUp" data-delay=".4s" >Orders History</h1>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                <li class="breadcrumb-item"><a href="#">Orders History</a></li> 
                                            </ol>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- slider Area End-->
            <section class="section-padding40">
                <div class="container">
                    <div class="cart_inner">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Order Time</th>
                                        <th>Name</th>
                                        <th>Address</th>
                                        <th>Email</th>
                                        <th>Phone Number</th>
                                        <th>Order Notes</th>
                                        <th>Order Total</th>
                                        <th>View Detail</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty requestScope.orders}">
                                            <c:forEach items="${requestScope.orders}" var="o">
                                                <tr>
                                                    <td>${o.id}</td>  
                                                    <td>${o.orderTime}</td>  
                                                    <td>${o.user.fullname}</td>  
                                                    <td>${o.user.address}</td>  
                                                    <td>${o.user.email}</td>  
                                                    <td>${o.user.phonenumber}</td>  
                                                    <td>${o.orderNotes}</td>  
                                                    <td>$${o.cartTotal}</td>  
                                                    <td><a href="viewOrder?id=${o.id}" class="btn"><i class="far fa-eye"></i></a></td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>History is Empty!</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </<tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- footer import Start -->
        <%@ include file="components/footer.jsp" %>
        <!-- footer import End -->
        <!-- Scroll Up -->
        <div id="back-top" >
            <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
        </div>
        <%@ include file="components/js.jsp" %>
    </body>
</html>
