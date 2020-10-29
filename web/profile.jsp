<%-- 
    Document   : profile
    Created on : Oct 28, 2020, 6:47:15 PM
    Author     : #Panda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="components/head.jsp" %>
    <body>
        <%@include file="components/header.jsp" %>
        <main>
            <div class="category-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-8">
                            <div class="category-listing">
                                <div class="categories-wrapper">
                                    <div class="small-tittle">
                                        <h2><i class="fa fa-address-card" aria-hidden="true"></i> User Profile</h2>
                                    </div>
                                    <form action="profile" method="post">
                                        <div class="mt-20">
                                            <label for="name">Your name : </label>
                                            <input type="text" name="name" placeholder="Your Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your name'" required class="single-input" value="${sessionScope.account.fullname}">
                                        </div>
                                        <div class="mt-20">
                                            <label for="name">Username : </label>
                                            <input type="text" name="username" placeholder="UserName" onfocus="this.placeholder = ''" onblur="this.placeholder = 'UserName'" readonly class="single-input" value="${sessionScope.account.username}">
                                        </div>
                                        <div class="mt-20">
                                            <label for="name">Email : </label>
                                            <input type="email" name="email" placeholder="Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email'" required class="single-input" value="${sessionScope.account.email}">
                                        </div>
                                        <div class="mt-20">
                                            <label for="name">Address : </label>
                                            <input type="text" name="address" placeholder="Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Address'" required class="single-input" value="${sessionScope.account.address}">
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
