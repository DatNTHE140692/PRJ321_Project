<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="vi">
    <!-- head tag import Start -->
    <%@ include file="components/head.jsp" %>
    <!-- head tag import End -->
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
                                        <h1 data-animation="fadeInUp" data-delay=".4s" >Product details</h1>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                <li class="breadcrumb-item"><a href="#">Product details</a></li> 
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
            <!--? Single Product Area Start-->
            <div class="product_image_area section-padding40">
                <div class="container">
                    <div class="row s_product_inner">
                        <div class="col-lg-6">
                            <div class="flexslider">
                                <ul class="slides">
                                    <c:forEach items="${requestScope.product.images}" var="i">
                                        <li data-thumb="${i.imgSrc}">
                                            <img src="${i.imgSrc}" class="w-100" />
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="s_product_text">
                                <h3>${requestScope.product.name}</h3>
                                <h2>$${requestScope.product.price}</h2>
                                <ul class="list">
                                    <li>
                                        Category:
                                        <c:forEach items="${requestScope.product.categories}" var="c">
                                            <a class="active" href="#">${c.name} </a>
                                        </c:forEach>
                                    </li>
                                    <li>
                                        Available:
                                        <a href="#">${requestScope.product.available ? "In Stock" : "Out Of Stock"}</a>
                                    </li>
                                </ul>
                                <p>${requestScope.product.shortDesc}</p>
                                <div class="card_area">
                                    <div class="product_count d-inline-block">
                                        <span class="inumber-decrement"> <i class="ti-minus"></i></span>
                                        <input class="input-number" type="text" value="1" min="0" max="10">
                                        <span class="number-increment"> <i class="ti-plus"></i></span>
                                    </div>
                                    <div class="add_to_cart">
                                        <a href="#" class="btn"><i class="fas fa-cart-plus"></i> add to cart</a>
                                    </div>
                                    <div class="social_icon">
                                        <a href="#" class="fb"><i class="ti-facebook"></i></a>
                                        <a href="#" class="tw"><i class="ti-twitter-alt"></i></a>
                                        <a href="#" class="li"><i class="ti-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Single Product Area End-->
            <!--? Product Description Area Start-->
            <section class="product_description_area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 mb-25">
                            <h3 class="border_bottom_title mb-30"><span>Product Description</span></h3>
                            ${requestScope.product.desc}
                        </div>
                        <div class="col-lg-12 mb-25">
                            <h3 class="border_bottom_title mb-30"><span>Post a comment</span></h3>
                            <div class="review_box">
                                <c:choose>
                                    <c:when test="${sessionScope.user eq null}">
                                        <div class="uix_welcomeSection">
                                            <div class="uix_welcomeSection__inner">
                                                <div class="media__container">
                                                    <div class="media__body">
                                                        <div class="uix_welcomeSection__title">Welcome to our Store</div>
                                                        <div class="uix_welcomeSection__text">Wanting to join the rest of our members? Feel free to sign in today.</div>
                                                        <a href="login" class="genric-btn info e-large">Sign in</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <form class="row contact_form" action="comment?pid=${param.id}" method="post" id="contactForm"
                                              novalidate="novalidate">
                                            <textarea class="col-lg-9" name="message" id="message" rows="1" placeholder="Message"></textarea>
                                            <button type="submit" value="submit" class="btn col-lg-3">Comment</button>
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <ul class="pagination"></ul>
                            <div class="comment_list mt-25 mb-25">
                                <c:forEach items="${requestScope.product.comments}" var="c">
                                    <div class="review_item">
                                        <div class="media">
                                            <div class="d-flex">
                                                <img src="${c.user.avatarURL}" alt="" width="70px" height="70px"/>
                                            </div>
                                            <div class="media-body">
                                                <h4>${c.user.fullname}</h4>
                                                <h5><fmt:formatDate pattern="dd-MMM-yyy HH:MM:ss" value = "${c.cmtDate}" /></h5>
                                            </div>
                                        </div>
                                        <p>${c.comment}</p>
                                    </div>
                                </c:forEach>
                            </div>
                            <ul class="pagination"></ul>
                        </div>
                    </div>
                </div>
                </div>
            </section>
            <!-- Product Description Area End-->
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
        <script src="./assets/js/jquery.min.js"></script>
        <script src="./assets/js/jquery.flexslider-min.js"></script>
        <script>
            // Can also be used with $(document).ready()
            $(window).load(function () {
                  $('.flexslider').flexslider({
                        animation: "slide",
                        controlNav: "thumbnails"
                  });
            });
        </script>
        <script src="assets/js/pagger.js"></script>
        <script>pagger('pagination', ${requestScope.pageIndex}, ${requestScope.totalPages}, 2, ${requestScope.pid});</script>
    </body>
</html>