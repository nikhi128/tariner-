<%@ page import="java.util.*, POJO.Subject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Subject Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(to right, #a8c0ff, #bee0ec);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }

        .subject-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            width: 550px;
            text-align: center;
            transition: 0.3s ease-in-out;
        }

        .subject-container:hover {
            transform: translateY(-5px);
        }

        .subject-container img {
            width: 90px;
            margin-bottom: 20px;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }

        form {
            margin-bottom: 25px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }

        input[type="text"], input[type="number"] {
            padding: 10px;
            width: 65%;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            transition: 0.2s;
        }

        input[type="text"]:focus, input[type="number"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0,123,255,0.5);
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            font-size: 15px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .search-submit {
            background-color: #007bff;
        }

        .search-submit:hover {
            background-color: #0056b3;
        }

        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            text-decoration: none;
            background: #007bff;
            color: white;
            padding: 8px 16px;
            border-radius: 8px;
            transition: background 0.3s;
        }

        .back-link:hover {
            background: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: #fff;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #eef7ff;
        }

        .no-subjects {
            margin-top: 20px;
            font-size: 16px;
            color: #dc3545;
            font-weight: bold;
        }

        .search-section {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .search-section h3 {
            color: #2c3e50;
            margin-bottom: 15px;
            font-size: 18px;
        }
    </style>
</head>
<body>

<div class="subject-container">
    <a href="trainer.jsp" class="back-link">← Back to Trainer Management</a>

    <h2>Add New Subject</h2>
    <form action="subject" method="post">
        <input type="hidden" name="action" value="add">
        <input type="text" name="name" placeholder="Enter subject name" required>
        <input type="submit" value="Add">
    </form>

    <div class="search-section">
        <h3>Search Subject</h3>
        <form action="subject" method="get">
            <input type="hidden" name="action" value="searchById">
            <input type="number" name="id" placeholder="Search by ID" required>
            <input type="submit" value="Search" class="search-submit">
        </form>
        <br>
        <form action="subject" method="get">
            <input type="hidden" name="action" value="searchByName">
            <input type="text" name="name" placeholder="Search by Name" required>
            <input type="submit" value="Search" class="search-submit">
        </form>
    </div>

    <h2>All Subjects</h2>

    <%
        List<Subject> subjectList = (List<Subject>) request.getAttribute("subjects");
        Subject searchResult = (Subject) request.getAttribute("searchResult");
        
        if (searchResult != null) {
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>Subject Name</th>
            </tr>
            <tr>
                <td><%= searchResult.getId() %></td>
                <td><%= searchResult.getName() %></td>
            </tr>
        </table>
    <%
        } else if (subjectList != null && !subjectList.isEmpty()) {
    %>
        <table>
            <tr>
                <th>ID</th>
                <th>Subject Name</th>
            </tr>
    <%
            for (Subject s : subjectList) {
    %>
            <tr>
                <td><%= s.getId() %></td>
                <td><%= s.getName() %></td>
            </tr>
    <%
            }
    %>
        </table>
    <%
        } else {
    %>
        <p class="no-subjects">No subjects found.</p>
    <%
        }
    %>
</div>

</body>
</html>