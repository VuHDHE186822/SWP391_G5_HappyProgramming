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
import model.Participate;

/**
 *
 * @author Admin
 */
public class ParticipateDAO extends DBContext {

    public List<Participate> getAll() {
        List<Participate> list = new ArrayList<>();
        String sql = "SELECT * FROM [Participate]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int courseId = rs.getInt("courseId");
                String username = rs.getString("username");
                int participateRole = rs.getInt("participateRole");
                int statusId = rs.getInt("statusId");
                Participate p = new Participate(courseId, username, participateRole, statusId);

                list.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Participate> getAllByUsername(String username) {
        List<Participate> list = new ArrayList<>();
        String sql = "SELECT * FROM [Participate] where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int courseId = rs.getInt("courseId");
                int participateRole = rs.getInt("participateRole");
                int statusId = rs.getInt("statusId");
                Participate p = new Participate(courseId, username, participateRole, statusId);

                list.add(p);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }
    
    public static void main(String[] args) {
        ParticipateDAO dao = new ParticipateDAO();
        List<Participate> list = dao.getAll();
        for (Participate l : list) {
            System.out.println(l);
        }
    }
}
