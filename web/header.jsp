<%-- 
    Document   : header
    Created on : Sep 18, 2024, 11:32:17 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* HEADER */
            .content-header {
                background-color: transparent;
                position: fixed;
                transition: all 0.3s ease;
                z-index: 100000;
                width: 100%;
                top: 0;
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin: 0 auto;
                padding: 5px 10px;
                background-color: #edf2fa;
            }

            .menu {
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
                list-style: none;
                padding-left: 0;
                margin: auto 0;
                gap: 20px;
            }

            .menu li a {
                text-decoration: none;
                color: black;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .menu li a:hover {
                color: #007bff;
            }

        </style>
    </head>
    <body>
        <!-- HEADER -->
        <div class="content-header">

            <!-- LOGO -->
            <div class="logo">
                <span>???</span>
            </div>

            <!-- MIDDLE -->
            <ul class="menu">
                <li><a href="#">Courses</a></li>
                <li><a href="#">My Courses</a></li>
                <li><a href="#">Chat</a></li>
            </ul>

            <!-- USER AVATAR -->   
            <div>
                <h2>USER</h2>
            </div>

            <!-- SCOLL BAR FUNCTION -->    
            <script>
                window.addEventListener("scroll", function () {
                    var header = document.querySelector(".content-header");
                    header.classList.toggle("scrolled", window.scrollY > 0);
                });
            </script>
        </div>
    </body>
</html>
