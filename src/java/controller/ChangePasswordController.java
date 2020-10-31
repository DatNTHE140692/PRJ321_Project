/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author #Panda
 */
public class ChangePasswordController extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("pwdchange.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String oldPass = request.getParameter("old-password");
        String newPass = request.getParameter("new-password");
        UserDAO accountDB = new UserDAO();
        User account = (User) session.getAttribute("account");
        boolean isUpdated = accountDB.changePassword(account.getUsername(), oldPass, newPass);
        String errorMsg = isUpdated ? "Password Changed Successfully!" : "Failed to Change Password!";
        request.setAttribute("errorMsg", errorMsg);
        processGet(request, response);
    }

}
