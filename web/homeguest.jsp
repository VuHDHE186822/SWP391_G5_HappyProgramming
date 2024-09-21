<%-- 
    Document   : homeguest
    Created on : Sep 20, 2024, 1:06:46 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/home.css" rel="stylesheet">
        <style>
            .statistics {
                background-color: #f7f7f7;
                padding: 40px;
                text-align: center;
            }

            .statistics-title {
                font-size: 2rem;
                margin-bottom: 30px;
                font-weight: bold;
            }

            .statistics-cards {
                display: flex;
                justify-content: center;
                gap: 50px;
            }

            .stat-card {
                background-color: #ffffff;
                border-radius: 10px;
                padding: 20px;
                width: 300px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }

            .view {
                transition: all 1s ease;
                font-weight: 600;
            }

            .view:hover {
                text-decoration: none;
                color: #0033cc;
            }

            .icon {
                font-size: 40px;
                color: #4CAF50;
            }

            .stat-number {
                font-size: 2rem;
                font-weight: bold;
                margin: 15px 0;
            }

            .stat-description {
                font-size: 1.2rem;
                color: #555555;
            }
        </style>
    </head>
    <body>

        <!-- HEADER -->
        <jsp:include page="header.jsp"/>

        <!-- MIDDLE -->
        <div class="content-middle">

            <!-- HEAD CONTENT MIDDLE -->
            <div class="header-content-middle">
                <!-- TEXT -->
                <h1>First time here with ???</h1>
                <h1>Explore our courses from ??? right away</h1>
                <p><a href="viewallcourse" class="view">View all courses now!</a></p>

            </div>

            <!-- SALE -->
            <div class="sale">
                <h1>SALE 30%</h1>
            </div>

            <!-- DASHBOARD -->
            <c:set var="mentors" value="${sessionScope.mentor}" />
            <c:set var="mentees" value="${sessionScope.mentee}" />
            <c:set var="courses" value="${sessionScope.course}" />
            <div class="statistics">
                <h2 class="statistics-title">SOME STATISTICS ABOUT US</h2>
                <div class="statistics-cards">
                    <div class="stat-card">
                        <i class="icon fa fa-users"></i>
                        <p class="stat-number">${fn:length(mentees)}</p>
                        <p class="stat-description">NUMBER OF MENTEES</p>
                    </div>
                    <div class="stat-card">
                        <i class="icon fa fa-book"></i>
                        <p class="stat-number">${fn:length(courses)}</p>
                        <p class="stat-description">NUMBER OF COURSES</p>
                    </div>
                    <div class="stat-card">
                        <i class="icon fa fa-chalkboard-teacher"></i>
                        <p class="stat-number">${fn:length(mentors)}</p>
                        <p class="stat-description">NUMBER OF MENTORS</p>
                    </div>
                </div>
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
    </body>
</html>
