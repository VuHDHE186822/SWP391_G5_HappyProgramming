<%-- 
    Document   : homeuser.jsp
    Created on : Sep 18, 2024, 4:25:30 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home</title>
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/home.css" rel="stylesheet">
    </head>
    <body>

        <!-- HEADER -->
        <jsp:include page="header.jsp"/>

        <!-- MIDDLE -->
        <div class="content-middle">

            <!-- HEAD CONTENT MIDDLE -->
            <div class="header-content-middle">
                <!-- TEXT -->
                <h1>In ???</h1>
                <h1>You can learn everything</h1>
                <p>The most effective way for you to gain more knowledge and capacity in every field. Join the completely new learning method from ??? now!</p>


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

            <!-- MENTOR SLIDE -->
            <div class="mentor-content">
                <div class="mentor-content-heading">
                    <div class="mentor-heading">SEE ??? MENTORS</div>
                </div>
                <c:if test="${not empty sessionScope.mentor}">
                    <div class="mentor-cards">
                        <c:forEach items="${sessionScope.mentor}" var="m" begin="0" end="3">
                            <div class="mentor-card">
                                <img class="mentor-image-icon" alt="" src="https://zpsocial2-f4-org.zadn.vn/9790ea297aa49bfac2b5.jpg">
                                <div class="mentor-body">
                                    <div class="mentor-text">
                                        <div style="color: black">${m.lastName} ${m.firstName}</div>
                                        <c:set var="courseCount" value="0" />
                                        <c:forEach items="${sessionScope.participate}" var="p">
                                            <c:if test="${p.username == m.username}">
                                                <c:forEach items="${sessionScope.course}" var="c">
                                                    <c:if test="${c.courseId == p.courseId}">
                                                        <c:if test="${courseCount < 2}">
                                                            <a href="viewcourse?courseId=${c.courseId}" class="mentor-course"><p>${c.courseName}</p></a>
                                                                    <c:set var="courseCount" value="${courseCount + 1}"/>
                                                                </c:if>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <a href="#" class="more-mentor-button">More Mentors</a>
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

            <!-- FOOTER -->
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
