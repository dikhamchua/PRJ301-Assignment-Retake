/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Product;

/**
 *
 * @author PHAM KHAC VINH
 */
public class ProductDAO extends DBContext {

    List<Product> listProducts;
    public PreparedStatement statement;
    public ResultSet resultSet;

    public ProductDAO() {
        listProducts = new ArrayList<>();
    }

    public List<Product> getListProducts() {
        return listProducts;
    }

    public void loadProduct() {
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "      ,[quantity]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[imageUrl]\n"
                + "      ,[created_date]\n"
                + "      ,[category_id]\n"
                + "  FROM [dbo].[Product]";
        try {
            statement = connection.prepareStatement(sql);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Product product = Product.builder().
                        id(resultSet.getInt(1)).
                        name(resultSet.getString(2)).
                        quantity(resultSet.getInt(3)).
                        price(resultSet.getDouble(4)).
                        description(resultSet.getString(5)).
                        imageUrl(resultSet.getString(6)).
                        createdDate(resultSet.getString(7)).
                        categoryId(resultSet.getInt(8)).
                        build();
                listProducts.add(product);
            }
        } catch (Exception e) {
            System.out.println("=========================");
            System.out.println("Load database products in ProductDAO class: " + e.getMessage());
            System.out.println("=========================");
        }
    }

    public Product getProductByID(int id) {
        String sql = "select * from Product\n"
                + "where id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Product product = Product.builder().
                        id(resultSet.getInt(1)).
                        name(resultSet.getString(2)).
                        quantity(resultSet.getInt(3)).
                        price(resultSet.getDouble(4)).
                        description(resultSet.getString(5)).
                        imageUrl(resultSet.getString(6)).
                        createdDate(resultSet.getString(7)).
                        categoryId(resultSet.getInt(8)).
                        build();
                return product;
            }
        } catch (Exception e) {
            System.out.println("=========================");
            System.out.println("getProductByID in ProductDAO class: " + e.getMessage());
            System.out.println("=========================");
        }
        return null;
    }

    public void getProductsByCategoryID(int categoryID) {

        String sql = "select * from Product\n"
                + "where category_id = ? ";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryID);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Product product = Product.builder().
                        id(resultSet.getInt(1)).
                        name(resultSet.getString(2)).
                        quantity(resultSet.getInt(3)).
                        price(resultSet.getDouble(4)).
                        description(resultSet.getString(5)).
                        imageUrl(resultSet.getString(6)).
                        createdDate(resultSet.getString(7)).
                        categoryId(resultSet.getInt(8)).
                        build();
                listProducts.add(product);
            }
        } catch (Exception e) {
            System.out.println("=========================");
            System.out.println("get Products by categoryID in ProductDAO class: " + e.getMessage());
            System.out.println("=========================");
        }
    }

    public List<Product> getProductsByKeyword(String keyword) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from Product\n"
                + "where [name] like ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");

            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Product product = Product.builder().
                        id(resultSet.getInt(1)).
                        name(resultSet.getString(2)).
                        quantity(resultSet.getInt(3)).
                        price(resultSet.getDouble(4)).
                        description(resultSet.getString(5)).
                        imageUrl(resultSet.getString(6)).
                        createdDate(resultSet.getString(7)).
                        categoryId(resultSet.getInt(8)).
                        build();
                listProduct.add(product);
            }
        } catch (Exception e) {
            System.out.println("=========================");
            System.out.println("get Products by keyword in ProductDAO class: " + e.getMessage());
            System.out.println("=========================");
        }
        return listProduct;
    }
}
