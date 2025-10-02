<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            
            font-family: Arial, sans-serif;
	background: url('');
 	background-size: cover;
  		background-repeat: no-repeat;     
         display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background:#bee0ec;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #aaa;
            text-align: center;
            width: 350px;
        }

        .login-container img {
            width: 100px;
            margin-bottom: 20px;
        }

        input[type="email"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"], button {
            background: #007BFF;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover,
        button:hover {
            background: #0056b3;
        }

        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body >
    <div class="login-container">
        <img src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" alt="User Icon">

        <h2>Login</h2>
        <form method="post" action="login">
            <input type="email" name="email" placeholder="Email" required /><br/>
            <input type="password" name="password" placeholder="Password" required /><br/>
            <input type="submit" value="Login"/>
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <div class="error"><%= request.getAttribute("error") %></div>
        <% } %>

        <p>Don't have an account?</p>
        <form action="register.jsp" method="get">
            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>
