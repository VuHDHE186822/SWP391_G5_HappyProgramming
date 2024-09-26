<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Account</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>Add Account</h2>
        <form id="form" action="<%= request.getContextPath() %>/AddAccountControl" method="post">
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
            <div class="form-group">
                <input type="submit" class="btn btn-success" value="Add">
            </div>
        </form>
    </div>
</body>
</html>