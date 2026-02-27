<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add User</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="navbar">
    <h1>⚡ CRUD Dashboard</h1>
    <a href="users?action=logout">Logout</a>
</div>

<div class="container">
    <div class="form-card">
        <h2>➕ Add New User</h2>
        <form action="users" method="post">
            <input type="hidden" name="action" value="insert" />
            <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" placeholder="e.g. Rahul Sharma" required />
            </div>
            <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" placeholder="e.g. rahul@email.com" required />
            </div>
            <div class="form-group">
                <label>Phone Number</label>
                <input type="text" name="phone" placeholder="e.g. 9876543210" required />
            </div>
            <div style="display:flex; gap:12px; margin-top:10px;">
                <button type="submit" class="btn btn-success">✅ Save User</button>
                <a href="users" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>

</body>
</html>
