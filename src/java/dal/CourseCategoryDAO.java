/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.CourseCategory;
import model.Participate;

/**
 *
 * @author Admin
 */
public class CourseCategoryDAO extends DBContext {

    public List<CourseCategory> getAll() {
        List<CourseCategory> list = new ArrayList<>();
        String sql = "SELECT * FROM [Course_Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int categoryId = rs.getInt("categoryId");
                int courseId = rs.getInt("courseId");
                CourseCategory c = new CourseCategory(categoryId, courseId);
                list.add(c);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Integer> getCategoryIdByCourseId(int courseId) {
        List<Integer> list = new ArrayList<>();
        String sql = "SELECT * FROM [Course_Category] where courseId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, courseId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int categoryId = rs.getInt("categoryId");
                list.add(categoryId);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<CourseCategory> getAllByCategoryId(int categoryId) {
        List<CourseCategory> list = new ArrayList<>();
        String sql = "SELECT * FROM [Course_Category] where categoryId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int courseId = rs.getInt("courseId");
                CourseCategory p = new CourseCategory(categoryId, courseId);
                list.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public static void main(String[] args) {
        CourseCategoryDAO dao = new CourseCategoryDAO();
        List<CourseCategory> list = dao.getAllByCategoryId(1);
        for (CourseCategory l : list) {
            System.out.println(l);
        }
    }
}
