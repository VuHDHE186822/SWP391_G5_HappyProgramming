<%-- 
    Document   : updateAccount
    Created on : Sep 27, 2024, 6:00:26 AM
    Author     : Sapphire
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="updateForm" action="<%= request.getContextPath() %>/UpdateUserInfoControl" method="post">
            <div class="modal-header">
                <h4 class="modal-title">Update User Info</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <!-- Username (hidden) -->
                <input name="username" type="hidden" id="updateUsername">

                <!-- First Name -->
                <div class="form-group">
                    <label>First Name</label>
                    <input name="firstName" type="text" class="form-control" id="updateFirstName" required>
                </div>
                <!-- Last Name -->
                <div class="form-group">
                    <label>Last Name</label>
                    <input name="lastName" type="text" class="form-control" id="updateLastName" required>
                </div>
                <!-- Date of Birth -->
                <div class="form-group">
                    <label>Date of Birth</label>
                    <input name="dob" type="date" class="form-control" id="updateDob" required>
                </div>
                <!-- Email -->
                <div class="form-group">
                    <label>Email</label>
                    <input name="email" type="email" class="form-control" id="updateEmail" required>
                </div>
                <!-- Avatar Path -->
                <div class="form-group">
                    <label>Avatar Path</label>
                    <input name="avatarPath" type="text" class="form-control" id="updateAvatarPath">
                </div>
                <!-- CV Path -->
                <div class="form-group">
                    <label>CV Path</label>
                    <input name="cvPath" type="text" class="form-control" id="updateCvPath">
                </div>
                <!-- Active Status -->
                <div class="form-group">
                    <input name="activeStatus" type="checkbox" class="form-check-input" id="updateActiveStatus">
                    <label class="form-check-label" for="updateActiveStatus">Active</label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    </body>
</html>
