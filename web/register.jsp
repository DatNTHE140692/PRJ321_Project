<!doctype html>
<html class="no-js" lang="vi">
    <!-- head import Start -->
    <%@ include file="components/head.jsp" %>
    <!-- head import End -->
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
        <!-- header end -->
        <main class="login-bg">
            <!-- Register Area Start -->
            <div class="register-form-area">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-6 col-lg-8">
                            <form class="register-form text-center" action="register" method="post">
                                <!-- Login Heading -->
                                <div class="register-heading">
                                    <span>Sign Up</span>
                                    <p>Create your account to get full access</p>
                                </div>
                                <!-- Single Input Fields -->
                                <div class="input-box">
                                    <div class="single-input-fields">
                                        <label>Username: </label>
                                        <input type="text" name="username" placeholder="Enter User Name" required>
                                    </div>
                                    <div class="single-input-fields">
                                        <label>Password: </label>
                                        <input type="password" name="password" placeholder="Enter Password" required>
                                    </div>
                                    <div class="single-input-fields">
                                        <label>Email Address: </label>
                                        <input type="email" name="email" placeholder="Enter Email" required>
                                    </div>
                                    <div class="single-input-fields">
                                        <label>Full Name: </label>
                                        <input type="text" name="fullname" placeholder="Enter Full Name" required>
                                    </div>
                                    <div class="single-input-fields">
                                        <label>Address: </label>
                                        <input type="text" name="address" placeholder="Enter Address" required>
                                    </div>
                                    <div class="single-input-fields">
                                        <label>Phone Number: </label>
                                        <input type="text" name="phone" placeholder="Enter Phone Number" required>
                                    </div>
                                </div>
                                <!-- form Footer -->
                                <div class="register-footer">
                                    <p> Already have an account? <a href="login.jsp"> Login</a> here</p>
                                    <button class="submit-btn3" type="submit">Sign Up</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Register Area End -->
        </main>
        <!-- js import Start -->
        <%@ include file="components/js.jsp" %>
        <!-- js import End -->
    </body>
</html>