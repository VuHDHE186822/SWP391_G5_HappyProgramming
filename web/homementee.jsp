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
                <div class="text-overlay">
                    <!-- TEXT -->
                    <h1 style="margin-bottom: 20px; text-transform: capitalize">Welcome back, want to discover new thing?</h1>
                    <!-- SEARCH BAR -->
                    <form action="allCourse" method="get" class="search-bar">
                        <input type="hidden" name="search" value="searchByName"/>
                        <input type="text" class="input-submit" placeholder="Search a course" name="keyword">
                        <input type="submit" class="button-submit" value="Search">
                    </form>
                </div>
                <img src="img/banner.jpg" alt="alt"/>
            </div>

            <!-- MOST PARTICIPANTS COURSE SLIDE -->
            <div class="best-course-list">
                <div class="best-course-heading">MOST PARTICIPANTS COURSE</div>
                <c:forEach items="${sortedCourses}" var="courseInfo" varStatus="status">
                    <c:set var="courseId" value="${courseInfo[0]}" />
                    <c:set var="menteeCount" value="${courseInfo[1]}" />

                    <c:forEach items="${course}" var="c" begin="0" end="3">
                        <c:if test="${c.courseId == courseId}">
                            <div class="best-course-card">
                                <h3 class="best-course-title">${c.courseName}</h3> 
                                <div class="ranking">
                                    <c:choose>
                                        <c:when test="${status.index == 0}">
                                            <span class="gold-rank">1</span>
                                        </c:when>
                                        <c:when test="${status.index == 1}">
                                            <span class="silver-rank">2</span>
                                        </c:when>
                                        <c:when test="${status.index == 2}">
                                            <span class="bronze-rank">3</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="default-rank">${status.index + 1}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </div>

            <!-- MENTOR SLIDE -->
            <div class="mentor-content">
                <div class="mentor-content-heading">
                    <div class="mentor-heading">SEE OUR MENTORS</div>
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
            </div>

            <!-- COURSES SLIDE -->
            <div class="course-content">
                <div class="course-content-heading">
                    <div class="course-heading">COURSES</div>
                </div>
                <c:if test="${not empty sessionScope.course}">
                    <div class="row course-cards" id="course-container">
                        <c:forEach items="${sessionScope.course}" var="c" varStatus="status">
                            <a href="viewcourse?courseId=${c.courseId}" class="col-md-5 course-card"
                               style="display: ${status.index < 4 ? 'block' : 'none'};">
                                <div class="course-body">
                                    <div class="course-text">
                                        <div class="course-name">${c.courseName}</div>
                                        <div class="course-body-text">${fn:substring(c.courseDescription, 0, 140)}
                                            <c:if test="${fn:length(c.courseDescription) > 140}">...</c:if>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                        </c:forEach>
                    </div>
                </c:if>
                <a href="#" class="more-course-button" id="more-courses-button" onclick="showMoreCourses(event)">More Courses</a>
            </div>

            <script>
                let coursesShown = 4;

                function showMoreCourses(event) {
                    event.preventDefault();
                    const allCourses = document.querySelectorAll('.course-card');
                    const totalCourses = allCourses.length;
                    const moreCoursesButton = document.getElementById('more-courses-button');
                    if (coursesShown < 8) {
                        for (let i = coursesShown; i < coursesShown + 4 && i < totalCourses; i++) {
                            allCourses[i].style.display = 'block';
                        }
                        coursesShown += 4;
                        moreCoursesButton.textContent = 'View All Courses';
                    } else {
                        window.location.href = 'allcourse.jsp';
                    }
                }
            </script>

            <!-- FOOTER -->
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
