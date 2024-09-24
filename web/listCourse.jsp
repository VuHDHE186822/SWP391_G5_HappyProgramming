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
                width: 100%;
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

            .wide-banner {
                background-color: #212529;
                color: white;
                text-align: center;
                padding: 20px;
                margin: 20px 0;
                height: 300px;
                border-radius: 10px;
            }

            h2 {
                text-align: center;
                margin: 20px 0;
            }

            .featured-products {
                background-color: black;
                color: white;
                padding: 20px;
                border: 2px solid gold;
                border-radius: 10px;
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

            .product-item2 {
                background: white;
                border: 2px solid gold;
                border-radius: 10px;
                padding: 15px;
                text-align: center;
                width: 200px;
                color: black;
            }

            .product-item img {
                max-width: 100%;
                border-radius: 10px;
            }

            footer {
                text-align: center;
                padding: 20px;
                background-color: #800080;
                color: white;
                position: relative;
            }

            .pagination {
                text-align: center;
                margin: 20px 0;
            }

            .page-link {
                margin: 0 5px;
                cursor: pointer;
                color: #1da1f2;
            }

            .page-link.active {
                font-weight: bold;
            }
            .nav-link {
                color: white;
                text-decoration: none;
            }

            .nav-link:hover {
                text-decoration: underline;
            }
            .featured-product2 {
                background-color: black;
                color: white;
                padding: 20px;
            }

            .product-list2 {
                display: flex;
                overflow-x: auto;
                padding: 10px 0;
                gap: 20px;
                scrollbar-width: thin;
            }

            .product-item2 {
                background: white;
                border: 2px solid gold;
                border-radius: 10px;
                padding: 15px;
                text-align: center;
                color: black;
                flex: 0 0 auto;
                min-width: 250px;
            }

            .product-item2 img {
                max-width: 100%;
                border-radius: 10px;
            }
            .mentor-course {
                text-decoration: none;
                color: #3498db;
            }

            .mentor-course:hover {
                color: #2980b9;
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
                <a href="allCourse" class="nav-link">All</a> <!-- Thêm lớp nav-link -->
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
            <div class="product-list2">
                <!--<div class="product-item2">-->
                <c:forEach items="${listMostEnrollCourse}" var="cou">
                    <c:forEach items="${listCourse_Category}" var="cocat">
                        <c:if test="${cocat.courseId == cou.courseId}"> <!-- Kiểm tra nếu courseId khớp -->
                            <c:forEach items="${listCategory}" var="cat">
                                <c:if test="${cat.categoryId == cocat.categoryId}"> <!-- Kiểm tra nếu categoryId khớp -->
                                    <div class="product-item2">
                                       <a href="viewcourse?courseId=${cou.courseId}" class="mentor-course"> <h3>${cou.courseName}</h3></a>
                                        <h6>Category: ${cat.categoryName}</h6> <!-- Hiển thị tên danh mục -->
                                        <h6 class="course-description">${cou.courseDescription}</h6>
                                        <p>Created at: ${cou.createdAt}</p>
                                        <button>Enroll</button>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </c:forEach>

            </div
        </div>
    </section>


    <section class="all-products">
        <h2>Courses</h2>
        <div class="product-list" id="product-list">
            <c:forEach items="${listCourse}" var="cou">
                <c:forEach items="${listCourse_Category}" var="cocat">
                    <c:if test="${cocat.courseId == cou.courseId}"> <!-- Kiểm tra nếu courseId khớp -->
                        <c:forEach items="${listCategory}" var="cat">
                            <c:if test="${cat.categoryId == cocat.categoryId}"> <!-- Kiểm tra nếu categoryId khớp -->
                                <div class="product-item">
                                    <a href="viewcourse?courseId=${cou.courseId}" class="mentor-course"><h3>${cou.courseName}</h3></a>
                                    <h6>Category: ${cat.categoryName}</h6> <!-- Hiển thị tên danh mục -->
                                    <h6 class="course-description">${cou.courseDescription}</h6>
                                    <h6>Created at: ${cou.createdAt}</h6>
                                    <button>Enroll</button>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </c:forEach>
            </c:forEach>
        </div>

        <div class="pagination" id="pagination"></div>
    </section>

    <jsp:include page="footer.jsp"/>

    <script>
        const productsPerPage = 10;
        const productItems = document.querySelectorAll('.product-item');
        const totalPages = Math.ceil(productItems.length / productsPerPage);
        const pagination = document.getElementById('pagination');

        function showPage(page) {
            const start = (page - 1) * productsPerPage;
            const end = start + productsPerPage;

            productItems.forEach((item, index) => {
                item.style.display = (index >= start && index < end) ? 'block' : 'none';
            });

            // Update pagination links
            const pageLinks = Array.from(pagination.children);
            pageLinks.forEach(link => link.classList.remove('active'));
            if (pagination.children[page - 1]) {
                pagination.children[page - 1].classList.add('active');
            }
        }

        function createPagination() {
            for (let i = 1; i <= totalPages; i++) {
                const link = document.createElement('span');
                link.textContent = i;
                link.className = 'page-link';
                link.onclick = () => showPage(i);
                pagination.appendChild(link);
            }
        }

        function limitDescription() {
            document.querySelectorAll('.course-description').forEach(function (description) {
                const text = description.textContent;
                if (text.length > 45) {
                    description.textContent = text.slice(0, 45) + '...';
                }
            });
        }

        createPagination();
        limitDescription(); // Giới hạn mô tả
        showPage(1); // Hiển thị trang đầu tiên khi tải trang
    </script>
</body>
</html>