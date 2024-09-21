<%-- 
    Document   : homeuser.jsp
    Created on : Sep 18, 2024, 4:25:30 PM
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
    </head>
    <body>

        <!-- HEADER -->
        <jsp:include page="header.jsp"/>

        <!-- MIDDLE -->
        <div class="content-middle">

            <!-- HEAD CONTENT MIDDLE -->
            <div class="header-content-middle">
                <!-- TEXT -->
<<<<<<< Upstream, based on origin/master
                <h1>In ???</h1>
                <h1>Học gì cũng có</h1>
=======
                <h1>Ở ???</h1>
                <h1><a href = "changePass.jsp">Học gì cũng có</a></h1>
>>>>>>> 1b7536c 
                <p>Con đường hiệu quả nhất để bạn có thêm kiến thức và năng lực trong mọi lĩnh vực. Tham gia học cùng phương pháp học tập hoàn toàn mới từ FUNiX ngay!</p>

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
        </div>
    </body>
</html>
