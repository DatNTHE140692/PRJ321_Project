/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CommentDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Comment;
import model.Product;
import model.User;

/**
 *
 * @author #Panda
 */
public class ProductController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pid = request.getParameter("id");
        if (pid != null && !pid.trim().isEmpty()) {
            String pageId = request.getParameter("page");
            if (pageId == null || pageId.trim().isEmpty()) {
                pageId = "1";
            }
            int id = Integer.parseInt(pid);
            int pageIndex = Integer.parseInt(pageId);
            final int pageSize = 5;
            CommentDAO commentDB = new CommentDAO();
            ArrayList<Comment> comments = commentDB.getCommentsByProID(id, pageIndex, pageSize);
            int totalRecords = commentDB.getTotalComments(id);
            int totalPages = (totalRecords % pageSize == 0) ? (totalRecords / pageSize) : (totalRecords / pageSize + 1);
            ProductDAO productDB = new ProductDAO();
            Product product = productDB.getProductByID(id);
            product.setComments(comments);
            request.setAttribute("pid", id);
            request.setAttribute("pageIndex", pageIndex);
            request.setAttribute("totalPages", totalPages);
            request.setAttribute("product", product);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } else {
            response.sendRedirect("store");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDAO productDB = new ProductDAO();
        String pid = request.getParameter("id");
        String quan = request.getParameter("quantity");
        int id = Integer.parseInt(pid);
        int quantity = Integer.parseInt(quan);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ArrayList<Product> productList = user.getProductList();
        boolean isExisted = false;
        Product currentProduct = null;
        for (Product product : productList) {
            if (product.getId() == id) {
                isExisted = true;
                currentProduct = product;
                break;
            }
        }
        if (isExisted) {
            currentProduct.setQuantity(currentProduct.getQuantity() + quantity);
        } else {
            currentProduct = productDB.getProductByID(id);
            currentProduct.setQuantity(quantity);
            productList.add(currentProduct);
        }
        response.sendRedirect("product?id=" + id);
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
