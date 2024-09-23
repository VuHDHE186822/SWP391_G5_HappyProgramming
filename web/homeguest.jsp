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
                margin-bottom: 30px;
            }

            .stat-card {
                background-color: #ffffff;
                border-radius: 10px;
                padding: 20px;
                width: 300px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            }

            .view {
                transition: all 0.3s ease;
                font-weight: 600;
                background-color: white;
                padding: 10px;
                border-radius: 15px;
                color: black;
            }

            .view:hover {
                text-decoration: none;
                background-color: #541371;
                color: white;
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
                <div class="text-overlay">
                    <!-- TEXT -->
                    <h1 style="text-transform: capitalize">First time here with us?</h1>
                    <h1 style="margin-bottom: 20px; text-transform: capitalize">Explore our courses right away</h1>
                    <form action="allCourse" method="get" class="search-bar">
                        <input type="text" class="input-submit" placeholder="Search a course" name="search">
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
                            <a href="viewcourse?courseId=${c.courseId}" class="best-course-card">
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
                            </a>
                        </c:if>
                    </c:forEach>
                </c:forEach>
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
    </body>
</html>
