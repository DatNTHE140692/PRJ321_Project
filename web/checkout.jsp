<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="vi">
    <!-- head tag import Start -->
    <%@ include file="components/head.jsp" %>
    <!-- head tag import End -->
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
                                        <h1 data-animation="fadeInUp" data-delay=".4s" >Checkout</h1>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                <li class="breadcrumb-item"><a href="#">checkout</a></li> 
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

            <!--? Checkout Area Start-->
            <section class="checkout_area section-padding40">
                <div class="container">
                    <div class="billing_details">
                        <form class="row contact_form" action="checkout" method="post" novalidate="novalidate">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h3>Billing Details</h3>
                                    <div class="row">
                                        <div class="col-md-6 form-group p_star">
                                            <input type="text" class="form-control" id="first" name="name" />
                                            <span class="placeholder" data-placeholder="First name"></span>
                                        </div>
                                        <div class="col-md-6 form-group p_star">
                                            <input type="text" class="form-control" id="last" name="name" />
                                            <span class="placeholder" data-placeholder="Last name"></span>
                                        </div>
                                        <div class="col-md-6 form-group p_star">
                                            <input type="text" class="form-control" id="number" name="number" />
                                            <span class="placeholder" data-placeholder="Phone number"></span>
                                        </div>
                                        <div class="col-md-6 form-group p_star">
                                            <input type="text" class="form-control" id="email" name="compemailany" />
                                            <span class="placeholder" data-placeholder="Email Address"></span>
                                        </div>
                                        <div class="col-md-12 form-group p_star">
                                            <input type="text" class="form-control" id="add" name="add2" />
                                            <span class="placeholder" data-placeholder="Address"></span>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <textarea class="form-control" name="message" id="message" rows="1" placeholder="Order Notes"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="order_box">
                                        <h2>Your Order</h2>
                                        <ul class="list">
                                            <li>
                                                <a href="#">Product<span>Total</span>
                                                </a>
                                            </li>
                                            <c:set var="total" value="${0}" />
                                            <c:forEach items="${sessionScope.user.productList}" var="p">
                                                <li>
                                                    <a href="product?id=${p.id}">${p.name}
                                                        <span class="middle">x ${p.quantity}</span>
                                                        <span class="last">$<fmt:formatNumber maxFractionDigits="3" value="${p.quantity * p.price}" /></span>
                                                    </a>
                                                </li>
                                                <c:set var="total" value="${total + p.quantity * p.price}" />
                                            </c:forEach>
                                        </ul>
                                        <ul class="list list_2">
                                            <li>
                                                <a href="#">Cart Total <span>$<fmt:formatNumber maxFractionDigits="3" value="${total}" /></span></a>
                                            </li>
                                            <li>
                                                <a href="#">Shipping <span>$50</span></a>
                                            </li>
                                            <li>
                                                <a href="#">Total <span>$<fmt:formatNumber maxFractionDigits="3" value="${total + 50}" /></span></a>
                                            </li>
                                        </ul>
                                        <button class="btn w-100">Complete Order</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
            <!--End Checkout Area -->

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