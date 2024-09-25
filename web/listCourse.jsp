<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cửa Hàng Trực Tuyến</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #f9f9f9;
            }

            .banner {
                height: 200px;
                background-color: grey;
                color: white;
                display: flex;
                justify-content: flex-start;
                align-items: center;
                position: relative;
                padding-left: 200px;
            }

            .search-container {
                width: 100%;
                max-width: 600px;
            }

            #search-form {
                display: flex;
                justify-content: flex-start;
            }

            input[type="text"] {
                padding: 5px;
                width: 500px;
                height: 25px;
                border: none;
                border-radius: 5px;
            }

            button {
                padding: 5px 10px;
                background-color: #1da1f2;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-left: 5px;
            }

            button:hover {
                background-color: #ff9900;
            }

            .dropdown {
                position: relative;
                display: inline-block;
                margin-left: 15px;
                color: white;
                cursor: pointer;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: white;
                min-width: 160px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover {
                background-color: #f1f1f1;
            }

            h2 {
                text-align: center;
                margin: 20px 0;
            }

            .product-list {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 20px;
            }

            .product-item {
                background: gainsboro;
                border-radius: 10px;
                padding: 15px;
                text-align: center;
                width: 200px;
                color: black;
            }

            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 20px 0;
            }

            .pagination ul {
                list-style: none;
                display: flex;
                padding: 0;
                margin: 0;
            }

            .pagination li {
                margin: 0 5px;
            }

            .pagination a {
                padding: 10px 15px;
                background-color: #1da1f2;
                color: white;
                border-radius: 5px;
                text-decoration: none;
                transition: background-color 0.3s;
            }

            .pagination a:hover {
                background-color: #ff9900;
            }

            .pagination .active a {
                background-color: #ff9900;
                font-weight: bold;
            }
        </style>
    </head>
    <body>

        <jsp:include page="header.jsp"/>

        <header class="banner"> 
            <div class="search-container">
                <form action="allCourse" method="get" id="search-form">
                    <input type="hidden" name="search" value="searchByName"/>
                    <input type="text" placeholder="Search course" name="keyword" id="search-input" required/>
                    <button type="submit" title="Search"><i class="fa fa-search"></i> Search</button>
                </form>
            </div>
            <div class="">
                <a href="allCourse" class="nav-link">All</a>
            </div>
            <div class="dropdown">
                Category ▼
                <div class="dropdown-content">
                    <c:forEach items="${listCategory}" var ="cate">
                        <a href="allCourse?search=category&categoryId=${cate.categoryId}">${cate.categoryName}</a>
                    </c:forEach>
                </div>
            </div>
            <div class="dropdown">
                Mentor ▼
                <div class="dropdown-content">
                    <c:forEach items="${listMentor}" var ="cate">
                        <a href="allCourse?search=username&username=${cate.username}">${cate.username}</a>
                    </c:forEach>
                </div>
            </div>
        </header>

        <section class="featured-product2">
            <h2>Top courses with the most participation</h2>
            <div class="product-list">
                <c:forEach items="${listMostEnrollCourse}" var="cou">
                    <c:forEach items="${listCourse_Category}" var="cocat">
                        <c:if test="${cocat.courseId == cou.courseId}">
                            <c:forEach items="${listCategory}" var="cat">
                                <c:if test="${cat.categoryId == cocat.categoryId}">
                                    <div class="product-item">
                                        <a href="viewcourse?courseId=${cou.courseId}" class="mentor-course">
                                            <h3>${cou.courseName}</h3>
                                        </a>
                                        <h6>Category: ${cat.categoryName}</h6>
                                        <p class="short-description">${cou.courseDescription}</p>
                                        <p>Created at: ${cou.createdAt}</p>
                                        <button>Enroll</button>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </div>
        </section>

        <section class="all-products">
            <h2>Courses</h2>
            <div class="product-list" id="product-list">
                <c:forEach items="${listCourse}" var="cou">
                    <c:forEach items="${listCourse_Category}" var="cocat">
                        <c:if test="${cocat.courseId == cou.courseId}">
                            <c:forEach items="${listCategory}" var="cat">
                                <c:if test="${cat.categoryId == cocat.categoryId}">
                                    <div class="product-item">
                                        <a href="viewcourse?courseId=${cou.courseId}" class="mentor-course">
                                            <h3>${cou.courseName}</h3>
                                        </a>
                                        <h6>Category: ${cat.categoryName}</h6>
                                        <p class="short-description">${cou.courseDescription}</p>
                                        <h6>Created at: ${cou.createdAt}</h6>
                                        <button>Enroll</button>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </div>

            <div class="pagination">
                <ul>
                    <c:forEach begin="1" end="${pageControl.totalPage}" var="pageNumber">
                        <li class="${pageNumber == pageControl.page ? 'active' : ''}">
                            <a href="${pageControl.urlPattern}page=${pageNumber}">${pageNumber}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </section>

        <jsp:include page="footer.jsp"/>

        <script>
            // Giới hạn mô tả xuống 45 ký tự
            document.querySelectorAll('.short-description').forEach(function (desc) {
                if (desc.innerText.length > 45) {
                    desc.innerText = desc.innerText.substring(0, 45) + '...';
                }
            });
        </script>

    </body>
</html>
