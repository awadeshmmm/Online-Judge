/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.*;

public class DAOservice {

    public static Connection con;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/codeJudge";
            con = DriverManager.getConnection(url, "root", "1234class");
        } catch (Exception e) {
            System.out.println("connection error :" + e.getMessage());
        }

    }

    public static Connection getConnection() {
        return con;
    }

    public static int updateData(String query) {
        try {
            Statement st = con.createStatement();
            //String q = "insert into user_register (name , branch, year ,password) values ('awadesh','cse','second','awadesh');" ;

            int ar = st.executeUpdate(query);
            return ar;
        } catch (Exception e) {
            System.out.println("DML  query error" + e.getMessage());
            return 0;
        }
    }

    public static ResultSet selectData(String query) {
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            return rs;

        } catch (Exception e) {
            System.out.println("projection query error:" + e.getMessage());
            return null;
        }
    }
}
