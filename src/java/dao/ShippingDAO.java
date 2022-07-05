/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.sql.Statement;
import model.Shipping;

/**
 *
 * @author PHAM KHAC VINH
 */
public class ShippingDAO extends DBContext {

    public int saveShipping(Shipping shipping) {
        String sql = "INSERT INTO [dbo].[Shipping]\n"
                + "           ([name]\n"
                + "           ,[phone]\n"
                + "           ,[address])\n"
                + "     VALUES\n"
                + "           (?,?,?)";

        try {
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            statement.setString(1, shipping.getName());
            statement.setString(2, shipping.getPhone());
            statement.setString(3, shipping.getAddress());
            
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            while (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (SQLException ex) {
            System.out.println("===========================");
            System.out.println("Loi o saveShipping class Shipping DAO: " + ex.getMessage());
            System.out.println("===========================");

        }

        return -1;
    }

}
