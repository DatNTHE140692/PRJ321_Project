/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

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
        AccountDAO accountDB = new AccountDAO();
        Account account = (Account) session.getAttribute("account");
        boolean isUpdated = accountDB.changePassword(account.getUsername(), oldPass, newPass);
        if (isUpdated) {
            session.invalidate();
            response.getWriter().println("<script>alert('Password Change Success!')</script>");
            response.sendRedirect("home");
        } else {
            response.getWriter().println("<script>alert('Password Change Failed!')</script>");
        }
    }

}
