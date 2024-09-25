/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.CourseCategoryDAO;
import dal.CourseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Course;
import model.CourseCategory;

/**
 *
 * @author Admin
 */
public class viewcourse extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet viewcourse</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet viewcourse at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        CourseDAO daoC = new CourseDAO();
        String courseId_str = request.getParameter("courseId");
        CategoryDAO daoCt = new CategoryDAO();
        CourseCategoryDAO daoCC = new CourseCategoryDAO();
        try {
            int courseId = Integer.parseInt(courseId_str);
            session.setAttribute("currentCourseId", courseId);

            int sameCategoryId = daoCC.getCategoryIdByCourseId(courseId);
            Course c = daoC.getCourseByCourseId(courseId);
            List<Course> sameCourse = daoC.getSameCourse(sameCategoryId, courseId);
            Category cate = daoCt.getCategoryByCategoryId(sameCategoryId);
            List<Course> otherCourse = daoC.getOtherCourseHasOtherCategory(sameCategoryId);
            List<Category> category = daoCt.getAllExceptOne(sameCategoryId);

            session.setAttribute("category", category);
            session.setAttribute("otherCourse", otherCourse);
            session.setAttribute("sameCourse", sameCourse);
            session.setAttribute("categoryCourse", cate);
            session.setAttribute("courseDetail", c);

            response.sendRedirect("viewcourse.jsp?courseId=" + courseId);
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi nếu có
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
