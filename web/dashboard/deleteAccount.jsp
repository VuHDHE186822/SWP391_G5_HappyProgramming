<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Account</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <h2>Deactivate User</h2>
        <form id="deleteForm" action="<%= request.getContextPath() %>/DeleteUserInfoControl" method="post">
            <input name="username" type="hidden" id="deleteUsername">
            <p>Are you sure you want to deactivate this user?</p>
            <p class="text-warning"><small>The user will be marked as inactive.</small></p>
            <div class="form-group">
                <input type="submit" class="btn btn-danger" value="Deactivate">
            </div>
        </form>
    </div>
</body>
</html>