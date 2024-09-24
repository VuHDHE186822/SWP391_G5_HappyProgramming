<%-- 
    Document   : viewcourse
    Created on : Sep 21, 2024, 3:40:46 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="CSS/bootstrap.min.css" rel="stylesheet">
<link href="CSS/home.css" rel="stylesheet">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>viewcourse</title>
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/viewcourse.css" rel="stylesheet">
    </head>
    <body>

        <!-- HEADER -->
        <jsp:include page="header.jsp"/>

        <!-- DESCRIPTION -->
        <div class="description">
            <c:if test="${not empty sessionScope.courseDetail}">
                <c:set var="cD" value="${sessionScope.courseDetail}"/>
                <h6><a href="home" class="link">Home</a> <span>></span> ${cD.courseName}</h6>
                <c:set var="count" value="${0}"/>
                <h2>${cD.courseName}</h2>
                <p>${cD.courseDescription}</p>
                <c:forEach items="${sessionScope.participate}" var="p">
                    <c:if test="${cD.courseId == p.courseId}">
                        <c:forEach items="${sessionScope.mentor}" var="m">
                            <c:if test="${p.username == m.username}">
                                <c:set var="count" value="${count + 1}"/>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </c:forEach>
                <h3>Number of Mentor</h3>
                <h4 class="stat-number">${count}</h4>
                <a href="#"><div class="button-enroll">Enroll</div></a>
            </c:if>
        </div>

        <!-- SAME CATEGORY -->
        <c:if test="${not empty sessionScope.sameCourse}">
            <c:set var="c" value="${sessionScope.category}"/>
            <h2 class="list-mentor">Same ${c.categoryName} Courses</h2>
            <div class="same-course-cards-wrapper">
                <div class="same-course-cards">
                    <c:forEach items="${sessionScope.sameCourse}" var="sC">
                        <a href="viewcourse?courseId=${sC.courseId}" class="same-course-card">
                            <h3>${sC.courseName}</h3>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <!-- OTHER CATEGORY -->
        <c:if test="${not empty sessionScope.otherCourse}">
            <c:set var="c" value="${sessionScope.category}"/>
            <h2 class="list-mentor">Other Courses</h2>
            <div class="same-course-cards-wrapper">
                <div class="same-course-cards">
                    <c:forEach items="${sessionScope.otherCourse}" var="oC">
                        <a href="viewcourse?courseId=${oC.courseId}" class="same-course-card">
                            <h3>${oC.courseName}</h3>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </c:if>

        <!-- MENTOR LIST -->
        <h2 class="list-mentor">Mentor Of This Course</h2>
        <div class="mentor-cards">
            <c:if test="${not empty sessionScope.courseDetail}">
                <c:set var="cD" value="${sessionScope.courseDetail}"/>
                <c:forEach items="${sessionScope.participate}" var="p">
                    <c:if test="${cD.courseId == p.courseId}">
                        <c:forEach items="${sessionScope.mentor}" var="m">
                            <c:if test="${p.username == m.username}">
                                <div class="mentor-card">
                                    <img class="mentor-image-icon" alt="" src="https://zpsocial2-f4-org.zadn.vn/9790ea297aa49bfac2b5.jpg">
                                    <div class="mentor-body">
                                        <div class="mentor-text">
                                            <div style="color: black">${m.lastName} ${m.firstName}</div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </c:forEach>
            </c:if>
        </div>

        <!-- FOOTER -->
        <jsp:include page="footer.jsp"/>
    </body>
</html>
