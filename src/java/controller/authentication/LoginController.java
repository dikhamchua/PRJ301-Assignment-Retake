/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dao.AccountDAO;
import dao.InvoiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.HttpCookie;
import java.util.HashMap;
import java.util.List;
import model.Account;
import model.Invoice;
import model.Product;
import utils.IConstant;

/**
 *
 * @author PHAM KHAC VINH
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset = UTF-8");
        Cookie[] cookies = request.getCookies();
        String username = null;
        String password = null;

        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("username")) {
                username = cooky.getValue();
            }
            if (cooky.getName().equals("password")) {
                password = cooky.getValue();
            }

            if (username != null && password != null) {
                break;
            }
        }

        Account account = Account.builder().username(username).password(password).build();
        AccountDAO dao = new AccountDAO();
        Account accountExist = dao.getAccount(account);
        if (accountExist != null) {
            HttpSession session = request.getSession();
            InvoiceDAO invoiceDAO = new InvoiceDAO();

            HashMap<Integer, List<Product>> listInvoice = invoiceDAO.getAllInvoice();
            session.setAttribute("listInvoice", listInvoice);
            response.sendRedirect("home");
        } else {
            request.getRequestDispatcher("view/web/login/login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset = UTF-8");
        //get username + password
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Account account = Account.builder().username(username).password(password).build();
        HttpSession session = request.getSession();

        AccountDAO dao = new AccountDAO();
        //get account from database
        Account accountExist = dao.getAccount(account);

        if (accountExist == null) {
            String error = "Username or password is not correct !!";
            request.setAttribute("error", error);
            request.getRequestDispatcher("view/web/login/login.jsp").forward(request, response);
        } else {
            Cookie usernameCookie = new Cookie("username", username);
            Cookie passwordcCookie = new Cookie("password", password);
            usernameCookie.setMaxAge(60 * 60 * 24 * 2);
            passwordcCookie.setMaxAge(60 * 60 * 24 * 2);

            response.addCookie(usernameCookie);
            response.addCookie(passwordcCookie);
            
            
            InvoiceDAO invoiceDAO = new InvoiceDAO();

            HashMap<Integer, List<Product>> listInvoice = invoiceDAO.getAllInvoice();
            session.setAttribute("listInvoice", listInvoice);
            session.setAttribute("account", accountExist);
            if (accountExist.getRole() == IConstant.roleAdmin) {
                response.sendRedirect("admin/home");
            } else {
                response.sendRedirect("home");
            }
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

}
