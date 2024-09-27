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
        <div id="deleteUserModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="deleteForm" action="<%= request.getContextPath() %>/DeleteUserInfoControl" method="post">
                        <div class="modal-header">
                            <h4 class="modal-title">Deactivate User</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <input name="username" type="hidden" id="deleteUsername">
                            <p>Are you sure you want to deactivate this user?</p>
                            <p class="text-warning"><small>The user will be marked as inactive.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Deactivate">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
