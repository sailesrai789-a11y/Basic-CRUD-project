package com.app.servlet;

import com.app.dao.UserDAO;
import com.app.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/users")
public class UserServlet extends HttpServlet {

    private UserDAO dao = new UserDAO();

    private boolean isLoggedIn(HttpServletRequest req) {
        HttpSession session = req.getSession(false);
        return session != null && session.getAttribute("admin") != null;
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        if (!isLoggedIn(req)) {
            res.sendRedirect("login");
            return;
        }

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            req.getRequestDispatcher("/addUser.jsp").forward(req, res);

        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            User user = dao.getUserById(id);
            req.setAttribute("user", user);
            req.getRequestDispatcher("/editUser.jsp").forward(req, res);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.deleteUser(id);
            res.sendRedirect("users");

        } else if ("logout".equals(action)) {
            req.getSession().invalidate();
            res.sendRedirect("login");

        } else {
            List<User> users = dao.getAllUsers();
            req.setAttribute("users", users);
            req.getRequestDispatcher("/userList.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        if (!isLoggedIn(req)) {
            res.sendRedirect("login");
            return;
        }

        String action = req.getParameter("action");
        String name  = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        if ("insert".equals(action)) {
            dao.insertUser(new User(0, name, email, phone));
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.updateUser(new User(id, name, email, phone));
        }

        res.sendRedirect("users");
    }
}
