<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.app.model.User" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login");
        return;
    }
    User user = (User) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
    <h1>⚡ CRUD Dashboard</h1>
    <a href="users?action=logout">Logout</a>
</div>

<div class="container">
    <div class="form-card">
        <h2>✏️ Edit User — <span style="color:#e94560">ID: <%= user.getId() %></span></h2>
        <form action="users" method="post">
            <input type="hidden" name="action" value="update" />
            <input type="hidden" name="id" value="<%= user.getId() %>" />
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" value="<%= user.getName() %>" required />
            </div>
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" value="<%= user.getEmail() %>" required />
            </div>
            <div class="form-group">
                <label>Phone Number</label>
                <input type="text" name="phone" value="<%= user.getPhone() %>" required />
            </div>
            <div style="display:flex; gap:12px; margin-top:10px;">
                <button type="submit" class="btn btn-primary">💾 Update User</button>
                <a href="users" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
