<%-- 
    Document   : homeguest
    Created on : Sep 20, 2024, 1:06:46 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="statistics">
                <h2 class="statistics-title">SOME STATISTICS ABOUT US</h2>
                <div class="statistics-cards">
                    <div class="stat-card">
                        <i class="icon fa fa-users"></i>
                        <p class="stat-number">10,000</p>
                        <p class="stat-description">NUMBER OF MENTEES</p>
                    </div>
                    <div class="stat-card">
                        <i class="icon fa fa-book"></i>
                        <p class="stat-number">150</p>
                        <p class="stat-description">NUMBER OF COURSES</p>
                    </div>
                    <div class="stat-card">
                        <i class="icon fa fa-chalkboard-teacher"></i>
                        <p class="stat-number">500</p>
                        <p class="stat-description">NUMBER OF MENTORS</p>
                    </div>
                </div>
            </div>

            <!-- MENTOR SLIDE -->
            <div class="mentor-content">
                <div class="mentor-content-heading">
                    <div class="mentor-heading">SEE OUR BEST MENTOR</div>
                </div>
                <div class="mentor-cards">
                    <div class="mentor-card">
                        <img class="mentor-image-icon" alt="" src="https://zpsocial2-f4-org.zadn.vn/9790ea297aa49bfac2b5.jpg">
                        <div class="mentor-body">
                            <div class="mentor-text">
                                <div style="color: #ff9f46">Huy Vo</div>
                                <div class="mentor-body-text">Best Mentor in Vietnam right now.</div>
                            </div>
                            <div class="button-group">
                                <div class="button">
                                    <div class="button1">More Detail</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  

            <!-- COURSES SLIDE -->
            <div class="course-content">
                <div class="course-content-heading">
                    <div class="course-heading">OUR COURSES</div>
                </div>
                <div class="row course-cards">
                    <div class="course-card col-md-5">
                        <img class="course-image-icon" alt="" src="Image.png">
                        <div class="course-body">
                            <div class="course-text">
                                <div>HTML5</div>
                                <div class="course-body-text">Body text for whatever you’d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story. </div>
                            </div>
                        </div>
                    </div>
                    <div class="course-card col-md-5">
                        <img class="course-image-icon" alt="" src="Image.png">
                        <div class="course-body">
                            <div class="course-text">
                                <div>HTML5</div>
                                <div class="course-body-text">Body text for whatever you’d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story. </div>
                            </div>
                        </div>
                    </div>
                    <div class="course-card col-md-5">
                        <img class="course-image-icon" alt="" src="Image.png">
                        <div class="course-body">
                            <div class="course-text">
                                <div>HTML5</div>
                                <div class="course-body-text">Body text for whatever you’d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story. </div>
                            </div>
                        </div>
                    </div>
                    <div class="course-card col-md-5">
                        <img class="course-image-icon" alt="" src="Image.png">
                        <div class="course-body">
                            <div class="course-text">
                                <div>HTML5</div>
                                <div class="course-body-text">Body text for whatever you’d like to say. Add main takeaway points, quotes, anecdotes, or even a very very short story. </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- FOOTER -->
            <jsp:include page="footer.jsp"/>
    </body>
</html>
