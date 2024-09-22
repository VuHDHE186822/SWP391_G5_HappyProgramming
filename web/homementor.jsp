<%-- 
   Document   : homementor
   Created on : Sep 20, 2024, 3:35:01 PM
   Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/home.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- HEADER -->
        <jsp:include page="header.jsp"/>

        <!-- MIDDLE -->
        <div class="content-middle">

            <!-- HEAD CONTENT MIDDLE -->
            <div class="header-content-middle">
                <!-- TEXT -->
                <h1>Empower Your Journey</h1> 
                <h1>Learning Made Accessible</h1> 
                <p>Discover the most effective path to enhance your knowledge and skills across various fields. Join us at FUNiX for an innovative learning experience that transforms the way you teach and inspire others!</p>

                <!-- SEARCH BAR -->
                <form action="#" class="search-bar">
                    <input type="text" class="input-submit" placeholder="Search a course" name="search">
                    <input type="submit" class="button-submit" value="Search">
                </form>
            </div>

            <!-- SALE -->
            <div class="sale">
                <h1>SALE 30%</h1>
            </div>


            <!-- COURSES SLIDE -->
            <div class="course-content">
                <div class="course-content-heading">
                    <div class="course-heading">??? COURSES</div>
                </div>
                <c:if test="${not empty sessionScope.course}">
                    <div class="row course-cards">
                        <c:forEach items="${sessionScope.course}" var="c" begin="0" end="3">
                            <a href="viewcourse?courseId=${c.courseId}" class="col-md-5 course-card">
                                <div class="course-body">
                                    <div class="course-text">
                                        <div>${c.courseName}</div>
                                        <div class="course-body-text">${fn:substring(c.courseDescription, 0, 140)}<c:if test="${fn:length(c.courseDescription) > 140}">...</c:if></div>
                                        </div>
                                    </div>
                                </a>
                        </c:forEach>
                    </div>
                </c:if>
                <a href="#" class="more-course-button">More Courses</a>
            </div>

            <!-- SPLIT -->
            <div style="height: 100px; background-color: #edf2fa"></div>

            <!-- MY COURSES SLIDE -->
            <div class="mycourse-content">
                <div class="mycourse-content-heading">
                    <div class="mycourse-heading">YOUR CURRENT COURSES</div>
                </div>
                <c:set var="u" value="${sessionScope.user}"/>
                <div class="row mycourse-cards">
                    <c:forEach items="${sessionScope.participate}" var="p">
                        <c:if test="${p.username == u.username}">
                            <c:forEach items="${sessionScope.course}" var="c">
                                <c:if test="${c.courseId == p.courseId}">
                                    <a href="viewcourse?courseId=${c.courseId}" class="col-md-5 course-card">
                                        <div class="mycourse-body">
                                            <div class="mycourse-text">
                                                <div>${c.courseName}</div>
                                                <div class="mycourse-body-text">${fn:substring(c.courseDescription, 0, 120)}<c:if test="${fn:length(c.courseDescription) > 120}">...</c:if></div>
                                                </div>
                                            </div>
                                        </a>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="col-md-12">
                    <ul class="listPage"></ul>
                </div>
            </div>
            <script>
                let thisPage = 1;
                let limit = 4;
                let list = document.querySelectorAll('.mycourse-card');

                function loadItem() {
                    let beginGet = limit * (thisPage - 1);
                    let endGet = limit * thisPage - 1;
                    list.forEach((item, key) => {
                        item.style.display = (key >= beginGet && key <= endGet) ? 'block' : 'none';
                    });
                    listPage();
                }

                function listPage() {
                    let count = Math.ceil(list.length / limit);
                    document.querySelector('.listPage').innerHTML = '';
                    for (let i = 1; i <= count; i++) {
                        let newPage = document.createElement('li');
                        newPage.innerText = i;
                        if (i === thisPage) {
                            newPage.classList.add('active');
                        }
                        newPage.setAttribute('onclick', "changePage(" + i + ")");
                        document.querySelector('.listPage').appendChild(newPage);
                    }
                }

                function changePage(i) {
                    thisPage = i;
                    loadItem();
                }

                document.addEventListener('DOMContentLoaded', function () {
                    loadItem();
                });
            </script>

            <!-- FOOTER -->
            <jsp:include page="footer.jsp"/>
    </body>
</html>
