//package DAO;
//
//
//import java.sql.*;
//import java.util.*;
//
//import DButil.DBUtil;
//import POJO.Trainer;
//
//public class TrainerDAO {
//
//	public void addTrainer(Trainer t) throws Exception {
//	    Connection con = DBUtil.getConnection();
//	    con.setAutoCommit(true); // Ensure auto-commit is on
//	    PreparedStatement ps = con.prepareStatement(
//	        "INSERT INTO trainer(name, subject) VALUES(?, ?)"
//	    );
//	    ps.setString(1, t.getName());
//	    ps.setString(2, t.getSubject());
//	    int rows = ps.executeUpdate();
//	    System.out.println("Rows inserted: " + rows);
//	    con.close();
//	}
//
//
//    public List<Trainer> getAllTrainers() throws Exception {
//        Connection con = DBUtil.getConnection();
//        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM trainer");
//        List<Trainer> list = new ArrayList<>();
//        while (rs.next()) {
//            Trainer t = new Trainer();
//            t.setEmpId(rs.getInt("id"));
//            t.setName(rs.getString("name"));
//            t.setSubject(rs.getString("subject"));
//            list.add(t);
//        }
//        con.close();
//        return list;
//    }
//
//    public void deleteTrainer(int id) throws Exception {
//        Connection con = DBUtil.getConnection();
//        PreparedStatement ps = con.prepareStatement("DELETE FROM trainer WHERE id=?");
//        ps.setInt(1, id);
//        ps.executeUpdate();
//        con.close();
//    }
//
//    public Trainer getTrainerById(int id) throws Exception {
//        Connection con = DBUtil.getConnection();
//        PreparedStatement ps = con.prepareStatement("SELECT * FROM trainer WHERE id=?");
//        ps.setInt(1, id);
//        ResultSet rs = ps.executeQuery();
//        Trainer t = null;
//        if (rs.next()) {
//            t = new Trainer();
//            t.setEmpId(rs.getInt("id"));
//            t.setName(rs.getString("name"));
//            t.setSubject(rs.getString("subject"));
//        }
//        con.close();
//        return t;
//    }
//
//    public List<Trainer> getTrainerBySubject(String subject) throws Exception {
//        Connection con = DBUtil.getConnection();
//        PreparedStatement ps = con.prepareStatement("SELECT * FROM trainer WHERE subject=?");
//        ps.setString(1, subject);
//        ResultSet rs = ps.executeQuery();
//        List<Trainer> list = new ArrayList<>();
//        while (rs.next()) {
//            Trainer t = new Trainer();
//            t.setEmpId(rs.getInt("id"));
//            t.setName(rs.getString("name"));
//            t.setSubject(rs.getString("subject"));
//            list.add(t);
//        }
//        con.close();
//        return list;
//    }
//}



package DAO;

import java.sql.*;
import java.util.*;

import DButil.DBUtil;
import POJO.Trainer;

public class TrainerDAO {

    // ➕ Add new trainer
    public void addTrainer(Trainer t) throws Exception {
        Connection con = DBUtil.getConnection();
        con.setAutoCommit(true);
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO trainer(name, subject) VALUES(?, ?)"
        );
        ps.setString(1, t.getName());
        ps.setString(2, t.getSubject());
        int rows = ps.executeUpdate();
        System.out.println("Rows inserted: " + rows);
        con.close();
    }

    // 📋 Get all trainers
    public List<Trainer> getAllTrainers() throws Exception {
        Connection con = DBUtil.getConnection();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM trainer");
        List<Trainer> list = new ArrayList<>();
        while (rs.next()) {
            Trainer t = new Trainer();
            t.setEmpId(rs.getInt("id"));
            t.setName(rs.getString("name"));
            t.setSubject(rs.getString("subject"));
            list.add(t);
        }
        con.close();
        return list;
    }

    // ❌ Delete trainer by ID
    public void deleteTrainer(int id) throws Exception {
        Connection con = DBUtil.getConnection();
        PreparedStatement ps = con.prepareStatement("DELETE FROM trainer WHERE id=?");
        ps.setInt(1, id);
        ps.executeUpdate();
        con.close();
    }

    // 🔎 Search trainer by ID
    public Trainer getTrainerById(int id) throws Exception {
        Connection con = DBUtil.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM trainer WHERE id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        Trainer t = null;
        if (rs.next()) {
            t = new Trainer();
            t.setEmpId(rs.getInt("id"));
            t.setName(rs.getString("name"));
            t.setSubject(rs.getString("subject"));
        }
        con.close();
        return t;
    }

    // 🔎 Search trainer by Name
    public Trainer getTrainerByName(String name) throws Exception {
        Connection con = DBUtil.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM trainer WHERE name = ?");
        ps.setString(1, name);
        ResultSet rs = ps.executeQuery();
        Trainer t = null;
        if (rs.next()) {
            t = new Trainer();
            t.setEmpId(rs.getInt("id"));
            t.setName(rs.getString("name"));
            t.setSubject(rs.getString("subject"));
        }
        con.close();
        return t;
    }
}

