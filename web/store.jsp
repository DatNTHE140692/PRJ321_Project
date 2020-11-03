<!doctype html>
<html class="no-js" lang="vi">
    <!-- js import Start -->
    <%@ include file="components/head.jsp" %>
    <!-- js import End -->
    <body class="full-wrapper">
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
                                        <h1 data-animation="fadeInUp" data-delay=".4s" >Our Store</h1>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                <li class="breadcrumb-item"><a href="#">Store</a></li> 
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
            <!-- listing Area Start -->
            <div class="category-area">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-7 col-lg-8 col-md-10">
                            <div class="section-tittle mb-50">
                                <h2>Shop with us</h2>
                                <p>Discover our Products</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!--? Left content -->
                        <div class="col-xl-3 col-lg-3 col-md-3">
                            <!-- Job Search start -->
                            <div class="category-listing mb-50">
                                <div class="categories-wrapper">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="small-tittle">
                                                <h2><i class="fa fa-search" aria-hidden="true"></i> Search Product</h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 mt-10">
                                        <form action="search" class="row" id="store_search">
                                            <input type="text" name="keyword" class="col-9 search_input"/>
                                            <button class="col-3 search_btn"><i class="fa fa-search" aria-hidden="true"></i></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Job Search End -->
                            <!-- Job Category Listing start -->
                            <div class="category-listing mb-50">
                                <div class="categories-wrapper">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="small-tittle">
                                                <h2><i class="fa fa-bars" aria-hidden="true"></i> Product Category</h2>
                                            </div>
                                        </div>
                                        <div class="col-12 mt-20">
                                            <ul class="unordered-list">
                                                <c:forEach items="${requestScope.categories}" var="c">
                                                    <li><a href="?cid=${c.id}" style="color: black">${c.name}</a></li>
                                                    </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Job Category Listing End -->
                        </div>
                        <!--?  Right content -->
                        <div class="col-xl-9 col-lg-9 col-md-9">
                            <!--? Pagination Start -->
                            <nav class="mb-50">
                                <ul class="pagination pagination-lg">
                                    <li class="page-item"><a class="page-link" href="#">First</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Last</a></li>
                                </ul>
                            </nav>
                            <!--? Pagination End -->
                            <!--? New Arrival Start -->
                            <div class="new-arrival new-arrival3">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                                        <div class="single-new-arrival mb-50 text-center">
                                            <div class="popular-img">
                                                <img src="assets/img/gallery/popular1.png" alt="">
                                            </div>
                                            <div class="popular-caption">
                                                <h3><a href="#">Bly Microfiber / Microsuede 56" Armless Loveseat</a></h3>
                                                <span>$367</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                                        <div class="single-new-arrival mb-50 text-center">
                                            <div class="popular-img">
                                                <img src="assets/img/gallery/popular5.png" alt="">
                                            </div>
                                            <div class="popular-caption">
                                                <h3><a href="#">Bly Microfiber / Microsuede 56" Armless Loveseat</a></h3>
                                                <span>$367</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                                        <div class="single-new-arrival mb-50 text-center">
                                            <div class="popular-img">
                                                <img src="assets/img/gallery/popular6.png" alt="">
                                            </div>
                                            <div class="popular-caption">
                                                <h3><a href="#">Bly Microfiber / Microsuede 56" Armless Loveseat</a></h3>
                                                <span>$367</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                                        <div class="single-new-arrival mb-50 text-center">
                                            <div class="popular-img">
                                                <img src="assets/img/gallery/popular7.png" alt="">
                                            </div>
                                            <div class="popular-caption">
                                                <h3><a href="#">Bly Microfiber / Microsuede 56" Armless Loveseat</a></h3>
                                                <span>$367</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                                        <div class="single-new-arrival mb-50 text-center">
                                            <div class="popular-img">
                                                <img src="assets/img/gallery/popular8.png" alt="">
                                            </div>
                                            <div class="popular-caption">
                                                <h3><a href="#">Bly Microfiber / Microsuede 56" Armless Loveseat</a></h3>
                                                <span>$367</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                                        <div class="single-new-arrival mb-50 text-center">
                                            <div class="popular-img">
                                                <img src="assets/img/gallery/popular9.png" alt="">
                                            </div>
                                            <div class="popular-caption">
                                                <h3><a href="#">Bly Microfiber / Microsuede 56" Armless Loveseat</a></h3>
                                                <span>$367</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                                        <div class="single-new-arrival mb-50 text-center">
                                            <div class="popular-img">
                                                <img src="assets/img/gallery/popular2.png" alt="">
                                            </div>
                                            <div class="popular-caption">
                                                <h3><a href="#">Bly Microfiber / Microsuede 56" Armless Loveseat</a></h3>
                                                <span>$367</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                                        <div class="single-new-arrival mb-50 text-center">
                                            <div class="popular-img">
                                                <img src="assets/img/gallery/popular3.png" alt="">
                                            </div>
                                            <div class="popular-caption">
                                                <h3><a href="#">Bly Microfiber / Microsuede 56" Armless Loveseat</a></h3>
                                                <span>$367</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6">
                                        <div class="single-new-arrival mb-50 text-center">
                                            <div class="popular-img">
                                                <img src="assets/img/gallery/popular4.png" alt="">
                                            </div>
                                            <div class="popular-caption">
                                                <h3><a href="#">Bly Microfiber / Microsuede 56" Armless Loveseat</a></h3>
                                                <span>$367</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--? New Arrival End -->
                            <!--? Pagination Start -->
                            <nav>
                                <ul class="pagination pagination-lg">
                                    <li class="page-item"><a class="page-link" href="#">First</a></li>
                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                    <li class="page-item"><a class="page-link" href="#">Last</a></li>
                                </ul>
                            </nav>
                            <!--? Pagination End -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- listing-area Area End -->
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