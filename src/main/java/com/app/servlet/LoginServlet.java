package com.app.servlet;

import com.app.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO dao = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (dao.validateAdmin(username, password)) {
            HttpSession session = req.getSession();
            session.setAttribute("admin", username);
            res.sendRedirect("users");
        } else {
            req.setAttribute("error", "Invalid username or password!");
            req.getRequestDispatcher("/login.jsp").forward(req, res);
        }
    }
}
