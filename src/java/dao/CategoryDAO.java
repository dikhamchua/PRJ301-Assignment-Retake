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
import model.Category;

/**
 *
 * @author PHAM KHAC VINH
 */
public class CategoryDAO extends DBContext {

    List<Category> listCategories;
    public PreparedStatement statement;
    public ResultSet resultSet;

    public List<Category> getListCategories() {
        return listCategories;
    }

    public CategoryDAO() {
        listCategories = new ArrayList<>();
    }

    /**
     * This function use to load category from database
     *
     */
    public List<Category> loadCategories() {
        List<Category> listCategorys = new ArrayList<>();
        String sql = "select * from [Category]";

        try {
            //prepare sql to statement
            statement = connection.prepareStatement(sql);

            //get result set from database
            resultSet = statement.executeQuery();

            //add all categories to list
            while (resultSet.next()) {
                Category category = Category.builder().
                        id(resultSet.getInt(1)).
                        name(resultSet.getString(2)).
                        build();

                listCategorys.add(category);
            }

        } catch (Exception e) {
            System.out.println("=========================");
            System.out.println("Load database categories in CategoryDAO class: " + e.getMessage());
            System.out.println("=========================");
        }
        return listCategorys;
    }

}
