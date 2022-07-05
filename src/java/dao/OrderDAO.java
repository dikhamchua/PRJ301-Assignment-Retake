/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.sql.Statement;
import model.Order;

/**
 *
 * @author PHAM KHAC VINH
 */
public class OrderDAO extends DBContext {

    public int saveOrder(Order order) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([account_id]\n"
                + "           ,[totalPrice]\n"
                + "           ,[note]\n"
                + "           ,[shipping_id])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";

        try {
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            statement.setInt(1, order.getAccountId());
            statement.setDouble(2, order.getTotalPrice());
            statement.setString(3, order.getNote());
            statement.setInt(4, order.getShippingId());
            
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            while (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println("===========================");
            System.out.println("Loi o saveOrder class Shipping DAO: " + ex.getMessage());
            System.out.println("===========================");
        }
        return -1;
    }

}
