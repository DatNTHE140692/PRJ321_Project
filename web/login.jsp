<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="vi">
    <!-- head tag import Start -->
    <%@ include file="components/head.jsp" %>
    <!-- head tag import End -->
    <body>
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

        <main class="login-bg">
            <!-- login Area Start -->
            <div class="login-form-area">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-7 col-lg-8">
                            <form class="login-form" action="login" method="post">
                                <!-- Login Heading -->
                                <div class="login-heading">
                                    <span>Login</span>
                                    <p>Enter Login details to get access</p>
                                </div>
                                <!-- Single Input Fields -->
                                <div class="input-box">
                                    <div class="single-input-fields">
                                        <label>Username:</label>
                                        <input type="text" name="username" placeholder="Enter Username">
                                    </div>
                                    <div class="single-input-fields">
                                        <label>Password:</label>
                                        <input type="password" name="password" placeholder="Enter Password">
                                    </div>
                                    <c:if test="${requestScope.errorMsg ne null}">
                                        <div class="single-input-fields">
                                            <label for="incorrect" style="color: red">${requestScope.errorMsg}</label>
                                        </div>
                                    </c:if>
                                </div>
                                <!-- form Footer -->
                                <div class="login-footer">
                                    <p>Don't have an account? <a href="register">Sign Up</a> here</p>
                                    <button class="submit-btn3" type="submit">Login</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- login Area End -->
        </main>

        <!-- js import Start -->
        <%@ include file="components/js.jsp" %>
        <!-- js import End -->
    </body>
</html>