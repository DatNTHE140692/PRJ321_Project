/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author #Panda
 */
public class CheckoutController extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user.getProductList().isEmpty()) {
            response.sendRedirect("cart");
        } else {
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String orderNotes = request.getParameter("message");
        float cartTotal = Float.parseFloat(request.getParameter("cartTotal"));
        orderNotes = (orderNotes == null || orderNotes.trim().isEmpty()) ? "" : orderNotes;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ArrayList<Product> productList = user.getProductList();
        Order order = new Order();
        User u = new User();
        u.setUserID(user.getUserID());
        u.setFullname(name);
        u.setEmail(email);
        u.setPhonenumber(phone);
        u.setAddress(address);
        order.setUser(u);
        order.setOrderNotes(orderNotes);
        order.setProducts(productList);
        order.setCartTotal(cartTotal);
        OrderDAO orderDB = new OrderDAO();
        orderDB.insert(order);
        productList.clear();
        response.sendRedirect("home");
    }

}
