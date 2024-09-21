/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Course;
import model.User;

/**
 *
 * @author Admin
 */
public class CourseDAO extends DBContext {

    public List<Course> getAll() {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT * FROM [Course]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int courseId = rs.getInt("courseId");
                String courseName = rs.getString("courseName");
                String courseDescription = rs.getString("courseDescription");
                Date createdAt = rs.getDate("createdAt");
                Course c = new Course(courseId, courseName, courseDescription, createdAt);

                list.add(c);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Course> getAllByCourseId(int courseId) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT * FROM [Course] WHERE courseId = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, courseId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                String courseName = rs.getString("courseName");
                String courseDescription = rs.getString("courseDescription");
                Date createdAt = rs.getDate("createdAt");
                Course c = new Course(courseId, courseName, courseDescription, createdAt);
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Course getCourseByCourseId(int courseId) {
        Course list = new Course();
        String sql = "SELECT * FROM [Course] where courseId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, courseId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String courseName = rs.getString("courseName");
                String courseDescription = rs.getString("courseDescription");
                Date createdAt = rs.getDate("createdAt");
                Course c = new Course(courseId, courseName, courseDescription, createdAt);
                list = c;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public static void main(String[] args) {
        CourseDAO dao = new CourseDAO();
        List<Course> list = dao.getAllByCourseId(1);
        Course c = dao.getCourseByCourseId(1);
        System.out.println(c);
    }
}
