/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import model.Cart;

/**
 *
 * @author PHAM KHAC VINH
 */
public class CartController extends HttpServlet {
   
    


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //prepare
        HttpSession session = request.getSession();
        
        //get cart hashmap 
        HashMap<Integer, Cart> cartHashMap = (HashMap<Integer, Cart>) session.getAttribute("cartHashMap");
        if (cartHashMap == null) {
            cartHashMap = new LinkedHashMap<>();
        }
        System.out.println(cartHashMap.size());
        double totalMoney = 0;
        for (Map.Entry<Integer, Cart> entry : cartHashMap.entrySet()) {
            Cart order = entry.getValue();
            totalMoney += order.getQuantity() * order.getProduct().getPrice();
        }
        
        session.setAttribute("cartHashMap",cartHashMap );
        request.setAttribute("totalMoney", totalMoney);
        request.getRequestDispatcher("view/web/cart-detail/cart.jsp").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    

/** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CartController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

}



