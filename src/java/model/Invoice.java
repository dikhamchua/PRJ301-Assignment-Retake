/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author PHAM KHAC VINH
 */
@Builder
@Getter
@Setter
@ToString
public class Invoice {
    private int orderId;
    List<Product> listProduct;
    
    public double amount() {
        double amount = 0;
        for (Product product : listProduct) {
            amount += product.getQuantity() * product.getPrice().getPrice();
        }
        return amount;
    }
}
