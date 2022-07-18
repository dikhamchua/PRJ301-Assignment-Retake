/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import model.Account;
import model.Invoice;
import model.Price;
import model.Product;

/**
 *
 * @author PHAM KHAC VINH
 */
public class InvoiceDAO extends DBContext {

    public HashMap<Integer, List<Product>> getAllInvoice() {
        HashMap<Integer, List<Product>> listInvoice = new HashMap<>();
        String sql = "select od.order_id, p.name, pri.price, od.quantity, o.created_date\n"
                + "from [Order] as o, OrderDetails as od,\n"
                + "Product as p, Price as pri\n"
                + "where o.id = od.order_id \n"
                + "and p.id = od.productId\n"
                + "and od.priceId = pri.id";

        try {
            statement = connection.prepareStatement(sql);

            resultSet = statement.executeQuery();

            while(resultSet.next()) {
                List<Product> listProduct = new ArrayList<>();
                Price price = Price.builder().price(resultSet.getDouble(3)).build();
                Product product = Product.builder()
                        .name(resultSet.getString(2))
                        .price(price)
                        .quantity(resultSet.getInt(4))
                        .createdDate(resultSet.getString(5))
                        .build();
                listProduct.add(product);
                Invoice invoiceTemp = Invoice.builder()
                        .orderId(resultSet.getInt(1))
                        .listProduct(listProduct)
                        .build();
                if (listInvoice.containsKey(invoiceTemp.getOrderId())) {
                    listInvoice.get(invoiceTemp.getOrderId()).add(product);
                }else {
                    listInvoice.put(invoiceTemp.getOrderId(), listProduct);
                }
                
            }

        } catch (SQLException ex) {
            System.out.println("===========================");
            System.out.println("Loi o getAllInvoice class InvoiceDAO: " + ex.getMessage());
            System.out.println("===========================");
        }
        return listInvoice;
    }
}
