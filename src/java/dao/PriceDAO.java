/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.sql.Statement;
import model.Order;
import model.Price;

/**
 *
 * @author PHAM KHAC VINH
 */
public class PriceDAO extends DBContext {

    public int savePrice(Price price) {
        String sql = "INSERT INTO [dbo].[Price]\n"
                + "           ([price])\n"
                + "           \n"
                + "     VALUES\n"
                + "           (?)";

        try {
            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            statement.setDouble(1, price.getPrice());

            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
            while (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println("===========================");
            System.out.println("Loi o savePrice class PriceDAO: " + ex.getMessage());
            System.out.println("===========================");
        }
        return -1;
    }
}
