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
import model.Comment;
import model.Product;

/**
 *
 * @author #Panda
 */
public class ProductDetailsController extends HttpServlet {

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
        if (pid != null || !pid.trim().isEmpty()) {
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
            request.getRequestDispatcher("product_details.jsp").forward(request, response);
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
