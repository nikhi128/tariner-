package DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DButil.DBUtil;
import POJO.Subject;


public class SubjectDAO {

    public void addSubject(Subject subject) throws Exception {
        Connection conn = DBUtil.getConnection();
        String sql = "INSERT INTO subject (name) VALUES (?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, subject.getName());
        ps.executeUpdate();
        ps.close();
        conn.close();
    }

    public List<Subject> getAllSubjects() throws Exception {
        List<Subject> list = new ArrayList<>();
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM subject";
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            Subject s = new Subject();
            s.setId(rs.getInt("id"));
            s.setName(rs.getString("name"));
            list.add(s);
        }
        rs.close();
        stmt.close();
        conn.close();
        return list;
    }
    // my changes 
    public Subject getSubjectById(int id) throws Exception {
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM subject WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        //
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        Subject s = null;
        if (rs.next()) {
            s = new Subject();
            s.setId(rs.getInt("id"));
            s.setName(rs.getString("name"));
        }
        rs.close();
        ps.close();
        conn.close();
        return s;
    }

    public Subject getSubjectByName(String name) throws Exception {
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT * FROM subject WHERE name = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, name);
        ResultSet rs = ps.executeQuery();
        Subject s = null;
        if (rs.next()) {
            s = new Subject();
            s.setId(rs.getInt("id"));
            s.setName(rs.getString("name"));
        }
        rs.close();
        ps.close();
        conn.close();
        return s;
    }
    
    public void deleteSubject(int id) throws Exception {
        Connection conn = DBUtil.getConnection();
        String sql = "DELETE FROM subject WHERE id = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();
        conn.close();
    }

}
