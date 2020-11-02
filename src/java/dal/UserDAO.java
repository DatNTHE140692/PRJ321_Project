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
import model.User;

/**
 *
 * @author #Panda
 */
public class UserDAO extends BaseDAO {

    public User getAccount(String username, String password) {
        try {
            String sql = "SELECT * FROM dbo.Users WHERE username LIKE ? AND password LIKE ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User account = new User();
                account.setUserID(rs.getInt("uid"));
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
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean isAccountExisted(User user) {
        try {
            String sql = "SELECT * FROM dbo.Users WHERE username LIKE ? OR email LIKE ? OR phonenumber LIKE ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getUsername());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPhonenumber());
            ResultSet rs = st.executeQuery();
            return rs.next();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean insert(User user) {
        try {
            String sql = "INSERT INTO dbo.Users (username, password, fullname, email, address, phonenumber, avatarURL) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getUsername());
            st.setString(2, user.getPassword());
            st.setString(3, user.getFullname());
            st.setString(4, user.getEmail());
            st.setString(5, user.getAddress());
            st.setString(6, user.getPhonenumber());
            if (user.getAvatarURL() == null) {
                user.setAvatarURL("assets/img/icon/avatar.png");
            }
            st.setString(7, user.getAvatarURL());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateProfile(User user) {
        try {
            String sql = "UPDATE dbo.Users SET fullname = ?, email = ?, address = ?, phonenumber = ?, avatarURL = ? WHERE username LIKE ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user.getFullname());
            st.setString(2, user.getEmail());
            st.setString(3, user.getAddress());
            st.setString(4, user.getPhonenumber());
            if (user.getAvatarURL().trim().isEmpty()) {
                user.setAvatarURL("assets/img/icon/avatar.png");
            }
            st.setString(5, user.getAvatarURL());
            st.setString(6, user.getUsername());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean changePassword(String userName, String oldPassword, String newPassword) {
        try {
            String sql = "UPDATE dbo.Users SET password = ? WHERE username LIKE ? AND password LIKE ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setString(2, userName);
            st.setString(3, oldPassword);
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
