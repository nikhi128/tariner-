<%@ page import="java.util.*, POJO.Subject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Subject Management System</title>
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
            padding: 40px 20px;
        }

        .main-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            text-align: center;
            color: white;
            margin-bottom: 40px;
            animation: fadeInDown 0.8s ease;
        }

        .header h1 {
            font-size: 42px;
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            margin-bottom: 10px;
        }

        .header p {
            font-size: 18px;
            opacity: 0.9;
        }

        .back-link {
            display: inline-block;
            margin-bottom: 30px;
            text-decoration: none;
            background: white;
            color: #667eea;
            padding: 12px 24px;
            border-radius: 12px;
            transition: all 0.3s ease;
            font-weight: 600;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .back-link:hover {
            background: #667eea;
            color: white;
            transform: translateX(-5px);
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        }

        .content-wrapper {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 30px;
            animation: fadeInUp 1s ease;
        }

        .card {
            background: white;
            border-radius: 20px;
            padding: 35px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 25px 70px rgba(0,0,0,0.4);
        }

        .left-panel {
            height: fit-content;
        }

        .card-title {
            font-size: 26px;
            color: #667eea;
            margin-bottom: 25px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .card-title::before {
            content: '';
            width: 5px;
            height: 30px;
            background: #667eea;
            border-radius: 10px;
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

        .form-group input[type="text"],
        .form-group input[type="number"] {
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

        .btn-search {
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
            margin-top: 10px;
        }

        .btn-search:hover {
            background: #5d3a82;
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(118, 75, 162, 0.4);
        }

        .btn-delete {
            padding: 8px 16px;
            background: #e74c3c;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-delete:hover {
            background: #c0392b;
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(231, 76, 60, 0.4);
        }

        .search-section {
            background: #f8f9fc;
            padding: 25px;
            border-radius: 15px;
            margin-top: 25px;
            border: 2px solid #e9ecf5;
        }

        .delete-section {
            background: #fff5f5;
            padding: 25px;
            border-radius: 15px;
            margin-top: 25px;
            border: 2px solid #ffc9c9;
        }

        .search-section h3,
        .delete-section h3 {
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 20px;
            font-weight: 600;
        }

        .delete-section h3 {
            color: #e74c3c;
        }

        .search-divider {
            height: 1px;
            background: #e0e0e0;
            margin: 20px 0;
        }

        .subjects-table-card {
            overflow: hidden;
        }

        .table-wrapper {
            overflow-x: auto;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        thead {
            background: #667eea;
        }

        th {
            padding: 18px 15px;
            text-align: left;
            color: white;
            font-weight: 600;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        th:first-child {
            border-radius: 12px 0 0 0;
        }

        th:last-child {
            border-radius: 0 12px 0 0;
        }

        tbody tr {
            transition: all 0.3s ease;
            border-bottom: 1px solid #f0f0f0;
        }

        tbody tr:hover {
            background: rgba(102, 126, 234, 0.05);
            transform: scale(1.01);
        }

        td {
            padding: 18px 15px;
            color: #333;
            font-size: 15px;
        }

        .no-data {
            text-align: center;
            padding: 40px;
            color: #999;
            font-size: 16px;
        }

        .badge {
            display: inline-block;
            padding: 6px 14px;
            background: #e9ecf5;
            color: #667eea;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
        }

        .stats-bar {
            display: flex;
            justify-content: space-around;
            background: #f8f9fc;
            padding: 15px;
            border-radius: 12px;
            margin-bottom: 20px;
            border: 2px solid #e9ecf5;
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 28px;
            font-weight: 700;
            color: #667eea;
        }

        .stat-label {
            font-size: 13px;
            color: #666;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .action-cell {
            text-align: center;
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

        @media (max-width: 968px) {
            .content-wrapper {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <script>
        function confirmDelete(subjectId, subjectName) {
            if (confirm('Are you sure you want to delete "' + subjectName + '"?')) {
                document.getElementById('deleteForm_' + subjectId).submit();
            }
        }
    </script>
</head>
<body>

<div class="main-container">
    <a href="trainer.jsp" class="back-link">← Back to Trainer Management</a>
    
    <div class="header">
        <h1>📚 Subject Management System</h1>
        <p>Manage your subjects efficiently</p>
    </div>

    <div class="content-wrapper">
        <!-- Add & Search Subject Card -->
        <div class="left-panel card">
            <h2 class="card-title">➕ Add New Subject</h2>
            <form action="subject" method="post">
                <input type="hidden" name="action" value="add">
                <div class="form-group">
                    <label>📖 Subject Name</label>
                    <input type="text" name="name" placeholder="Enter subject name" required autocomplete="off">
                </div>
                <button type="submit" class="btn-primary">Add Subject</button>
            </form>

            <div class="search-section">
                <h3>🔍 Search Subject</h3>
                
                <form action="subject" method="get">
                    <input type="hidden" name="action" value="searchById">
                    <div class="form-group">
                        <label>🆔 Search by ID</label>
                        <input type="number" name="id" placeholder="Enter subject ID" required>
                    </div>
                    <button type="submit" class="btn-search">Search by ID</button>
                </form>

                <div class="search-divider"></div>

                <form action="subject" method="get">
                    <input type="hidden" name="action" value="searchByName">
                    <div class="form-group">
                        <label>📝 Search by Name</label>
                        <input type="text" name="name" placeholder="Enter subject name" required>
                    </div>
                    <button type="submit" class="btn-search">Search by Name</button>
                </form>
            </div>

            <div class="delete-section">
                <h3>🗑️ Delete Subject</h3>
                
                <form action="subject" method="post">
                    <input type="hidden" name="action" value="delete">
                    <div class="form-group">
                        <label>🆔 Subject ID</label>
                        <input type="number" name="id" placeholder="Enter subject ID to delete" required>
                    </div>
                    <button type="submit" class="btn-delete" style="width: 100%;">Delete Subject</button>
                </form>
            </div>
        </div>

        <!-- Subjects List Card -->
        <div class="subjects-table-card card">
            <h2 class="card-title">📋 All Subjects</h2>
            
            <%
                List<Subject> subjectList = (List<Subject>) request.getAttribute("subjects");
                Subject searchResult = (Subject) request.getAttribute("searchResult");
                String action = request.getParameter("action");
                int subjectCount = (subjectList != null) ? subjectList.size() : 0;
            %>
            
            <div class="stats-bar">
                <div class="stat-item">
                    <div class="stat-number"><%=subjectCount%></div>
                    <div class="stat-label">Total Subjects</div>
                </div>
            </div>
            
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>🆔 ID</th>
                            <th>📚 Subject Name</th>
                            <th style="text-align: center;">⚡ Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if ("searchById".equals(action) || "searchByName".equals(action)) {
                                if (searchResult != null) {
                        %>
                        <tr>
                            <td><strong>#<%=searchResult.getId()%></strong></td>
                            <td><span class="badge"><%=searchResult.getName()%></span></td>
                            <td class="action-cell">
                                <form id="deleteForm_<%=searchResult.getId()%>" action="subject" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="<%=searchResult.getId()%>">
                                    <button type="button" class="btn-delete" onclick="confirmDelete(<%=searchResult.getId()%>, '<%=searchResult.getName()%>')">
                                        🗑️ Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%
                                } else {
                        %>
                        <tr>
                            <td colspan="3" class="no-data">❌ No subject found for your search.</td>
                        </tr>
                        <%
                                }
                            } else if (subjectList != null && !subjectList.isEmpty()) {
                                for (Subject s : subjectList) {
                        %>
                        <tr>
                            <td><strong>#<%=s.getId()%></strong></td>
                            <td><span class="badge"><%=s.getName()%></span></td>
                            <td class="action-cell">
                                <form id="deleteForm_<%=s.getId()%>" action="subject" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="id" value="<%=s.getId()%>">
                                    <button type="button" class="btn-delete" onclick="confirmDelete(<%=s.getId()%>, '<%=s.getName()%>')">
                                        🗑️ Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="3" class="no-data">
                                📭 No subjects found. Add your first subject to get started!
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>