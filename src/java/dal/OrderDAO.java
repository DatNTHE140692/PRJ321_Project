/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author #Panda
 */
public class OrderDAO extends BaseDAO {

    public void insert(Order order) {
        try {
            String sql = "INSERT INTO dbo.Orders(orderDate, userID, fullName, address, email, phoneNumber, orderNotes, orderTotal) VALUES  (GETDATE(), ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, order.getUser().getUserID());
            st.setString(2, order.getUser().getFullname());
            st.setString(3, order.getUser().getAddress());
            st.setString(4, order.getUser().getEmail());
            st.setString(5, order.getUser().getPhonenumber());
            st.setString(6, order.getOrderNotes());
            st.setFloat(7, order.getCartTotal());
            st.executeUpdate();
            sql = "SELECT TOP 1 orderID FROM dbo.Orders ORDER BY orderID DESC";
            st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            int orderId = -1;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }
            order.setId(orderId);
            sql = "INSERT INTO dbo.OrderDetails(orderID, productID, quantity) VALUES (?, ?, ?)";
            st = connection.prepareStatement(sql);
            for (Product product : order.getProducts()) {
                st.setInt(1, order.getId());
                st.setInt(2, product.getId());
                st.setInt(3, product.getQuantity());
                st.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Order> getOrders(int userID) {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            String sql = "SELECT * FROM dbo.Orders WHERE userID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {                
                Order order = new Order();
                order.setId(rs.getInt("orderID"));
                order.setOrderTime(rs.getTimestamp("orderDate"));
                order.setCartTotal(rs.getFloat("orderTotal"));
                order.setOrderNotes(rs.getString("orderNotes"));
                User user = new User();
                user.setUserID(userID);
                user.setFullname(rs.getString("fullName"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                user.setPhonenumber(rs.getString("phoneNumber"));
                order.setUser(user);
                orders.add(order);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orders;
    }
    
}
