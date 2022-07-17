/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web;

import dao.OrderDAO;
import dao.OrderDetailsDAO;
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
import model.Account;
import model.Cart;
import model.Order;
import model.OrderDetails;
import model.Price;
import model.Product;

/**
 *
 * @author PHAM KHAC VINH
 */
public class CheckOutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset = UTF-8");
        //prepare
        HttpSession session = request.getSession();
        //calculate total
        //get cart hashmap 
        HashMap<Integer, Cart> cartHashMap = (HashMap<Integer, Cart>) session.getAttribute("cartHashMap");
        if (cartHashMap == null) {
            cartHashMap = new LinkedHashMap<>();
        }

        double totalMoney = calculateTotalMoney(request, cartHashMap);
        session.setAttribute("cartHashMap", cartHashMap);
        request.setAttribute("totalMoney", totalMoney);
        request.getRequestDispatcher("view/web/check-out/check-out.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset = UTF-8");
        String note = request.getParameter("noteCustomer");
        
        //get cart and total money
        
        HttpSession session = request.getSession();
        
        //get account
        Account account = (Account) session.getAttribute("account");
        //calculate total
        //get cart hashmap 
        HashMap<Integer, Cart> cartHashMap = (HashMap<Integer, Cart>) session.getAttribute("cartHashMap");
        if (cartHashMap == null) {
            cartHashMap = new LinkedHashMap<>();
        }

        double totalMoney = calculateTotalMoney(request, cartHashMap);
        
        
        //save to database
        //save shipping
        //save Order
        Order order  = Order.builder().accountId(account.getId()).
                totalPrice(totalMoney).
                note(note).build();
        int orderID = new OrderDAO().saveOrder(order);
        //save OrderDetail
        OrderDetailsDAO orderDetailsDAO = new OrderDetailsDAO();
        for (Map.Entry<Integer, Cart> entry : cartHashMap.entrySet()) {
            int key = entry.getKey();
            Cart value = entry.getValue();
            Product product =value.getProduct();
            Price price = Price.builder().
                    id(product.getPrice().getId()).
                    build();

                OrderDetails orderDetail  = OrderDetails.builder()
                        .orderId(orderID)
                        .product(product)
                        .price(price)
                        .quantity(value.getQuantity())
                        .build();
                
            
            orderDetailsDAO.saveOrderDetails(orderDetail);
        }
        
        session.removeAttribute("cartHashMap");
        request.getRequestDispatcher("view/web/check-out/thank-you.jsp").forward(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CheckOutController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckOutController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private double calculateTotalMoney(HttpServletRequest request, HashMap<Integer, Cart> cartHashMap) {
        double totalMoney = 0;
        for (Map.Entry<Integer, Cart> entry : cartHashMap.entrySet()) {
            Cart order = entry.getValue();
            totalMoney += order.getQuantity() * order.getProduct().getPrice().getPrice();
        }
        return totalMoney;
    }

}
