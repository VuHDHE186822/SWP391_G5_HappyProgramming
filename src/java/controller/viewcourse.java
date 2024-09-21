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
        List<Category> category = daoCt.getAll();
        Course c = new Course();
        try {
            int courseId = Integer.parseInt(courseId_str);
            int sameCate = daoCC.getCategoryIdByCourseId(courseId);
            List<CourseCategory> courseCateHasSameCate = daoCC.getAllByCategoryId(sameCate);
            List<Course> course = daoC.getAll();
            for (Course co : course) {
                if (co.getCourseId() == courseId) {
                    c = co;
                }
            }
            List<Course> sameCourse = new ArrayList<>();
            for (CourseCategory cSame : courseCateHasSameCate) {
                Course c1 = daoC.getCourseByCourseId(cSame.getCourseId());
                sameCourse.add(c1);
            }

            Category cate = new Category();
            for (Category ca : category) {
                if (ca.getCategoryId() == sameCate) {
                    cate = ca;
                }
            }
            List<Course> allCoursesExceptSameCategory = new ArrayList<>();

            for (Course co : course) {
                boolean isSameCategory = false;

                for (Course sameCo : sameCourse) {
                    if (co.getCourseId() == sameCo.getCourseId()) {
                        isSameCategory = true;
                        break;
                    }
                }

                if (!isSameCategory) {
                    allCoursesExceptSameCategory.add(co);
                }
            }

            session.setAttribute("otherCourse", allCoursesExceptSameCategory);
            session.setAttribute("sameCourse", sameCourse);
            session.setAttribute("category", cate);
            session.setAttribute("courseDetail", c);
            response.sendRedirect("viewcourse.jsp");
        } catch (Exception e) {
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
