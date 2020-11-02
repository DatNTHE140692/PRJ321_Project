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
import model.Comment;
import model.User;

/**
 *
 * @author #Panda
 */
public class CommentDAO extends BaseDAO {

    public ArrayList<Comment> getCommentsByProID(int pid) {
        ArrayList<Comment> comments = new ArrayList<>();
        try {
            String sql = "SELECT pc.cmtid, pc.cdate, pc.comment, u.uid, u.fullname, u.avatarURL FROM dbo.Product_Comments pc INNER JOIN dbo.Users u ON u.uid = pc.uid WHERE pc.pid = ? ORDER BY pc.cdate DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setId(rs.getInt("cmtid"));
                comment.setCmtDate(rs.getTimestamp("cdate"));
                comment.setComment(rs.getString("comment"));
                User user = new User();
                user.setFullname(rs.getString("fullname"));
                user.setAvatarURL(rs.getString("avatarURL"));
                comment.setUser(user);
                comments.add(comment);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comments;
    }

    public boolean addComment(Comment comment) {
        try {
            String sql = "INSERT INTO dbo.Product_Comments(pid, uid, cdate, comment) VALUES (?, ?, GETDATE(), ?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, comment.getPid());
            st.setInt(2, comment.getUser().getUserID());
            st.setString(3, comment.getComment());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
