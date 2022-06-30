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
public class PageControl {
    private int numberRecordPerPage;
    private int currentPage;
    private int sizeOfList;
    private int numberPage;
    private int begin;
    private int end;
    
}