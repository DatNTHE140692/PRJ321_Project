/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Contact;

/**
 *
 * @author #Panda
 */
public class ContactDAO extends BaseDAO {

    public boolean insert(Contact contact) {
        try {
            String sql = "INSERT INTO dbo.Contact(fullname, email, subject, message) VALUES(?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, contact.getFullName());
            st.setString(2, contact.getEmail());
            st.setString(3, contact.getSubject());
            st.setString(4, contact.getMessage());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(ContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
