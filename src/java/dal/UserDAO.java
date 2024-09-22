/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    public List<User> getAll() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [User]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                Date dob = rs.getDate("dob");
                String mail = rs.getString("mail");
                Date createdDate = rs.getDate("createdDate");
                String avatarPath = rs.getString("avatarPath");
                String cvPath = rs.getString("cvPath");
                boolean activeStatus = rs.getBoolean("activeStatus");
                boolean isVerified = rs.getBoolean("isVerified");
                String verificationCode = rs.getString("verification_code");
                int roleId = rs.getInt("roleId");
                User u = new User(id, username, password, firstName, lastName, dob, mail, createdDate, avatarPath, cvPath, activeStatus, isVerified, verificationCode, roleId);
                list.add(u);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<User> getAllUserByRoleId(int roleId) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [User] WHERE roleId = ?";
        try (PreparedStatement pre = connection.prepareStatement(sql)) {
            pre.setInt(1, roleId);
            ResultSet rs = pre.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                Date dob = rs.getDate("dob");
                String mail = rs.getString("mail");
                Date createdDate = rs.getDate("createdDate");
                String avatarPath = rs.getString("avatarPath");
                String cvPath = rs.getString("cvPath");
                boolean activeStatus = rs.getBoolean("activeStatus");
                boolean isVerified = rs.getBoolean("isVerified");
                String verificationCode = rs.getString("verification_code");
                list.add(new User(id, username, password, firstName, lastName, dob, mail, createdDate, avatarPath, cvPath, activeStatus, isVerified, verificationCode, roleId));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean checkPassword(int id, String pass) {
        boolean f = false;
        try {
            String sql = "select * from [User] where id = ? and password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                f = true;
            }
        } catch (Exception e) {
        }
        return f;
    }

    public boolean changePass(User u) {
        boolean f = false;
        try {
            String sql = "update [User] set password = ? where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, u.getPassword());
            ps.setInt(2, u.getId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserById(int id) {
        User u = null;
        try {
            String sql = "select * from [User] where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                Date dob = rs.getDate("dob");
                String mail = rs.getString("mail");
                Date createdDate = rs.getDate("createdDate");
                String avatarPath = rs.getString("avatarPath");
                String cvPath = rs.getString("cvPath");
                boolean activeStatus = rs.getBoolean("activeStatus");
                boolean isVerified = rs.getBoolean("isVerified");
                String verificationCode = rs.getString("verification_code");
                int roleId = rs.getInt("roleId");
                u = new User(id, username, password, firstName, lastName, dob, mail, createdDate, avatarPath, cvPath, activeStatus, isVerified, verificationCode, roleId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    public boolean checkUserNameDuplicate(String username) {
        String sql = "SELECT * FROM [dbo].[User] WHERE username = ? AND [activeStatus] = 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username); // Set the username parameter
            ResultSet rs = st.executeQuery();

            if (rs.next()) {

                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    public boolean resetPassWord(String veriCode, String newPass) {
        boolean f = false;
        try {
            String sql = "update [User] set password = ? where [verification_code] = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPass);
            ps.setString(2, veriCode);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public void insertUser(String userName, String password, String firstName, String lastName,
            Date dob, String email, Date createdDate,
            String avatarPath, String cvPath, boolean activeStatus,
            boolean isVerified, String verificationCode, int roleId) {
        String sql = "INSERT INTO [dbo].[User] (username, password, firstName, lastName, dob, mail, createdDate, avatarPath, CVPath, activeStatus, isVerified, verification_code, roleId) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, userName);  // Username
            st.setString(2, password);   // Password
            st.setString(3, firstName);  // First Name
            st.setString(4, lastName);   // Last Name
            st.setDate(5, new java.sql.Date(dob.getTime()));  // Date of Birth
            st.setString(6, email);      // Email
            st.setDate(7, new java.sql.Date(createdDate.getTime()));  // Created Date
            st.setString(8, avatarPath);  // Avatar Path
            st.setString(9, cvPath);      // CV Path
            st.setBoolean(10, activeStatus); // Active Status
            st.setBoolean(11, isVerified);   // Is Verified
            st.setString(12, verificationCode); // Verification Code
            st.setInt(13, roleId); // Role ID

            // Execute the insert
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace(); // Consider logging the error for better tracking
        }
    }

    public boolean updateUserInfo(String username, String firstName, String lastName, Date dob, String email, String avatarPath, String cvPath, boolean activeStatus, boolean isVerified, int roleId) {
        String sql = "UPDATE users SET firstName = ?, lastName = ?, dob = ?, email = ?, avatarPath = ?, cvPath = ?, activeStatus = ?, isVerified = ?, roleId = ? WHERE username = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setDate(3, new java.sql.Date(dob.getTime())); // Convert java.util.Date to java.sql.Date
            pstmt.setString(4, email);
            pstmt.setString(5, avatarPath);
            pstmt.setString(6, cvPath);
            pstmt.setBoolean(7, activeStatus);
            pstmt.setBoolean(8, isVerified);
            pstmt.setInt(9, roleId);
            pstmt.setString(10, username);

            int rowsUpdated = pstmt.executeUpdate();
            return rowsUpdated > 0; // Return true if the update was successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Handle the exception as needed
        }
    }

    public void deleteUser(String username) {
        String sql = "update User set activeStatus = 0 where UserName= ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<User> getUsersBySearchName(String txt) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [dbo].[User] WHERE [firstName] LIKE ? or [lastName] LIKE ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txt + "%");
            st.setString(2, "%" + txt + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String password = rs.getString("password");
                String firstName = rs.getString("firstName");
                String lastName = rs.getString("lastName");
                Date dob = rs.getDate("dob");
                String mail = rs.getString("mail");
                Date createdDate = rs.getDate("createdDate");
                String avatarPath = rs.getString("avatarPath");
                String cvPath = rs.getString("cvPath");
                boolean activeStatus = rs.getBoolean("activeStatus");
                boolean isVerified = rs.getBoolean("isVerified");
                String verificationCode = rs.getString("verification_code");
                int roleId = rs.getInt("roleId");
                User u = new User(id, username, password, firstName, lastName, dob, mail, createdDate, avatarPath, cvPath, activeStatus, isVerified, verificationCode, roleId);
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public void registerUser(User user) {
        String sql = "INSERT INTO [User] (username, [password], firstName, lastName, dob, mail, createdDate, avatarPath, CVPath, activeStatus,isVerified, roleId) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFirstName());
            statement.setString(4, user.getLastName());
            statement.setDate(5, new java.sql.Date(user.getDob().getTime()));
            statement.setString(6, user.getMail());
            statement.setDate(7, new java.sql.Date(user.getCreatedDate().getTime()));
            statement.setString(8, user.getAvatarPath());
            statement.setString(9, user.getCvPath());
            statement.setBoolean(10, user.isActiveStatus());
            statement.setBoolean(11, user.isIsVerified());
            statement.setInt(12, user.getRoleId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
