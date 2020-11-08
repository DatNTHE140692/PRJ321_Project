/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Product;
import model.User;

/**
 *
 * @author #Panda
 */
public class RemoveCartItemController extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("id");
        if (pid != null && !pid.trim().isEmpty()) {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            Product productToRemove = new Product();
            productToRemove.setId(Integer.parseInt(pid));
            boolean isExisted = false;
            ArrayList<Product> productList = user.getProductList();
            for (Product product : productList) {
                if (productToRemove.getId() == product.getId()) {
                    productToRemove = product;
                    isExisted = true;
                    break;
                }
            }
            if (isExisted) {
                boolean isRemoved = productList.remove(productToRemove);
                if (isRemoved) {
                    response.sendRedirect("cart");
                } else {
                    response.getWriter().println("Unable to Remove!");
                }
            } else {
                response.getWriter().println("Unable to Remove!");
            }
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
