<%-- 
    Document   : deactivateAccount
    Created on : Sep 27, 2024, 6:01:16 AM
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
        <form id="deactivateForm" action="<%= request.getContextPath() %>/DeactivateUserControl" method="post">
            <div class="modal-header">
                <h4 class="modal-title">Deactivate User</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <!-- Username (hidden) -->
                <input name="username" type="hidden" id="deactivateUsername">
                <p>Are you sure you want to deactivate this user?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-danger">Deactivate</button>
            </div>
        </form>
    </body>
</html>
