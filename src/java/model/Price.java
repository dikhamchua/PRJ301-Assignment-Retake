/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
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
public class Price {
    private int id;
    private double price;
    private Date date;
    
}
