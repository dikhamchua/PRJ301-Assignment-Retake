/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.sql.Statement;
import model.OrderDetails;

/**
 *
 * @author PHAM KHAC VINH
 */
public class OrderDetailsDAO extends DBContext {

    public int saveOrderDetails(OrderDetails orderDetails) {
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([order_id]\n"
                + "           ,[productId]\n"
                + "           ,[priceId]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";

        try {
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            statement.setInt(1, orderDetails.getOrderId());
            statement.setInt(2, orderDetails.getProduct().getId());
            statement.setInt(3, orderDetails.getProduct().getPrice().getId());
            statement.setInt(4, orderDetails.getQuantity());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            while (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (SQLException ex) {
            System.out.println("===========================");
            System.out.println("Loi o saveOrderDetails class OrderDetails DAO: " + ex.getMessage());
            System.out.println("===========================");

        }

        return -1;
    }
}
