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
                                        <h1 data-animation="fadeInUp" data-delay=".4s" >My Profile</h1>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                <li class="breadcrumb-item"><a href="#">My Profile</a></li> 
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
                                    <div class="small-tittle">
                                        <h1><i class="fa fa-address-card" aria-hidden="true"></i> User Profile</h1>
                                    </div>
                                    <div class="text-center">
                                        <img src="${sessionScope.user.avatarURL}" alt="avatar" width="250" height="250" />
                                    </div>
                                    <form action="profile" method="post">
                                        <div class="mt-20">
                                            <label for="name">Avatar URL: </label>
                                            <input type="text" name="avatar" placeholder="Your avatar" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your avatar'" class="single-input" value="${sessionScope.user.avatarURL}">
                                        </div>
                                        <div class="mt-20">
                                            <label for="name">Your name : </label>
                                            <input type="text" name="name" placeholder="Your Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your name'" required class="single-input" value="${sessionScope.user.fullname}">
                                        </div>
                                        <div class="mt-20">
                                            <label for="name">Username : </label>
                                            <input type="text" name="username" placeholder="UserName" onfocus="this.placeholder = ''" onblur="this.placeholder = 'UserName'" readonly class="single-input" value="${sessionScope.user.username}">
                                        </div>
                                        <div class="mt-20">
                                            <label for="name">Email : </label>
                                            <input type="email" name="email" placeholder="Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'" required class="single-input" value="${sessionScope.user.email}">
                                        </div>
                                        <div class="mt-20">
                                            <label for="name">Phone Number : </label>
                                            <input type="text" name="phone" placeholder="Phone Number" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Phone Number'" required class="single-input" value="${sessionScope.user.phonenumber}">
                                        </div>
                                        <div class="mt-20">
                                            <label for="name">Address : </label>
                                            <input type="text" name="address" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'" required class="single-input" value="${sessionScope.user.address}">
                                        </div>
                                        <div class="mt-20">
                                            <input type="submit" value="Save" class="btn hero-btn" />
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
    </body>
</html>
