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
        <div id="updateUserModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
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
                            <!-- Verified Status -->
                            <div class="form-group">
                                <input name="isVerified" type="checkbox" class="form-check-input" id="updateIsVerified">
                                <label class="form-check-label" for="updateIsVerified">Verified</label>
                            </div>
                            <!-- Role Selection (Dropdown) -->
                            <div class="form-group">
                                <label>Role</label>
                                <select name="roleId" class="form-control" id="updateRoleId" required>
                                    <option value="1">Admin</option>
                                    <option value="2">Mentor</option>
                                    <option value="3">Mentee</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Update">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
