<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.*, model.*, dal.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add New Course</title>
        <link href="CSS/bootstrap.min.css" rel="stylesheet">
        <link href="CSS/bootstrap.css" rel="stylesheet">
        <style>
            body {
                background-color: #f5f5f5;
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 50px;
            }

            .modal-dialog {
                max-width: 800px;
                margin: 30px auto;
            }

            .modal-content {
                border-radius: 10px;
                display: flex;
                box-shadow: 0 0 15px #ccc;
                border: none;
                overflow: hidden;
            }

            .modal-body {
                padding: 0;
                display: flex;
                flex-direction: row;
                align-items: center;
            }

            .course-image {
                width: 40%;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            .course-image img {
                max-width: 114%;
                border-radius: 5px;
            }

            .form-area {
                width: 60%;
                padding: 20px;
                background-color: white;
                border-radius: 5px;
            }

            .form-area h5 {
                font-size: 2rem;
                color: #5d3fd3;
                text-align: center;
                margin-bottom: 20px;
                font-weight: bold;
            }

            .form-group label {
                font-size: 1rem;
                font-weight: bold;
                color: #333;
            }

            .form-control {
                background-color: #eeeded;
                border: none;
                border-radius: 5px;
                padding: 10px;
                margin-bottom: 15px;
                font-size: 0.9rem;
                color: #555;
                resize: none; 
                overflow-y: auto; 
            }

            .btn-reset, .btn-confirm {
                background-color: #5d3fd3;
                color: #fff;
                padding: 10px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 0.8rem;
                margin-top: 10px;
                font-weight: bold;
                transition: all 0.3s ease;
                width: 45%;
            }

            .btn-reset:hover, .btn-confirm:hover {
                background-color: #452cbf;
            }

            .text-right {
                display: flex;
                justify-content: space-between;
            }

            .success-message {
                color: green;
                font-weight: bold;
                text-align: center;
                font-size: 14px;
            }

            .error-message {
                color: red;
                font-weight: bold;
                text-align: center;
                font-size: 14px;
            }

            #description, #category {
                height: 100px; 
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <!-- Modal Content -->
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <!-- Image Area -->
                    <div class="course-image">
                        <img src="img/addcourse.png" alt="Course Image">
                    </div>
                    <!-- Form Area -->
                    <div class="form-area">
                        <h5 class="modal-title">Add New Course</h5>
                        <form action="addcourse" method="post" id="addCourseForm">
                            <div class="form-group">
                                <label for="courseName">Course Name</label>
                                <input type="text" id="courseName" name="courseName" class="form-control" placeholder="Enter the name of the course" required>
                            </div>
                            <div class="form-group">
                                <label for="category">Category</label>
                                <select id="category" name="categoryIds" class="form-control" multiple required>
                                    <%
                                        CourseDAO dao = new CourseDAO();
                                        List<Category> list = dao.getAllCategories();
                                        for(Category c : list) {
                                    %> 
                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryName()%></option>
                                    <% } %>
                                </select>
                                <small class="form-text text-muted">Hold down the Ctrl(Windows) or Command(Mac) button to select multiple options.</small>
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea id="description" name="description" class="form-control" placeholder="Enter description of the course" rows="3"></textarea>
                            </div>
                            <c:if test="${not empty succMsg}">
                                <div class="success-message">
                                    ${succMsg}
                                </div>
                                <c:remove var="succMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failedMsg}">
                                <div class="error-message">
                                    ${failedMsg}
                                </div>
                                <c:remove var="failedMsg" scope="session"/>
                            </c:if>
                            <div class="form-group text-right">
                                <button type="button" class="btn-reset" onclick="resetForm()">RESET</button>
                                <button type="submit" class="btn-confirm">CONFIRM</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function resetForm() {
                document.getElementById("addCourseForm").reset();
            }
        </script>
    </body>
</html>
