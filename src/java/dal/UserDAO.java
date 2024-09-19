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
                User u = new User(username, password, firstName, lastName, dob, mail, createdDate, avatarPath, cvPath, activeStatus, isVerified, verificationCode, roleId);
                list.add(u);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
    
    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        List<User> list = dao.getAll();
        for (User l : list) {
            System.out.println(l);
        }
    }
}
