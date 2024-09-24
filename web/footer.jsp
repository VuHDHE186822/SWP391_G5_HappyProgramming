<%-- 
    Document   : footer
    Created on : Sep 20, 2024, 12:44:39 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="CSS/footer.css" rel="stylesheet">
    </head>
    <body>

        <!-- FOOTER -->
        <div class="footer">
            <div class="text-link-list">
                <div class="title1">
                    <div class="text-strong">
                        <div class="text-strong1">???</div>
                    </div>
                </div>
                <div class="text-link-list-item">
                    <div class="list-item">About</div>
                </div>
                <div class="text-link-list-item">
                    <div class="list-item">???</div>
                </div>
                <div class="text-link-list-item">
                    <div class="list-item">???</div>
                </div>
            </div>
            <div class="text-link-list">
                <div class="title1">
                    <div class="text-strong">
                        <div class="text-strong1">Course Category</div>
                    </div>
                </div>
                <c:forEach items="${listCategory}" var ="cate">
                    <div class="text-link-list-item">
                        <a href="allCourse?search=category&categoryId=${cate.categoryId}"><div class="list-item">${cate.categoryName}</div></a>
                    </div>
                </c:forEach>
            </div>
            <div class="text-link-list">
                <div class="title1">
                    <div class="text-strong">
                        <div class="text-strong1">Resources</div>
                    </div>
                </div>
                <div class="text-link-list-item">
                    <div class="list-item">Support</div>
                </div>
                <div class="text-link-list-item">
                    <div class="list-item">Developers</div>
                </div>
            </div>
        </div>
    </body>
</html>
