<!doctype html>
<html class="no-js" lang="vi">
    <!-- head tag import Start -->
    <%@ include file="components/head.jsp" %>
    <!-- head tag import End -->
    <body>
        <!-- header tag import Start -->
        <%@ include file="components/header.jsp" %>
        <!-- header tag import End -->
        <main>
            <!--? slider Area Start-->
            <div class="slider-area ">
                <div class="slider-active">
                    <div class="single-slider hero-overly1 slider-height d-flex align-items-center slider-bg1">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-6 col-lg-8 col-md-8">
                                    <div class="hero__caption">
                                        <span>70% Sale off </span>
                                        <h1 data-animation="fadeInUp" data-delay=".4s" >Furniture  at Cost</h1>
                                        <p data-animation="fadeInUp" data-delay=".6s">Suspendisse varius enim in eros elementum 
                                            tristique. Duis cursus, mi quis viverra ornare, eros 
                                            dolor interdum nulla.</p>
                                        <!-- Hero-btn -->
                                        <div class="hero__btn" data-animation="fadeInUp" data-delay=".7s">
                                            <a href="store.jsp" class="btn hero-btn">Discover More</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- slider Area End-->
            <!--? Properties Start -->
            <section class="properties new-arrival fix">
                <div class="container">
                    <!-- Section tittle -->
                    <div class="row justify-content-center">
                        <div class="col-xl-12 col-lg-8 col-md-10">
                            <div class="section-tittle mb-60 wow fadeInUp" data-wow-duration="1s" data-wow-delay=".2s" style="visibility: visible; animation-duration: 1s; animation-delay: 0.2s; animation-name: fadeInUp;">
                                <h2>Latest products</h2>
                                <p>Suspendisse varius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <c:forEach items="${requestScope.latestProducts}" var="p">
                            <div class="col-lg-3 col-md-6 col-sm-6">
                                <div class="single-new-arrival mb-50 text-center">
                                    <div class="popular-img">
                                        <img src="${p.thumbnail}" alt="">
                                    </div>
                                    <div class="popular-caption">
                                        <h3><a href="product?id=${p.id}">${p.name}</a></h3>
                                        <span>$${p.price}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!--? Properties End -->
            <!--? instagram-social start -->
            <div class="instagram-area">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-xl-3 col-lg-4 col-md-6">
                            <div class="instra-tittle mb-40">
                                <div class="section-tittle">
                                    <img src="assets/img/gallery/insta.png" alt="">
                                    <h2>Get Inspired with Instagram</h2>
                                    <P class="mb-35">Suspendisse varius enim in eros elementum tristique. Duis cursus, mi quis viverra ornare, eros dolor interdum nulla.</P>
                                    <a href="store" class="border-btn">Discover More</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-8">
                            <div class="row no-gutters">
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                    <div class="single-instagram">
                                        <img src="assets/img/gallery/instra1.png" alt="" class="w-100">
                                        <a href="#"><i class="ti-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                    <div class="single-instagram">
                                        <img src="assets/img/gallery/instra2.png" alt="" class="w-100">
                                        <a href="#"><i class="ti-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- instagram-social End -->
            <!-- Popular Locations End -->
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