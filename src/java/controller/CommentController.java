/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CommentDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Comment;
import model.User;

/**
 *
 * @author #Panda
 */
public class CommentController extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("pid");
        int pid = Integer.parseInt(id);
        String message = request.getParameter("message");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Comment comment = new Comment();
        comment.setPid(pid);
        comment.setUser(user);
        comment.setComment(message);
        CommentDAO commentDB = new CommentDAO();
        boolean isAdded = commentDB.addComment(comment);
        if (isAdded) {
            response.sendRedirect("product_details?id=" + pid);
        }
    }

}
