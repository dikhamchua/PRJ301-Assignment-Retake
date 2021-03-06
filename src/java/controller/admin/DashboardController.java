/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.PageControl;
import model.Product;
import utils.IConstant;

/**
 *
 * @author PHAM KHAC VINH
 */
public class DashboardController extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
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
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset = UTF-8");
        //create instance
        CategoryDAO categoryDAO = new CategoryDAO();
        ProductDAO productDAO = new ProductDAO();
        //load database
        categoryDAO.loadCategories();
        productDAO.loadProduct();

        HttpSession session = request.getSession();

        //get list product
        List<Product> listProduct = (List<Product>) session.getAttribute("listProducts");
        if (listProduct == null) {
            listProduct = productDAO.getListProducts();
        }

        int nrpp = IConstant.NUMBER_RECORD_PPAGE;
        int sizeListProduct = listProduct.size();
        int numberPage = getNumberPage(sizeListProduct, nrpp);
        //pagination
        int currentPage = getCurrentPage(request, numberPage);

        int begin = (currentPage - 1) * nrpp;
        int end = (currentPage) * nrpp > sizeListProduct
                ? sizeListProduct : (currentPage) * nrpp - 1;

        PageControl pageControl = PageControl.builder().
                numberRecordPerPage(nrpp).
                currentPage(currentPage).
                sizeOfList(sizeListProduct).
                numberPage(numberPage).
                begin(begin).
                end(end).build();

        session.setAttribute("listProducts", listProduct);
        request.setAttribute("numberPage", numberPage);
        request.setAttribute("pageControl", pageControl);
        request.setAttribute("page", currentPage);

        session.setAttribute("listProducts", listProduct);
        session.setAttribute("listCategories", categoryDAO.loadCategories());
        request.getRequestDispatcher("../view/admin/dashboard/dashboard-admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private int getNumberPage(int sizeListProduct, int nrpp) {
        if (sizeListProduct % 2 == 1) {
            return (sizeListProduct / nrpp) + 1;
        } else {
            return (sizeListProduct / nrpp);
        }
    }

    private int getCurrentPage(HttpServletRequest request, int numberPage) {
        int currentPage;
        if (request.getParameter("page") == null) {
            currentPage = 1;
        } else {
            try {
                currentPage = Integer.parseInt(request.getParameter("page"));
                if (currentPage <= 0 || currentPage > numberPage) {
                    currentPage = 1;
                }

            } catch (Exception e) {
                currentPage = 1;
            }
        }
        return currentPage;
    }

}
