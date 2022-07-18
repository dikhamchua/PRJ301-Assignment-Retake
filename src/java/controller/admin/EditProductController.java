/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.ImageDAO;
import dao.PriceDAO;
import dao.ProductDAO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Image;
import model.Price;
import model.Product;
import utils.IConstant;

/**
 *
 * @author PHAM KHAC VINH
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 50, // 50MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class EditProductController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset = UTF-8");
        ProductDAO productDAO = new ProductDAO();
        //get Product by ID
        int productId = Integer.parseInt(request.getParameter("productID"));
        Product product = productDAO.getProductByID(productId);

        request.setAttribute("product", product);

        request.getRequestDispatcher("../view/admin/dashboard/edit-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset = UTF-8");
        //get parameter
        int idProduct = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("name");
        double priceProduct = Double.parseDouble(request.getParameter("price"));
        String descriptionProduct = request.getParameter("description");
        int quantityProduct = Integer.parseInt(request.getParameter("quantity"));
        int categoryId = Integer.parseInt(request.getParameter("categoryProduct"));

        //prepare
        ImageDAO imageDAO = new ImageDAO();
        ProductDAO productDAO = new ProductDAO();
        PriceDAO priceDao = new PriceDAO();

        if (priceProduct < 0) {
            priceProduct = 0;
        }
        if (quantityProduct < 0) {
            quantityProduct = 0;
        }

        // Process the uploaded file and obtain the file upload field according to the name
        Part profile = request.getPart("photo");
        String filename = profile.getSubmittedFileName();
        String url = "";
        int idImage = 0;
        Product product = productDAO.getProductByID(idProduct);
        if (!filename.trim().isEmpty()) {
            //write image to folder
            //get image product
            String uploadFolder = request.getServletContext().getRealPath(IConstant.FOLDER_PRODUCT);
            String UPLOAD_DIRECTORY = Paths.get(uploadFolder).toString();
            // Get the original file name of the uploaded file
            InputStream inputStream = profile.getInputStream();
            OutputStream outputStream = new FileOutputStream(UPLOAD_DIRECTORY + File.separator + filename);
            byte[] bytes = new byte[1024];
            int len = 0;
            while ((len = inputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, len);
                outputStream.flush();
            }
            outputStream.close();
            inputStream.close();

            //check image exist in database
            url = IConstant.FOLDER_PRODUCT + "/" + filename;
            Image imageInList = imageDAO.getImageBy(url);
            if (imageInList == null) {
                Image image = Image.builder().
                        url(url)
                        .build();
                imageDAO.saveImage(image);
                imageInList = imageDAO.getImageBy(url);
            }
            idImage = imageInList.getId();
            //edit url of product
        } else {
            idImage = imageDAO.getImageBy(product.getImageUrl()).getId();
        }
        Product productUpdate;
        if (product.getPrice().getPrice() == priceProduct) {
             productUpdate = Product.builder().
                    id(idProduct).
                    name(nameProduct).
                    quantity(quantityProduct).
                    price(product.getPrice()).
                    description(descriptionProduct).
                    imageUrl(url).
                    categoryId(categoryId)
                    .build();
        }else {
            Price price = Price.builder().price(priceProduct).build();
            price.setId(priceDao.savePrice(price));
            productUpdate = Product.builder().
                    id(idProduct).
                    name(nameProduct).
                    quantity(quantityProduct).
                    price(price).
                    description(descriptionProduct).
                    imageUrl(url).
                    categoryId(categoryId)
                    .build();
        }


        productDAO.updateProduct(productUpdate, idImage);
        request.getRequestDispatcher("search?keyword=").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
