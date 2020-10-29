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
                                    <h2><i class="fa fa-key" aria-hidden="true"></i> Change Password</h2>
                                    <form action="change-password" method="post">
                                        <div class="mt-20" id="change-pass">
                                            <div class="mt-10">
                                                <label for="password">Old Password : </label>
                                                <input type="password" name="old-password" id="old-password" placeholder="Old Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'New Password'" required class="single-input" onkeyup="onTypingPassword()">
                                            </div>
                                            <div class="mt-10">
                                                <label for="password">New Password : </label>
                                                <input type="password" name="new-password" id="new-password" placeholder="New Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'New Password'" required class="single-input" onkeyup="onTypingPassword()">
                                            </div>
                                            <div class="mt-10">
                                                <label for="password">Re-New Password : </label>
                                                <input type="password" name="new-password" id="renew-password" placeholder="New Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'New Password'" required class="single-input" onkeyup="onTypingPassword()">
                                            </div>
                                            <div class="mt-10" id="message"></div>
                                        </div>
                                        <div class="mt-20">
                                            <input type="submit" value="Change" class="btn hero-btn" />
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
                        message.innerText = "Incorrect";
                    } else {
                        message.innerText = "Correct";
                    }
                }
            }
        </script>
    </body>
</html>
