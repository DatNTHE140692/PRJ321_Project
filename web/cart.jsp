<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="vi">
    <!-- head import Start -->
    <%@ include file="components/head.jsp" %>
    <!-- head import End -->
    <body>
        <!-- header import Start -->
        <%@ include file="components/header.jsp" %>
        <!-- header import End -->
        <main>
            <!--? slider Area Start-->
            <div class="slider-area ">
                <div class="slider-active">
                    <div class="single-slider hero-overly2  slider-height2 d-flex align-items-center slider-bg2">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-6 col-lg-8 col-md-8">
                                    <div class="hero__caption hero__caption2">
                                        <h1 data-animation="fadeInUp" data-delay=".4s" >Cart List</h1>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                <li class="breadcrumb-item"><a href="#">Cart List</a></li> 
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
            <!--================Cart Area =================-->
            <section class="cart_area section-padding40">
                <div class="container">
                    <div class="cart_inner">
                        <form action="cart" method="post">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Product</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Remove Item</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${not empty sessionScope.user.productList}">
                                                <c:set var = "total" value = "${0}"/>
                                                <c:forEach items="${sessionScope.user.productList}" var="p">
                                                    <tr>
                                                        <td>
                                                            <div class="media">
                                                                <div class="d-flex">
                                                                    <a href="product?id=${p.id}"><img src="${p.thumbnail}" alt="" /></a>
                                                                </div>
                                                                <div class="media-body">
                                                                    <p><a href="product?id=${p.id}" style="color: black">${p.name}</a></p>
                                                                </div>
                                                                <input type="hidden" value="${p.id}" name="pid" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <h5>$${p.price}</h5>
                                                        </td>
                                                        <td>
                                                            <div class="product_count">
                                                                <input type="number" value="${p.quantity}" min="1" name="quantity" />
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <h5>$<fmt:formatNumber maxFractionDigits="3" value="${p.quantity * p.price}" /></h5>
                                                        </td>
                                                        <td><a href="" class="btn danger"><i class="far fa-trash-alt"></i></a></td>
                                                                <c:set var = "total" value = "${total + p.quantity * p.price}"/>
                                                    </tr>
                                                </c:forEach>
                                                <tr>
                                                    <td>
                                                        <h5>Cart total:</h5>
                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>
                                                        <h5>$<fmt:formatNumber maxFractionDigits="3" value="${total}" /></h5>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr class="bottom_button">
                                                    <td><button type="submit" class="btn">Update Cart</button></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td>Your Cart is Empty</td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                                <div class="checkout_btn_inner float-right">
                                    <a class="btn" href="store">Continue Shopping</a>
                                    <c:if test="${not empty sessionScope.user.productList}">
                                        <a class="btn checkout_btn" href="checkout">Proceed to checkout</a>
                                    </c:if>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
            <!--================End Cart Area =================-->
            <!--? Services Area Start -->
            <div class="categories-area section-padding40 gray-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="single-cat mb-50 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">
                                <div class="cat-icon">
                                    <img src="assets/img/icon/services1.svg" alt="">
                                </div>
                                <div class="cat-cap">
                                    <h5>Fast & Free Delivery</h5>
                                    <p>Free delivery on all orders</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="single-cat mb-50 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s">
                                <div class="cat-icon">
                                    <img src="assets/img/icon/services2.svg" alt="">
                                </div>
                                <div class="cat-cap">
                                    <h5>Secure Payment</h5>
                                    <p>Free delivery on all orders</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="single-cat mb-50 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".4s">
                                <div class="cat-icon">
                                    <img src="assets/img/icon/services3.svg" alt="">
                                </div>
                                <div class="cat-cap">
                                    <h5>Money Back Guarantee</h5>
                                    <p>Free delivery on all orders</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="single-cat mb-50 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".5s">
                                <div class="cat-icon">
                                    <img src="assets/img/icon/services4.svg" alt="">
                                </div>
                                <div class="cat-cap">
                                    <h5>Online Support</h5>
                                    <p>Free delivery on all orders</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--? Services Area End -->
        </main>
        <!-- footer import Start -->
        <%@ include file="components/footer.jsp" %>
        <!-- footer import End -->
        <!-- Scroll Up -->
        <div id="back-top" >
            <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
        </div>

        <!-- js import Start -->
        <%@ include file="components/js.jsp" %>
        <!-- js import End -->
    </body>
</html>