/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author PHAM KHAC VINH
 */
public class AccountDAO extends DBContext {

    public  Account getAccount(Account account) {
        String sql = "select * from Account\n"
                + "where username = ? and password = ?";

        try {
            statement = connection.prepareStatement(sql);

            statement.setString(1, account.getUsername());
            statement.setString(2, account.getPassword());
            
            resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                String username =resultSet.getString(2);
                String password = resultSet.getString(3);
                String displayName = resultSet.getString(4);
                String address = resultSet.getString(5);
                String email = resultSet.getString(6);
                String phone = resultSet.getString(7);
                
                Account result = Account.builder()
                        .id(id)
                        .username(username)
                        .password(password)
                        .displayName(displayName)
                        .address(address)
                        .email(email)
                        .phone(phone)
                        .build();
                return result;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
