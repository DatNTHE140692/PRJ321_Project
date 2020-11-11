<%-- 
    Document   : filter
    Created on : Nov 10, 2020, 9:26:56 AM
    Author     : #Panda
--%>
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
                                        <h1 data-animation="fadeInUp" data-delay=".4s" >Search</h1>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="home">Home</a></li>
                                                <li class="breadcrumb-item"><a href="#">Search</a></li> 
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
                        <div class="col-xl-12 col-lg-12 col-md-9">
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
                                                <div class="col-xl-4 col-lg-4 col-md-3 col-sm-6">
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
                                        <label>Search Empty</label>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>    
        </main>
        <%@include file="components/js.jsp" %>
        <%@include file="components/footer.jsp" %>
        <script>
            const params = new Map();
            params.set('keyword', '${requestScope.keyword}');
            params.set('category', ${requestScope.category});
            params.set('pFrom', ${requestScope.priceFrom});
            params.set('pTo', ${requestScope.priceTo});
            function paggerBasic(paggerClass, pageIndex, totalPages, gap) {
                const pagger = document.getElementsByClassName(paggerClass);
                for (let i = 0; i < pagger.length; i++) {
                    const paggerEl = pagger[i];
                    if (pageIndex - gap > 1) {
                        const firstPagger = document.createElement('li');
                        firstPagger.setAttribute('class', 'page-item');
                        const firstPaggerLink = document.createElement('a');
                        firstPaggerLink.setAttribute('class', 'page-link');
                        link = '?';
                        for (var [key, value] of params) {
                            link += key + '=' + value + '&';
                        }
                        link += 'page=1';
                        firstPaggerLink.href = link;
                        firstPaggerLink.innerHTML = 'First';
                        firstPagger.appendChild(firstPaggerLink);
                        paggerEl.appendChild(firstPagger);
                    }
                    for (let j = pageIndex - gap; j < pageIndex; j++) {
                        if (j > 0) {
                            const numPagger = document.createElement('li');
                            numPagger.setAttribute('class', 'page-item');
                            const numPaggerLink = document.createElement('a');
                            numPaggerLink.setAttribute('class', 'page-link');
                            link = '?';
                            for (var [key, value] of params) {
                                link += key + '=' + value + '&';
                            }
                            link += 'page=' + j;
                            numPaggerLink.href = link;
                            numPaggerLink.innerHTML = j;
                            numPagger.appendChild(numPaggerLink);
                            paggerEl.appendChild(numPagger);
                        }
                    }
                    const currentPagger = document.createElement('li');
                    currentPagger.setAttribute('class', 'page-item active');
                    const currentPaggerLink = document.createElement('a');
                    currentPaggerLink.setAttribute('class', 'page-link');
                    currentPaggerLink.innerHTML = pageIndex + '<span class="sr-only">(current)</span>';
                    currentPagger.appendChild(currentPaggerLink);
                    paggerEl.appendChild(currentPagger);
                    for (let j = pageIndex + 1; j < pageIndex + gap + 1; j++) {
                        if (j <= totalPages) {
                            const numPagger = document.createElement('li');
                            numPagger.setAttribute('class', 'page-item');
                            const numPaggerLink = document.createElement('a');
                            numPaggerLink.setAttribute('class', 'page-link');
                            link = '?';
                            for (var [key, value] of params) {
                                link += key + '=' + value + '&';
                            }
                            link += 'page=' + j;
                            numPaggerLink.href = link;
                            numPaggerLink.innerHTML = j;
                            numPagger.appendChild(numPaggerLink);
                            paggerEl.appendChild(numPagger);
                        }
                    }
                    if (pageIndex + gap < totalPages) {
                        const lastPagger = document.createElement('li');
                        lastPagger.setAttribute('class', 'page-item');
                        const lastPaggerLink = document.createElement('a');
                        lastPaggerLink.setAttribute('class', 'page-link');
                        link = '?';
                        for (var [key, value] of params) {
                            link += key + '=' + value + '&';
                        }
                        link += 'page=' + totalPages;
                        lastPaggerLink.href = link;
                        lastPaggerLink.innerHTML = 'Last';
                        lastPagger.appendChild(lastPaggerLink);
                        paggerEl.appendChild(lastPagger);
                    }
                }
            }
        </script>
        <script>paggerBasic('pagination', ${requestScope.pageIndex}, ${requestScope.totalPages}, 2);</script>
    </body>
</html>
