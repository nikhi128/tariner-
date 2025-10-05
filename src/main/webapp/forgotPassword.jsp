<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password - Trainer Management</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, rgba(102, 126, 234, 0.7) 0%, rgba(118, 75, 162, 0.7) 100%);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }

    .reset-wrapper {
        animation: fadeInUp 1s ease;
    }

    .reset-container {
        background: white;
        border-radius: 20px;
        padding: 40px;
        box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        width: 100%;
        max-width: 450px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .reset-container:hover {
        transform: translateY(-5px);
        box-shadow: 0 25px 70px rgba(0,0,0,0.4);
    }

    h2 {
        text-align: center;
        font-size: 28px;
        color: #667eea;
        font-weight: 600;
        margin-bottom: 30px;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        font-weight: 600;
        color: #333;
        margin-bottom: 8px;
        font-size: 15px;
    }

    .form-group input {
        width: 100%;
        padding: 14px 18px;
        border: 2px solid #e0e0e0;
        border-radius: 12px;
        font-size: 15px;
        transition: all 0.3s ease;
        background: #f8f9fa;
    }

    .form-group input:focus {
        outline: none;
        border-color: #667eea;
        background: white;
        box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
    }

    .btn-primary {
        width: 100%;
        padding: 14px;
        background: #667eea;
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        margin-top: 10px;
    }

    .btn-primary:hover {
        background: #5568d3;
        transform: translateY(-2px);
        box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
    }

    .message {
        background: rgba(40, 167, 69, 0.1);
        color: #28a745;
        padding: 12px 18px;
        border-radius: 10px;
        margin-top: 20px;
        border-left: 4px solid #28a745;
        font-weight: 600;
        text-align: center;
    }

    .error {
        background: rgba(220, 53, 69, 0.1);
        color: #dc3545;
        padding: 12px 18px;
        border-radius: 10px;
        margin-top: 20px;
        border-left: 4px solid #dc3545;
        font-weight: 600;
        text-align: center;
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        font-weight: 600;
        color: #667eea;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .back-link:hover {
        color: #5568d3;
    }

    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>

<div class="reset-wrapper">
    <div class="reset-container">
        <h2>🔑 Reset Password</h2>

        <form action="forgotPassword" method="post">
            <div class="form-group">
                <label>📧 Enter your email:</label>
                <input type="email" name="email" placeholder="Enter your registered email" required>
            </div>

            <div class="form-group">
                <label>🔒 Enter new password:</label>
                <input type="password" name="newPassword" placeholder="Enter your new password" required>
            </div>

            <button type="submit" class="btn-primary">Reset Password</button>
        </form>

        <% if (request.getAttribute("message") != null) { %>
            <div class="message"><%= request.getAttribute("message") %></div>
        <% } %>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <a href="login.jsp" class="back-link">⬅️ Back to Login</a>
    </div>
</div>

</body>
</html>
