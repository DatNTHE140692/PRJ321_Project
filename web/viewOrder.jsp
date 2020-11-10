<%-- 
    Document   : viewOrder
    Created on : Nov 9, 2020, 11:03:31 PM
    Author     : #Panda
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="vi">
    <%@ include file="components/head.jsp" %>
    <body>
        <%@ include file="components/header.jsp" %>
        <main>
            <section class="section-padding40">
                <div class="container">
                    <div class="cart_inner">
                        <a href="history" class="btn"><i class="fas fa-angle-left"></i> Orders History</a>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">Product</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="total" value="${0}" />
                                    <c:forEach items="${requestScope.products}" var="p">
                                        <tr>
                                            <td>
                                                <div class="media">
                                                    <div class="d-flex">
                                                        <a href="product?id=${p.id}"><img src="${p.thumbnail}" alt="" class="w-100"></a>
                                                    </div>
                                                    <div class="media-body">
                                                        <p><h5><a href="product?id=${p.id}">${p.name}</a></h5></p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <h5>$${p.price}</h5>
                                            </td>
                                            <td>
                                                <div class="product_count">
                                                    <input type="number" value="${p.quantity}" min="1" name="quantity" disabled="">
                                                </div>
                                            </td>
                                            <td>
                                                <h5>$<fmt:formatNumber maxFractionDigits="3" value="${p.price * p.quantity}"/></h5>
                                                <c:set var="total" value="${total + p.price * p.quantity}" />
                                            </td>
                                        </tr>
                                    </c:forEach>
                                        <tr>
                                            <td>Shipping:</td>
                                            <td></td>
                                            <td></td>
                                            <td>$50</td>
                                            <td></td>
                                        </tr>
                                    <tr>
                                        <td>
                                            <h5>Cart total:</h5>
                                        </td>
                                        <td></td>
                                        <td></td>
                                        <td>
                                            <h5>$<fmt:formatNumber maxFractionDigits="3" value="${total + 50}"/></h5>
                                        </td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <%@ include file="components/footer.jsp" %>
        <div id="back-top" >
            <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
        </div>
        <%@ include file="components/js.jsp" %>
    </body>
</html>
