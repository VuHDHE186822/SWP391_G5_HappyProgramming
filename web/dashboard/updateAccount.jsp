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
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="form" action="<%= request.getContextPath() %>/AddAccountControl" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Add Account</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <!-- Username -->
                            <div class="form-group">
                                <label>Username</label>
                                <input name="username" type="text" class="form-control" required>
                            </div>
                            <!-- Password -->
                            <div class="form-group">
                                <label>Password</label>
                                <input name="password" type="password" class="form-control" required>
                            </div>
                            <!-- First Name -->
                            <div class="form-group">
                                <label>First Name</label>
                                <input name="firstName" type="text" class="form-control" required>
                            </div>
                            <!-- Last Name -->
                            <div class="form-group">
                                <label>Last Name</label>
                                <input name="lastName" type="text" class="form-control" required>
                            </div>
                            <!-- Date of Birth -->
                            <div class="form-group">
                                <label>Date of Birth</label>
                                <input name="dob" type="date" class="form-control" required>
                            </div>
                            <!-- Email -->
                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" type="email" class="form-control" required>
                            </div>
                            <!-- Avatar Path -->
                            <div class="form-group">
                                <label>Avatar Path</label>
                                <input name="avatarPath" type="text" class="form-control">
                            </div>
                            <!-- CV Path -->
                            <div class="form-group">
                                <label>CV Path</label>
                                <input name="cvPath" type="text" class="form-control">
                            </div>
                            <!-- Active Status -->
                            <div class="form-group">
                                <input name="activeStatus" type="checkbox" class="form-check-input" id="activeStatus">
                                <label class="form-check-label" for="activeStatus">Active</label>
                            </div>
                            <!-- Verified Status -->
                            <div class="form-group">
                                <input name="isVerified" type="checkbox" class="form-check-input" id="isVerified">
                                <label class="form-check-label" for="isVerified">Verified</label>
                            </div>
                            <!-- Verification Code -->
                            <div class="form-group">
                                <label>Verification Code</label>
                                <input name="verificationCode" type="text" class="form-control">
                            </div>
                            <!-- Role Selection (Dropdown) -->
                            <div class="form-group">
                                <label>Role</label>
                                <select name="roleId" class="form-control" required>
                                    <option value="1">Admin</option>
                                    <option value="2">Mentor</option>
                                    <option value="3">Mentee</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
