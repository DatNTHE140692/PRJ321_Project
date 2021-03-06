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
public class CartController extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ArrayList<Product> productList = user.getProductList();
        String[] productQuantities = request.getParameterValues("quantity");
        String[] productIDs = request.getParameterValues("pid");
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == Integer.parseInt(productIDs[i])) {
                productList.get(i).setQuantity(Integer.parseInt(productQuantities[i]));
            }
        }
        doGet(request, response);
    }

}
