/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

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
public class OrderDetails {
    private int id;
    private int orderId;
    private Product product;
    private Price price;
    private int quantity;
}
