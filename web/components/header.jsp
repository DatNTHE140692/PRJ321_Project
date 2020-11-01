<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<header>
    <!-- Header Start -->
    <div class="header-area">
        <div class="main-header header-sticky">
            <div class="container-fluid">
                <div class="row menu-wrapper align-items-center justify-content-between">
                    <div class="header-left d-flex align-items-center">
                        <!-- Logo -->
                        <div class="logo">
                            <a href="home"><img src="assets/img/logo/logo.png" alt=""></a>
                        </div>
                        <!-- Logo-2 -->
                        <div class="logo2">
                            <a href="home"><img src="assets/img/logo/logo2.png" alt=""></a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                    <li><a href="home"><i class="fas fa-home"></i> Home</a></li> 
                                    <li><a href="store"><i class="fas fa-store-alt"></i> Store</a></li>
                                    <li><a href="contact"><i class="fas fa-envelope-open-text"></i> Contact</a></li>
                                </ul>
                            </nav>
                        </div>   
                    </div>
                    <div class="header-right1 d-flex align-items-center">
                        <div class="search">
                            <ul class="d-flex align-items-center">
                                <li>
                                    <!-- Search Box -->
                                    <form action="search" class="form-box f-right ">
                                        <input type="text" name="search" placeholder="Search products">
                                        <div class="search-icon">
                                            <i class="ti-search"></i>
                                        </div>
                                    </form>
                                </li>
                                <li>
                                    <div class="main-menu d-none d-lg-block">
                                        <c:choose>
                                            <c:when test="${sessionScope.account eq null}">
                                                <div class="account-btn">
                                                    <a href="login" class="btn hero-btn"><i class="fas fa-sign-in-alt"></i> Login</a>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <nav>
                                                    <ul id="navigation">
                                                        <li>
                                                            <a class="account-btn"><img src="${sessionScope.account.avatarURL}" width="35" height="35" /> ${sessionScope.account.fullname}</a>
                                                            <ul class="submenu">
                                                                <li><a href="profile">My Profile</a></li>
                                                                <li><a href="change-password">Change Password</a></li>
                                                                <li><a href="cart">Cart</a></li>
                                                                <li><a href="logout">Log Out!</a></li>
                                                            </ul>
                                                        </li>
                                                    </ul>
                                                </nav>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
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
