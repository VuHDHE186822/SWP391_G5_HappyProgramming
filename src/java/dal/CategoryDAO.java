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
import model.Category;
import model.CourseCategory;

/**
 *
 * @author Admin
 */
public class CategoryDAO extends DBContext {

    public List<Category> getAll() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM [Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int categoryId = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                Category c = new Category(categoryId, categoryName);
                list.add(c);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
    
    public List<Category> getAllExceptOne(int categoryId) {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM [Category] where categoryId != ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("categoryId");
                String categoryName = rs.getString("categoryName");
                Category c = new Category(id, categoryName);
                list.add(c);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
    
    public Category getCategoryByCategoryId(int categoryId) {
        Category c = new Category();
        String sql = "SELECT * FROM [Category] where categoryId = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, categoryId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String categoryName = rs.getString("categoryName");
                c = new Category(categoryId, categoryName);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return c;
    }
    
    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        List<Category> category = dao.getAllExceptOne(1);
        for(Category c : category) {
            System.out.println(c);
        }
    }
}
