/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Image;

/**
 *
 * @author PHAM KHAC VINH
 */
public class ImageDAO extends DBContext {

    public boolean saveImage(Image image) {
        String sql = "INSERT INTO [Image]\n"
                + "           ([url])\n"
                + "     VALUES\n"
                + "           (?)";

        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, image.getUrl());
            
            statement.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("===========================");
            System.out.println("Loi o saveImage class ImageDAO : " + ex.getMessage());
            System.out.println("===========================");
        }

        return false;
    }

    public Image getImageBy(String imageURL) {
        String sql = "SELECT TOP (1000) [id]\n"
                + "      ,[url]\n"
                + "  FROM [ShoppingOnline].[dbo].[Image]\n"
                + "  where [url] = ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, imageURL);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Image image = Image.builder().
                        id(resultSet.getInt(1)).
                        url(resultSet.getString(2)).
                        build();
                return image;
            }
        } catch (SQLException ex) {
            System.out.println("===========================");
            System.out.println("Loi o getImageBy class ImageDAO : " + ex.getMessage());
            System.out.println("===========================");
        }
        return null;
    }
}
