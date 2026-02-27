<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | CRUD App</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="login-wrapper">
    <div class="login-card">
        <h2>🔐 Admin Login</h2>
        <p class="subtitle">Sign in to manage your users</p>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="login" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text" name="username" placeholder="Enter username" required autofocus />
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter password" required />
            </div>
            <button type="submit" class="btn btn-primary btn-full">Login</button>
        </form>

        <p style="text-align:center; margin-top:20px; color:#aaa; font-size:0.85rem;">
            Login: <strong>admin</strong> / <strong>admin123</strong>
        </p>
    </div>
</div>
</body>
</html>
