/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.web;

import dao.ProductDAO;
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
import model.Product;

/**
 *
 * @author PHAM KHAC VINH
 */
public class AddCartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //prepare
        ProductDAO productDAO = new ProductDAO();
        HttpSession session = request.getSession();

        //check hashmap on session ? ... : initalize 
        HashMap<Integer, Cart> cartHashMap = (HashMap<Integer, Cart>) session.getAttribute("cartHashMap");
        if (cartHashMap == null) {
            cartHashMap = new LinkedHashMap<>();
        }

        //get Product by product ID
        int id = Integer.parseInt(request.getParameter("productID"));
        Product product = productDAO.getProductByID(id);

        //check product on hashmap ? renew value : put new value
        if (cartHashMap.containsKey(id)) {
            int oldQuantity = cartHashMap.get(id).getQuantity();
            cartHashMap.get(id).setQuantity(oldQuantity + 1);
        } else {
            cartHashMap.put(id, Cart.builder().product(product).quantity(1).build());
        }
        session.setAttribute("cartHashMap", cartHashMap);
        request.getRequestDispatcher("productDetail?productID=" + id).forward(request, response);

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
            out.println("<title>Servlet AddCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCartController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
