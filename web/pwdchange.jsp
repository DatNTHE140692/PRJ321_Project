<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="components/head.jsp" %>
    <body>
        <%@include file="components/header.jsp" %>
        <main>
            <!--? slider Area Start-->
            <div class="slider-area ">
                <div class="slider-active">
                    <div class="single-slider hero-overly2  slider-height2 d-flex align-items-center slider-bg2">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-6 col-lg-8 col-md-8">
                                    <div class="hero__caption hero__caption2">
                                        <h1 data-animation="fadeInUp" data-delay=".4s" >Change Password</h1>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                <li class="breadcrumb-item"><a href="#">Change Password</a></li> 
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
            <div class="category-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-8">
                            <div class="category-listing">
                                <div class="categories-wrapper">
                                    <h2><i class="fa fa-key" aria-hidden="true"></i> Change Password</h2>
                                    <form action="change-password" method="post">
                                        <div class="mt-20" id="change-pass">
                                            <div class="mt-10">
                                                <label for="password">Old Password : </label>
                                                <input type="password" name="old-password" id="old-password" placeholder="Old Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Old Password'" required class="single-input" onkeyup="onTypingPassword()">
                                            </div>
                                            <div class="mt-10">
                                                <label for="password">New Password : </label>
                                                <input type="password" name="new-password" id="new-password" placeholder="New Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'New Password'" required class="single-input" onkeyup="onTypingPassword()">
                                            </div>
                                            <div class="mt-10">
                                                <label for="password">Re-New Password : </label>
                                                <input type="password" name="new-password" id="renew-password" placeholder="ReNew Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'ReNew Password'" required class="single-input" onkeyup="onTypingPassword()">
                                            </div>
                                            <div class="mt-10" id="message"></div>
                                        </div>
                                        <div class="mt-20">
                                            <input type="submit" value="Change Password" class="btn hero-btn" />
                                        </div>
                                    </form> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="components/js.jsp" %>
        <script>
            function onTypingPassword() {
                const password = document.getElementById('new-password');
                const repassword = document.getElementById('renew-password');
                const message = document.getElementById('message');
                if (password.value === '' && repassword.value === '') {
                    message.innerText = '';
                } else {
                    if (password.value !== repassword.value) {
                        message.innerText = "Password & RePassword are not the same!";
                    } else {
                        message.innerText = "";
                    }
                }
            }
        </script>
    </body>
</html>
