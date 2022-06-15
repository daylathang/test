/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Dept;
import model.Emp;

/**
 *
 * @author Ngo Tung Son
 */
public class DeptDBContext extends DBContext<Dept> {

    @Override
    public ArrayList<Dept> list() {
        ArrayList<Dept> depts = new ArrayList<>();
        try {
            String sql = "SELECT did,dname FROM Dept";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Dept d = new Dept();
                d.setId(rs.getInt("did"));
                d.setName(rs.getString("dname"));
                depts.add(d);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DeptDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return depts;
    }

    @Override
    public Dept get(Dept entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Dept entity) {
        try {
            connection.setAutoCommit(false);
            String sql_insert_dept = "INSERT INTO Dept(did,dname) VALUES(?,?)";
            PreparedStatement stm_insert_dept = connection.prepareStatement(sql_insert_dept);
            stm_insert_dept.setInt(1, entity.getId());
            stm_insert_dept.setString(2, entity.getName());
            stm_insert_dept.executeUpdate();
            for (Emp emp : entity.getEmps()) {
                String sql = "INSERT INTO [Emp]\n"
                        + "           ([ename]\n"
                        + "           ,[gender]\n"
                        + "           ,[dob]\n"
                        + "           ,[did])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?)";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setString(1, emp.getName());
                stm.setBoolean(2, emp.isGender());
                stm.setDate(3, emp.getDob());
                stm.setInt(4, emp.getDept().getId());
                stm.executeUpdate();
            }
            connection.commit();

        } catch (SQLException ex) {
            Logger.getLogger(EmpDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(DeptDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }

    }

    @Override
    public void update(Dept entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Dept entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
