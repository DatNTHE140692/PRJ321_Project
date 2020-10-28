<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ? Preloader Start -->
<div id="preloader-active">
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text">
                <img src="assets/img/logo/loder.png" alt="">
            </div>
        </div>
    </div>
</div>
<!-- Preloader Start-->
<header>
    <!-- Header Start -->
    <div class="header-area">
        <div class="main-header header-sticky">
            <div class="container-fluid">
                <div class="row menu-wrapper align-items-center justify-content-between">
                    <div class="header-left d-flex align-items-center">
                        <!-- Logo -->
                        <div class="logo">
                            <a href="index"><img src="assets/img/logo/logo.png" alt=""></a>
                        </div>
                        <!-- Logo-2 -->
                        <div class="logo2">
                            <a href="index"><img src="assets/img/logo/logo2.png" alt=""></a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                    <li><a href="home">Home</a></li> 
                                    <li><a href="shop">Product</a></li>
                                    <li><a href="contact">Contact</a></li>
                                </ul>
                            </nav>
                        </div>   
                    </div>
                    <div class="header-right1 d-flex align-items-center">
                        <div class="search">
                            <ul class="d-flex align-items-center">
                                <li>
                                    <!-- Search Box -->
                                    <form action="#" class="form-box f-right ">
                                        <input type="text" name="Search" placeholder="Search products">
                                        <div class="search-icon">
                                            <i class="ti-search"></i>
                                        </div>
                                    </form>
                                </li>
                                <li>
                                    <c:choose>
                                        <c:when test="${sessionScope.account eq null}">
                                            <div class="account-btn">
                                                <a href="login" class="genric-btn primary medium" target="_blank">Login</a>
                                                <span>|</span>
                                                <a href="register" class="genric-btn success medium" target="_blank">Register</a>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="main-menu d-none d-lg-block">
                                                <nav>
                                                    <ul id="navigation">
                                                        <li>
                                                            <a class="account-btn">${sessionScope.account.fullname}</a>
                                                            <ul class="submenu">
                                                                <li><a href="logout">Log Out!</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                                <li>
                                    <div class="card-stor">
                                        <img src="assets/img/icon/card.svg" alt="">
                                        <span>0</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
</header>
