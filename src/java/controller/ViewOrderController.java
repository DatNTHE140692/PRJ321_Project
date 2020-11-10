/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author #Panda
 */
public class ViewOrderController extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderID = request.getParameter("id");
        if (orderID == null || orderID.trim().isEmpty()) {
            response.sendRedirect("history");
        } else {
            int id = Integer.parseInt(orderID);
            ProductDAO productDB = new ProductDAO();
            ArrayList<Product> productsByOrder = productDB.getProductsByOrder(id);
            request.setAttribute("products", productsByOrder);
            request.getRequestDispatcher("viewOrder.jsp").forward(request, response);
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}
