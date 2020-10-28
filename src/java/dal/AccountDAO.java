/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author #Panda
 */
public class AccountDAO extends BaseDAO {

    public Account getAccount(String username, String password) {
        try {
            String sql = "SELECT * FROM dbo.Account WHERE username LIKE ? AND password LIKE ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString("username"));
                account.setPassword(rs.getString("password"));
                account.setFullname(rs.getString("fullname"));
                account.setAddress(rs.getString("address"));
                account.setEmail(rs.getString("email"));
                account.setPhonenumber(rs.getString("phonenumber"));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean isAccountExisted(Account account) {
        boolean isExisted = false;
        try {
            String sql = "SELECT * FROM dbo.Account WHERE username LIKE ? OR email LIKE ? OR phonenumber LIKE ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setString(2, account.getEmail());
            st.setString(3, account.getPhonenumber());
            ResultSet rs = st.executeQuery();
            isExisted = rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isExisted;
    }

    public boolean insert(Account account) {
        boolean isInserted = false;
        try {
            String sql = "INSERT INTO dbo.Account (username, password, fullname, email, address, phonenumber) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setString(3, account.getFullname());
            st.setString(4, account.getEmail());
            st.setString(5, account.getAddress());
            st.setString(6, account.getPhonenumber());
            isInserted = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isInserted;
    }
}
