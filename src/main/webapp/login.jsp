<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Fbs Trainer Management - Login</title>
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

.login-wrapper {
    animation: fadeInUp 1s ease;
}

.header {
    text-align: center;
    color: white;
    margin-bottom: 30px;
    animation: fadeInDown 0.8s ease;
}

.header h1 {
    font-size: 38px;
    font-weight: 700;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
    margin-bottom: 8px;
}

.header p {
    font-size: 16px;
    opacity: 0.9;
}

.login-container {
    background: white;
    border-radius: 20px;
    padding: 40px;
    box-shadow: 0 20px 60px rgba(0,0,0,0.3);
    width: 100%;
    max-width: 450px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.login-container:hover {
    transform: translateY(-5px);
    box-shadow: 0 25px 70px rgba(0,0,0,0.4);
}

.logo-section {
    text-align: center;
    margin-bottom: 30px;
}

.logo-section img {
    width: 90px;
    height: 90px;
    margin-bottom: 15px;
    animation: bounce 2s infinite;
}

.card-title {
    font-size: 28px;
    color: #667eea;
    margin-bottom: 25px;
    font-weight: 600;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
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

.form-group input[type="email"],
.form-group input[type="password"] {
    width: 100%;
    padding: 14px 18px;
    border: 2px solid #e0e0e0;
    border-radius: 12px;
    font-size: 15px;
    transition: all 0.3s ease;
    background: #f8f9fa;
}

.form-group input[type="email"]:focus,
.form-group input[type="password"]:focus {
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

.btn-secondary {
    width: 100%;
    padding: 14px;
    background: #764ba2;
    color: white;
    border: none;
    border-radius: 12px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 15px;
}

.btn-secondary:hover {
    background: #5d3a82;
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(118, 75, 162, 0.4);
}

.error {
    background: rgba(220, 53, 69, 0.1);
    color: #dc3545;
    padding: 12px 18px;
    border-radius: 10px;
    margin-bottom: 20px;
    border-left: 4px solid #dc3545;
    font-size: 14px;
    font-weight: 600;
    animation: shake 0.5s ease;
}

.divider {
    text-align: center;
    margin: 25px 0;
    color: #999;
    font-size: 14px;
    position: relative;
}

.divider::before,
.divider::after {
    content: '';
    position: absolute;
    top: 50%;
    width: 40%;
    height: 1px;
    background: #e0e0e0;
}

.divider::before {
    left: 0;
}

.divider::after {
    right: 0;
}

@keyframes fadeInDown {
    from {
        opacity: 0;
        transform: translateY(-30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

@keyframes bounce {
    0%, 20%, 50%, 80%, 100% {
        transform: translateY(0);
    }
    40% {
        transform: translateY(-10px);
    }
    60% {
        transform: translateY(-5px);
    }
}

@keyframes shake {
    0%, 100% { transform: translateX(0); }
    10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
    20%, 40%, 60%, 80% { transform: translateX(5px); }
}

@media (max-width: 480px) {
    .login-container {
        padding: 30px 25px;
    }
    
    .header h1 {
        font-size: 32px;
    }
}
</style>
</head>
<body>

<div class="login-wrapper">
    <div class="header">
        <h1>🎓 Trainer Management System</h1>
        <p>Welcome back! Please login to continue</p>
    </div>

    <div class="login-container">
        <div class="logo-section">
            <img src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" alt="User Icon">
        </div>

        <h2 class="card-title">🔐 Login</h2>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error">
                ⚠️ <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form method="post" action="login">
            <div class="form-group">
                <label>📧 Email Address</label>
                <input type="email" name="email" placeholder="Enter your email" required />
            </div>
            
            <div class="form-group">
                <label>🔒 Password</label>
                <input type="password" name="password" placeholder="Enter your password" required />
            </div>
            
            <button type="submit" class="btn-primary">Login</button>
        </form>
<p><a href="forgotPassword.jsp">Forgot Password?</a></p>

        <div class="divider">OR</div>

        <form action="register.jsp" method="get">
            <button type="submit" class="btn-secondary">Create New Account</button>
        </form>
    </div>
</div>

</body>
</html>