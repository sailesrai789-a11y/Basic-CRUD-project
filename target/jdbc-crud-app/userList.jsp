<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.app.model.User, java.util.List" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login");
        return;
    }
    List<User> users = (List<User>) request.getAttribute("users");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Management</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
    <h1>⚡ CRUD Dashboard</h1>
    <a href="users?action=logout">Logout</a>
</div>

<div class="container">
    <div class="card">
        <div class="card-header">
            <h2>👥 All Users <span class="badge"><%= users.size() %> records</span></h2>
            <a href="users?action=add" class="btn btn-success">+ Add New User</a>
        </div>

        <% if (users.isEmpty()) { %>
            <div class="empty-state">
                <h3>📭 No users found</h3>
                <p>Click "Add New User" to get started.</p>
            </div>
        <% } else { %>
        <table>
            <thead>
                <tr>
                    <th>#ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (User u : users) { %>
                <tr>
                    <td><span class="badge"><%= u.getId() %></span></td>
                    <td><strong><%= u.getName() %></strong></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getPhone() %></td>
                    <td>
                        <div class="actions">
                            <a href="users?action=edit&id=<%= u.getId() %>" class="btn btn-warning">✏️ Edit</a>
                            <a href="users?action=delete&id=<%= u.getId() %>"
                               class="btn btn-danger"
                               onclick="return confirm('Delete this user?')">🗑️ Delete</a>
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
    </div>
</div>

</body>
</html>
