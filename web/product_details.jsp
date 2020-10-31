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
                        <div class="col-lg-5">
                            <div class="flexslider">
                                <ul class="slides">
                                    <li data-thumb="assets/img/gallery/product-details1.png">
                                        <img src="assets/img/gallery/product-details1.png" class="w-100" />
                                    </li>
                                    <li data-thumb="assets/img/gallery/product-details2.png">
                                        <img src="assets/img/gallery/product-details2.png" class="w-100" />
                                    </li>
                                    <li data-thumb="assets/img/gallery/product-details3.png">
                                        <img src="assets/img/gallery/product-details3.png" class="w-100" />
                                    </li>
                                    <li data-thumb="assets/img/gallery/product-details4.png">
                                        <img src="assets/img/gallery/product-details4.png" class="w-100" />
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-5 offset-lg-1">
                            <div class="s_product_text">
                                <h3>Faded SkyBlu Denim Jeans</h3>
                                <h2>$149.99</h2>
                                <ul class="list">
                                    <li>
                                        <a class="active" href="#">
                                            <span>Category</span> : Household</a>
                                    </li>
                                    <li>
                                        <a href="#"> <span>Availibility</span> : In Stock</a>
                                    </li>
                                </ul>
                                <p>
                                    Mill Oil is an innovative oil filled radiator with the most modern technology. If you are looking for something that can make your interior look awesome, and at the same time.
                                </p>
                                <div class="card_area">
                                    <div class="product_count d-inline-block">
                                        <span class="inumber-decrement"> <i class="ti-minus"></i></span>
                                        <input class="input-number" type="text" value="1" min="0" max="10">
                                        <span class="number-increment"> <i class="ti-plus"></i></span>
                                    </div>
                                    <div class="add_to_cart">
                                        <a href="#" class="btn">add to cart</a>
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
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active show" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home"
                               aria-selected="true">Description</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact"
                               aria-selected="false">Comments</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade active show" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <p>
                                Beryl Cook is one of Britainâ€™s most talented and amusing artists
                                .Berylâ€™s pictures feature women of all shapes and sizes enjoying
                                themselves .Born between the two world wars, Beryl Cook eventually
                                left Kendrick School in Reading at the age of 15, where she went
                                to secretarial school and then into an insurance office. After
                                moving to London and then Hampton, she eventually married her next
                                door neighbour from Reading, John Cook. He was an officer in the
                                Merchant Navy and after he left the sea in 1956, they bought a pub
                                for a year before John took a job in Southern Rhodesia with a
                                motor company. Beryl bought their young son a box of watercolours,
                                and when showing him how to use it, she decided that she herself
                                quite enjoyed painting. John subsequently bought her a childâ€™s
                                painting set for her birthday and it was with this that she
                                produced her first significant work, a half-length portrait of a
                                dark-skinned lady with a vacant expression and large drooping
                                breasts. It was aptly named â€˜Hangoverâ€™ by Berylâ€™s husband and
                            </p>
                            <p>
                                It is often frustrating to attempt to plan meals that are designed
                                for one. Despite this fact, we are seeing more and more recipe
                                books and Internet websites that are dedicated to the act of
                                cooking for one. Divorce and the death of spouses or grown
                                children leaving for college are all reasons that someone
                                accustomed to cooking for more than one would suddenly need to
                                learn how to adjust all the cooking practices utilized before into
                                a streamlined plan of cooking that is more efficient for one
                                person creating less
                            </p>
                        </div>
                        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                            <div class="row">
                                <div class="col-lg-12 mb-20">
                                    <div class="review_box">
                                        <h4>Post a comment</h4>
                                        <form class="row contact_form" action="contact_process.php" method="post" id="contactForm"
                                              novalidate="novalidate">
                                            <textarea class="col-lg-9" name="message" id="message" rows="1"
                                                      placeholder="Message"></textarea>
                                            <button type="submit" value="submit" class="btn col-lg-3">
                                                Submit Now
                                            </button>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="comment_list">
                                        <div class="review_item">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img src="assets/img/gallery/review-1.png" alt="" />
                                                </div>
                                                <div class="media-body">
                                                    <h4>Blake Ruiz</h4>
                                                    <h5>12th Feb, 2017 at 05:56 pm</h5>
                                                    <a class="reply_btn" href="#">Reply</a>
                                                </div>
                                            </div>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                sed do eiusmod tempor incididunt ut labore et dolore magna
                                                aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                                                ullamco laboris nisi ut aliquip ex ea commodo
                                            </p>
                                        </div>
                                        <div class="review_item">
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img src="assets/img/gallery/review-3.png" alt="" />
                                                </div>
                                                <div class="media-body">
                                                    <h4>Blake Ruiz</h4>
                                                    <h5>12th Feb, 2017 at 05:56 pm</h5>
                                                    <a class="reply_btn" href="#">Reply</a>
                                                </div>
                                            </div>
                                            <p>
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                sed do eiusmod tempor incididunt ut labore et dolore magna
                                                aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                                                ullamco laboris nisi ut aliquip ex ea commodo
                                            </p>
                                        </div>
                                    </div>
                                </div>
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
                        controlNav: "thumbnails",
                        directionNav: false
                  });
            });
        </script>
    </body>
</html>