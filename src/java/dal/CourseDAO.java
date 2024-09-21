package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Course;
import model.Category;

public class CourseDAO extends DBContext {

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("categoryId");
                String name = rs.getString("categoryName");
                Category c = new Category(id, name);
                list.add(c);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public boolean isCourseNameDuplicate(String courseName) {
        boolean isDuplicate = false;
        String sql = "SELECT courseId FROM Course WHERE courseName = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, courseName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isDuplicate = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return isDuplicate;
    }

    public boolean addCourse(Course c) {
        boolean f = false;
        if (isCourseNameDuplicate(c.getCourseName())) {
            return false;
        }
        try {
            String sql = "insert into Course(courseName, createdAt, courseDescription) "
                    + "values(?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, c.getCourseName());
            ps.setTimestamp(2, new java.sql.Timestamp(c.getCreatedAt().getTime()));
            ps.setString(3, c.getCourseDescription());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int getCourseId(Course c) {
        int courseId = -1;
        try {
            String sql = "select courseId from Course where courseName = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, c.getCourseName());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                courseId = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courseId;
    }

    public boolean addCourseCategory(int categoryId, int courseId) {
        boolean f = false;
        String sql = "INSERT INTO Course_Category(categoryId, courseId) VALUES (?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ps.setInt(2, courseId);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

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
        List<Category> list = dao.getAllCategories();
        for (Category l : list) {
            System.out.println(l);
        }
    }
}
