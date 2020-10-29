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
                account.setAvatarURL(rs.getString("avatarURL"));
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
        try {
            String sql = "INSERT INTO dbo.Account (username, password, fullname, email, address, phonenumber, avatarURL) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getUsername());
            st.setString(2, account.getPassword());
            st.setString(3, account.getFullname());
            st.setString(4, account.getEmail());
            st.setString(5, account.getAddress());
            st.setString(6, account.getPhonenumber());
            st.setString(7, account.getAvatarURL());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateProfile(Account account) {
        try {
            String sql = "UPDATE dbo.Account SET fullname = ?, email = ?, address = ?, phonenumber = ?, avatarURL = ? WHERE username LIKE ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, account.getFullname());
            st.setString(2, account.getEmail());
            st.setString(3, account.getAddress());
            st.setString(4, account.getPhonenumber());
            if (account.getAvatarURL().trim().isEmpty()) {
                account.setAvatarURL("assets/img/icon/avatar.png");
            }
            st.setString(5, account.getAvatarURL());
            st.setString(6, account.getUsername());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean changePassword(String userName, String oldPassword, String newPassword) {
        try {
            String sql = "UPDATE dbo.Account SET password = ? WHERE username LIKE ? AND password LIKE ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setString(2, userName);
            st.setString(3, oldPassword);
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
