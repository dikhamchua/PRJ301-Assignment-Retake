/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import model.Cart;

/**
 *
 * @author PHAM KHAC VINH
 */
public class CheckOutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        request.getRequestDispatcher("view/check-out/check-out.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("nameCustomer");
        String phone = request.getParameter("phoneCustomer");
        String address = request.getParameter("addressCustomer");
        String note = request.getParameter("addressCustomer");
        //validate phone and name
        String nameError = "";
        String phoneError = "";
        if (nameError.matches("[a-zA-Z ]+") == false) {
            nameError = "Name must be letter";
        }
        if (phoneError.matches("\\d{10}") == false) {
            phoneError = "Phone must be digits and have 10 numbers";
        }

        //if nameError or phone error => respone check - out controller
        if (nameError.isEmpty() || phoneError.isEmpty()) {
            request.setAttribute("nameError", nameError);
            request.setAttribute("nameError", phoneError);
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
            request.getRequestDispatcher("view/check-out/check-out.jsp").forward(request, response);
        }

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
            totalMoney += order.getQuantity() * order.getProduct().getPrice();
        }
        return totalMoney;
    }

}
