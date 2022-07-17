/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Price;
import model.Product;

/**
 *
 * @author PHAM KHAC VINH
 */
public class ProductDAO extends DBContext {

    List<Product> listProducts;

    public ProductDAO() {
        listProducts = new ArrayList<>();
    }

    public List<Product> getListProducts() {
        return listProducts;
    }

    public void loadProduct() {
        String sql = " select p.id, p.name, p.quantity,pri.id,pri.price, \n"
                + "p.description,i.url, p.created_date, p.category_id\n"
                + "from Product as p, Image as i, Price as pri\n"
                + "where p.imageUrl = i.id \n"
                + "and p.priceId = pri.id";
        try {
            statement = connection.prepareStatement(sql);

            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Price price = Price.builder().
                        id(resultSet.getInt(4)).
                        price(resultSet.getDouble(5)).
                        build();
                
                Product product = Product.builder().
                        id(resultSet.getInt(1)).
                        name(resultSet.getString(2)).
                        quantity(resultSet.getInt(3)).
                        price(price).
                        createdDate(resultSet.getString(8)).
                        description(resultSet.getString(6)).
                        imageUrl(resultSet.getString(7)).
                        categoryId(resultSet.getInt(9)).
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
        String sql = "select p.id, p.name, p.quantity,pri.id,pri.price, \n"
                + "p.description,i.url, p.created_date, p.category_id\n"
                + "from Product as p, Image as i, Price as pri\n"
                + "where p.imageUrl = i.id \n"
                + "and p.priceId = pri.id and p.id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Price price = Price.builder().
                        id(resultSet.getInt(4)).
                        price(resultSet.getDouble(5)).
                        build();
                
                Product product = Product.builder().
                        id(resultSet.getInt(1)).
                        name(resultSet.getString(2)).
                        quantity(resultSet.getInt(3)).
                        price(price).
                        createdDate(resultSet.getString(8)).
                        description(resultSet.getString(6)).
                        imageUrl(resultSet.getString(7)).
                        categoryId(resultSet.getInt(9)).
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

    public List<Product> getProductsByCategoryID(int categoryID) {
        List<Product> listProductByCategory = new ArrayList<>();

        String sql = "select p.id, p.name, p.quantity,pri.id,pri.price, \n"
                + "p.description,i.url, p.created_date, p.category_id\n"
                + "from Product as p, Image as i, Price as pri\n"
                + "where p.imageUrl = i.id \n"
                + "and p.priceId = pri.id and p.category_id = ?";
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, categoryID);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Price price = Price.builder().
                        id(resultSet.getInt(4)).
                        price(resultSet.getDouble(5)).
                        build();
                
                Product product = Product.builder().
                        id(resultSet.getInt(1)).
                        name(resultSet.getString(2)).
                        quantity(resultSet.getInt(3)).
                        price(price).
                        createdDate(resultSet.getString(8)).
                        description(resultSet.getString(6)).
                        imageUrl(resultSet.getString(7)).
                        categoryId(resultSet.getInt(9)).
                        build();
                listProductByCategory.add(product);
            }
        } catch (Exception e) {
            System.out.println("=========================");
            System.out.println("get Products by categoryID in ProductDAO class: " + e.getMessage());
            System.out.println("=========================");
        }
        return listProductByCategory;
    }

    public List<Product> getProductsByKeyword(String keyword) {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select p.id, p.name, p.quantity,pri.id,pri.price, \n"
                + "p.description,i.url, p.created_date, p.category_id\n"
                + "from Product as p, Image as i, Price as pri\n"
                + "where p.imageUrl = i.id \n"
                + "and p.priceId = pri.id and p.name like ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + keyword + "%");

            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Price price = Price.builder().
                        id(resultSet.getInt(4)).
                        price(resultSet.getDouble(5)).
                        build();
                
                Product product = Product.builder().
                        id(resultSet.getInt(1)).
                        name(resultSet.getString(2)).
                        quantity(resultSet.getInt(3)).
                        price(price).
                        createdDate(resultSet.getString(8)).
                        description(resultSet.getString(6)).
                        imageUrl(resultSet.getString(7)).
                        categoryId(resultSet.getInt(9)).
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

    public void updateQuantity(int productID, int quantityUpdate) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [quantity] = ?\n"
                + " WHERE id = ?";

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1, quantityUpdate);
            statement.setInt(2, productID);
            statement.executeUpdate();
        } catch (Exception ex) {
            System.out.println("=========================");
            System.out.println("updateQuantity in ProductDAO class: " + ex.getMessage());
            System.out.println("=========================");
        }
    }

//    public void updateProduct(Product product, int imageID) {
//
//        String sql = "UPDATE [Product]\n"
//                + "   SET \n"
//                + "      [name] = ?\n"
//                + "      ,[quantity] = ?\n"
//                + "      ,[price] = ?\n"
//                + "      ,[description] = ?\n"
//                + "      ,[imageUrl] = ?\n"
//                + "      ,[category_id] = ?\n"
//                + " WHERE id = ?";
//        try {
//            statement = connection.prepareStatement(sql);
//            statement.setString(1, product.getName());
//            statement.setInt(2, product.getQuantity());
//            statement.setDouble(3, product.getPrice());
//            statement.setString(4, product.getDescription());
//            statement.setInt(5, imageID);
//            statement.setInt(6, product.getCategoryId());
//            statement.setInt(7, product.getId());
//            statement.executeUpdate();
//
//        } catch (SQLException ex) {
//            System.out.println("=========================");
//            System.out.println("updateProduct in ProductDAO class: " + ex.getMessage());
//            System.out.println("=========================");
//        }
//
//    }
}
