/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.User;
import dal.UserDAO;
import model.GoogleAccount;

/**
 *
 * @author Admin
 */
public class login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        String code = request.getParameter("code");
        googlelogin gg = new googlelogin();
        String accessToken = gg.getToken(code);
        GoogleAccount acc = gg.getUserInfo(accessToken);

        UserDAO dao = new UserDAO();
        User user = dao.getUserByMail(acc.getEmail());

        if (user != null) {
            session.setAttribute("user", user);
            response.sendRedirect("home");
        } else {
            session.setAttribute("email", acc.getEmail());
            session.setAttribute("firstName", acc.getGiven_name());
            session.setAttribute("lastName", acc.getFamily_name());
            response.sendRedirect("googlelogin.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO dao = new UserDAO();
        List<User> users = dao.getAll();
        User user = new User();
        boolean found = false;
        for (User u : users) {
            if (username.equals(u.getUsername()) && password.equals(u.getPassword())) {
                found = true;
                session.setAttribute("user", u);
                response.sendRedirect("home");
                break;
            }
        }

        if (!found) {
            session.setAttribute("error", "*Check Your Username Or Password");
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
