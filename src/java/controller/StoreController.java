/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CategoryDAO;
import dal.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author #Panda
 */
public class StoreController extends HttpServlet {

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
        String page = request.getParameter("page");
        if (page == null || page.trim().isEmpty()) {
            page = "1";
        }
        int pageIndex = Integer.parseInt(page);
        int pageSize = 6;
        int totalRecords = -1;
        ProductDAO productDB = new ProductDAO();
        ArrayList<Product> products = new ArrayList<>();
        String cateId = request.getParameter("cid");
        if (cateId == null || cateId.trim().isEmpty()) {
            totalRecords = productDB.getTotalProducts();
            products = productDB.getStoreProducts(pageIndex, pageSize);
        } else {
            int cid = Integer.parseInt(cateId);
            totalRecords = productDB.getTotalProductsByCID(cid);
            products = productDB.getProductsByCID(cid, pageIndex, pageSize);
            request.setAttribute("cid", cid);
        }
        int totalPages = (totalRecords % pageSize == 0) ? (totalRecords / pageSize) : (totalRecords / pageSize + 1);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalRecords", totalRecords);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("products", products);
        CategoryDAO categoryDB = new CategoryDAO();
        ArrayList<Category> categories = categoryDB.getCategories();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("store.jsp").forward(request, response);
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
