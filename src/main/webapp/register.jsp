<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('3139256.jpg');
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            background-color:#bee0ec;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px #aaa;
            text-align: center;
            width: 350px;
        }

        .register-container img {
            width: 100px;
            margin-bottom: 20px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            background: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background: #218838;
        }

        .error {
            color: red;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <img src="https://cdn-icons-png.flaticon.com/512/5087/5087579.png" alt="User Icon">

        <h2>Register</h2>
        <form action="register" method="post">
            <input type="text" name="name" placeholder="Name" required><br/>
            <input type="email" name="email" placeholder="Email" required><br/>
            <input type="password" name="password" placeholder="Password" required><br/>
            <button type="submit">Register</button>
        </form>

        <% String error = (String) request.getAttribute("error");
           if (error != null) { %>
            <div class="error"><%= error %></div>
        <% } %>
    </div>
</body>
</html>
