package admin;

import dal.UserDAO;
import model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UpdateUserInfoControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Retrieve form parameters from the request
        String username = request.getParameter("username");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String avatarPath = request.getParameter("avatarPath");
        String cvPath = request.getParameter("cvPath");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = dateFormat.parse(request.getParameter("dob")); // Date of birth

        boolean activeStatus = request.getParameter("activeStatus") != null; // Checkbox
        boolean isVerified = request.getParameter("isVerified") != null; // Checkbox

        // Role ID: Based on the selected role from the dropdown
        int roleId = Integer.parseInt(request.getParameter("roleId"));

        UserDAO dao = new UserDAO();
        String msg;

        // Pass the `dob` as a `Date` to the DAO (since the DB should store it as a `Date`)
        boolean success = dao.updateUserInfo(username, firstName, lastName, dob, email, avatarPath, cvPath, activeStatus, isVerified, roleId);
        if (success) {
            msg = "User " + username + " updated successfully!";
        } else {
            msg = "Error updating user " + username + ".";
        }

        request.setAttribute("mess", msg);
        request.getRequestDispatcher("managerAccount").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String avatarPath = request.getParameter("avatarPath");
        String cvPath = request.getParameter("cvPath");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date dob = null;
        try {
            dob = dateFormat.parse(request.getParameter("dob")); // Date of birth
        } catch (ParseException ex) {
            Logger.getLogger(UpdateUserInfoControl.class.getName()).log(Level.SEVERE, null, ex);
        }
        boolean activeStatus = request.getParameter("activeStatus") != null; // Checkbox
        boolean isVerified = request.getParameter("isVerified") != null; // Checkbox
        request.setAttribute("username", username);
        request.setAttribute("firstName", firstName);
        request.setAttribute("lastName", lastName);
        request.setAttribute("email", email);
        request.setAttribute("avatarPath", avatarPath);
        request.setAttribute("cvPath", cvPath);
        request.setAttribute("dob", dob);
        request.setAttribute("activeStatus", activeStatus);
        request.setAttribute("isVerified", isVerified);
        request.setAttribute("roleId", roleId);

        request.getRequestDispatcher("dashboard/updateAccount.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(UpdateUserInfoControl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet for updating user information";
    }
}
