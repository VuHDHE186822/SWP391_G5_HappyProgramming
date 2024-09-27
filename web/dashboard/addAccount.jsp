<%-- 
    Document   : addAccount
    Created on : Sep 27, 2024, 5:59:14 AM
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
        <form id="addForm" action="<%= request.getContextPath() %>/AddUserInfoControl" method="post">
            <div class="modal-header">
                <h4 class="modal-title">Add User Info</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <!-- First Name -->
                <div class="form-group">
                    <label>First Name</label>
                    <input name="firstName" type="text" class="form-control" id="addFirstName" required>
                </div>
                <!-- Last Name -->
                <div class="form-group">
                    <label>Last Name</label>
                    <input name="lastName" type="text" class="form-control" id="addLastName" required>
                </div>
                <!-- Date of Birth -->
                <div class="form-group">
                    <label>Date of Birth</label>
                    <input name="dob" type="date" class="form-control" id="addDob" required>
                </div>
                <!-- Email -->
                <div class="form-group">
                    <label>Email</label>
                    <input name="email" type="email" class="form-control" id="addEmail" required>
                </div>
                <!-- Avatar Path -->
                <div class="form-group">
                    <label>Avatar Path</label>
                    <input name="avatarPath" type="text" class="form-control" id="addAvatarPath">
                </div>
                <!-- CV Path -->
                <div class="form-group">
                    <label>CV Path</label>
                    <input name="cvPath" type="text" class="form-control" id="addCvPath">
                </div>
                <!-- Active Status -->
                <div class="form-group">
                    <input name="activeStatus" type="checkbox" class="form-check-input" id="addActiveStatus">
                    <label class="form-check-label" for="addActiveStatus">Active</label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </form>
    </body>
</html>
