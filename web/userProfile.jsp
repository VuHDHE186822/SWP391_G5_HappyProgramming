<%-- 
    Document   : userProfile
    Created on : Sep 21, 2024, 11:38:41 PM
    Author     : Huy Võ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User" %>
<%@ page import="java.util.Date" %>
<%@ page import="service.ImageConverter" %>
<%@ page session="true" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="service.FileConverter" %>
<%@ page import="java.io.File" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .profile-form {
                background-color: #fff;
                border-radius: 25px;
                display: flex;
                width: 60%;
                box-shadow: 0 0 10px #888;
                flex-direction: column;
                padding: 20px;
            }

            .profile-form h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .profile-container {
                display: flex;
                align-items: center;
                width: 100%;
                margin-bottom: 3%;
            }

            .avatar-container {
                flex: 0 0 27%;
                display: flex;
                flex-direction: column;
                align-items: center; /* Căn giữa các phần tử theo chiều dọc */
                justify-content: center;
                margin-left: 3%;
            }

            .right-part {
                flex: 0 0 67%;
                margin-right: 3%;
            }

            .avatar-image {
                width: 200px;
                height: 200px;
                border-radius: 50%;
                object-fit: cover;
                border: 2px solid #ccc;
                margin-bottom: 20px;
                margin-left: 5%;
            }

            .button-upload {
                width: 50%;
                height: 40px;
                background-color: #5d3fd3;
                color: #fff;
                padding: 5px 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-left: 20%;
            }

            .button-upload:hover {
                background-color: #452cbf;
            }

            .input-container {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
                width: calc(100% - 10px);
            }

            .input-container label {
                width: 20%;
                text-align: right;
                margin-right: 10px;
                font-weight: bold;
            }

            .input-container input {
                width: calc(100% - 30% - 10px);
                padding: 10px;
                font-size: 0.9rem;
                border: none;
                border-radius: 5px;
                background-color: #eeeded;
            }

            .input-container input[disabled] {
                background-color: #f0f0f0;
            }

            .input-container i {
                cursor: pointer;
            }

            .input-container i:hover {
                color: #5d3fd3;
            }

            .button-container {
                text-align: center;
                margin-top: 20px;
            }

            .button-save {
                background-color: #5d3fd3;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .button-save:hover {
                background-color: #452cbf;
            }

            .name-container {
                display: flex;
                width: 100%;
                justify-content: space-between;
            }

            .name-input {
                display: flex;
                align-items: center;
                width: calc(100% - 30% + 10px);
                justify-content: space-between;
            }

            .name-input label {
                width: 30%;
                text-align: right;
                margin-right: 10px;
                font-weight: bold;
            }

            .name-input input {
                width: 40%;
                padding: 10px;
                font-size: 0.9rem;
                border: none;
                border-radius: 5px;
                background-color: #eeeded;
            }
            .error-message {
                color: red;
                font-weight: bold;
                text-align: center;
                font-size: 12px;
            }

            .success-message {
                color: green;
                font-weight: bold;
                text-align: center;
                font-size: 12px;
            }
        </style>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <%
            User user = (User) session.getAttribute("user");
            if (user == null) {
               response.sendRedirect("login.jsp");
               return;
            }
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String dobFormatted = user.getDob() != null ? sdf.format(user.getDob()) : "";
            String cvBase64 = user.getCvPath(); // Giả sử user.getCvPath() trả về chuỗi Base64
FileConverter fileConverter = FileConverter.getInstance();
File cvFile = fileConverter.decode(cvBase64, "CV.pdf");

// Kiểm tra xem file có được tạo thành công không
if (cvFile != null && cvFile.exists()) {
    // File đã được tạo thành công, bạn có thể xử lý tiếp
    System.out.println("File CV đã được tạo thành công: " + cvFile.getAbsolutePath());
} else {
    System.out.println("Có lỗi xảy ra trong quá trình tạo file CV.");
}
        %>
        <script>
            let isEditing = false;
            let originalValues = {};

            function toggleEdit() {
                const inputs = document.querySelectorAll('.input-container input');
                const editButton = document.getElementById('editButton');
                const saveButton = document.getElementById('saveButton');
                const cancelButton = document.getElementById('cancelButton');
                const uploadCvButton = document.getElementById('uploadCvButton');
                if (!isEditing) {
                    inputs.forEach(input => {
                        if (input.name !== 'username') {
                            if (!originalValues[input.name]) {
                                originalValues[input.name] = input.value;
                            }
                            input.disabled = false;
                        }
                    });
                    editButton.style.display = 'none';
                    saveButton.style.display = 'inline-block';
                    cancelButton.style.display = 'inline-block';
                    uploadCvButton.style.display = 'inline-block';
                } else {
                    inputs.forEach(input => {
                        if (input.name !== 'username') {
                            input.disabled = true;
                        }
                    });
                    editButton.style.display = 'inline-block';
                    saveButton.style.display = 'none';
                    cancelButton.style.display = 'none';
                    uploadCvButton.style.display = 'none';
                }
                isEditing = !isEditing;
            }

            function saveChanges() {
                alert("Do you want to save changes?");
                toggleEdit();
            }

            function cancelEdit() {
                const inputs = document.querySelectorAll('.input-container input');
                inputs.forEach(input => {
                    if (input.name !== 'username') {
                        input.value = originalValues[input.name];
                        input.disabled = true;
                    }
                });
                document.getElementById('saveButton').style.display = 'none';
                document.getElementById('editButton').style.display = 'inline-block';
                document.getElementById('uploadCvButton').style.display = 'none'; // Ẩn nút tải lên CV
            }
            function changeImage() {
                let input = document.getElementById("fileinput");
                input.click();
            }
        </script>


        <div class="profile-form">
            <div class="profile-container">
                <div class="avatar-container">
                    <form action="changeAvatar" method="post" enctype="multipart/form-data" id="avatarForm">
                        <a onclick="changeImage()">
                            <img src="data:image/jpeg;base64,<%= user.getAvatarPath() %>" alt="Avatar" class="avatar-image">
                        </a>
                        <button type="button" class="button-upload" onclick="changeImage()">Change Image</button>
                        <input style="display: none;" name="avatarFile" type="file" id="fileinput" accept="image/*" onchange="document.getElementById('avatarForm').submit();"/>

                    </form>
                </div>
                <div class="right-part">
                    <form action="userProfile" method="post">
                        <h2>User Profile</h2>
                        <div class="input-container">
                            <label>First Name:</label>
                            <div class="name-input">
                                <input type="text" name="firstName" value="<%= user.getFirstName() %>" disabled>
                                <label>Last Name:</label>
                                <input type="text" name="lastName" value="<%= user.getLastName() %>" disabled>
                            </div>
                        </div>
                        <div class="input-container">
                            <label>Username:</label>
                            <input type="text" name="username" value="<%= user.getUsername() %>" disabled>
                            <input type="hidden" name="usernameHidden" value="<%= user.getUsername() %>">
                        </div>
                        <div class="input-container">
                            <label>Date of Birth:</label>
                            <input type="date" name="dob" value="<%= dobFormatted %>" disabled>
                        </div>
                        <div class="input-container">
                            <label>Email:</label>
                            <input type="email" name="email" value="<%= user.getMail() %>" disabled>
                            <input type="hidden" name="oldEmail" value="<%= user.getMail() %>">
                        </div>
                        <c:if test="${user.getRoleId() == 2}">
                            <div class="input-container">
                                <label>CV:</label>
                                <a id="cvLink" href="data:application/pdf;base64,${user.getCvPath()}" target="_blank" class="cv-link" style="display: block;">View CV</a>
                                <input type="file" name="cvFile" id="cvFile" style="display: none;" accept="*">
                            </div>
                        </c:if>
                        <c:if test="${not empty sessionScope.error}">
                            <div class="error-message">
                                ${sessionScope.error}
                            </div>
                        </c:if>
                        <% session.removeAttribute("error"); %>

                        <c:if test="${not empty sessionScope.note}">
                            <div class="success-message">
                                ${sessionScope.note}
                            </div>
                        </c:if>
                        <% session.removeAttribute("note"); %>
                        <div class="button-container">
                            <button type="button" class="button-save" id="editButton" onclick="toggleEdit()">Edit Profile</button>
                            <button type="submit" class="button-save" id="saveButton" style="display: none;" onclick="saveChanges()">Save Changes</button>
                            <button type="button" class="button-save" id="cancelButton" style="display: none; background-color: red;" onclick="cancelEdit()">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
