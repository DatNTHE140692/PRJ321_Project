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
                        <div class="col-xl-4 col-lg-4 col-md-3">
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
                                            <input type="text" name="keyword" class="col-9 search_input" placeholder="Product Name" required />
                                            <button class="col-3 search_btn"><i class="fa fa-search" aria-hidden="true"></i></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Job Search start -->
                            <div class="category-listing mb-50">
                                <div class="categories-wrapper">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="small-tittle">
                                                <h2><i class="fas fa-filter"></i> Filter Product</h2>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 mt-10">
                                        <form action="filter" class="row" id="store_search">
                                            <div class="form-group mb-20 w-100">
                                                <label for="name">Name:</label>
                                                <input type="text" name="keyword" class="search_input w-100" placeholder="Product Name"/>
                                            </div>
                                            <label for="category">Category:</label>
                                            <div class="select-categories w-100">
                                                <select name="category">
                                                    <option value="-1">All</option>
                                                    <c:forEach items="${requestScope.categories}" var="c">
                                                        <option value="${c.id}">${c.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <div class="mb-20 w-100">
                                                <label for="category">Price From:</label>
                                                <input type="number" name="pFrom" class="search_input w-100" min="0" value="0"/>
                                            </div>
                                            <div class="mb-20 w-100">
                                                <label for="category">Price To:</label>
                                                <input type="number" name="pTo" class="search_input w-100" min="0" value="500"/>
                                            </div>
                                            <button class="genric-btn info w-100" type="submit">SEARCH</button>
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
                                                <h2><i class="fa fa-bars" aria-hidden="true"></i> Product Categories</h2>
                                            </div>
                                        </div>
                                        <div class="col-12 mt-20">
                                            <ul class="unordered-list">
                                                <li><a href="store" style="color: black">All</a></li>
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
                        <div class="col-xl-8 col-lg-8 col-md-9">
                            <c:choose>
                                <c:when test="${not empty requestScope.products}">
                                    <!--? Pagination Start -->
                                    <div class="col-lg-12">
                                        <div class="count-job mb-20">
                                            <span>${requestScope.totalRecords} Product(s) found</span>
                                            <nav><ul class="pagination"></ul></nav>
                                        </div>
                                    </div>
                                    <!--? Pagination End -->
                                    <!--? New Arrival Start -->
                                    <div class="new-arrival new-arrival3">
                                        <div class="row">
                                            <c:forEach items="${requestScope.products}" var="p">
                                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                                    <div class="single-new-arrival mb-50 text-center">
                                                        <div class="popular-img">
                                                            <a href="product?id=${p.id}">
                                                                <img src="${p.thumbnail}" alt="">
                                                            </a>
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
                                    <!--? New Arrival End -->
                                    <!--? Pagination Start -->
                                    <nav><ul class="pagination"></ul></nav>
                                    <!--? Pagination End -->
                                </c:when>
                                <c:otherwise>
                                    <div class="row">
                                        <label>Category have no product!</label>
                                    </div>
                                </c:otherwise>
                            </c:choose>
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
        <script src="assets/js/pagger.js"></script>
        <c:choose>
            <c:when test="${requestScope.cid eq null}">
                <script>paggerBasic('pagination', ${requestScope.pageIndex}, ${requestScope.totalPages}, 2);</script>
            </c:when>
            <c:otherwise>
                <script>pagger('pagination', 'cid', ${requestScope.cid}, ${requestScope.pageIndex}, ${requestScope.totalPages}, 2);</script>
            </c:otherwise>
        </c:choose>
    </body>
</html>