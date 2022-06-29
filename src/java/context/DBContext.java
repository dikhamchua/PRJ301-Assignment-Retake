/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author PHAM KHAC VINH
 */
public class DBContext {

    protected Connection connection;
    protected String error;
    public DBContext() {
        try {
            // Edit URL,username,password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName=ShoppingOnline";
            String username = "sa";
            String password = "123";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            error = "Loi file DB context";
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public String getError() {
        return error;
    }
    
    
}
