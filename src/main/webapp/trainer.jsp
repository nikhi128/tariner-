<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.*, POJO.Trainer"%>
<!DOCTYPE html>
<html>
<head>
<title>Fbs Trainer Management System</title>
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

.add-trainer-card {
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

.form-group input[type="text"] {
    width: 100%;
    padding: 14px 18px;
    border: 2px solid #e0e0e0;
    border-radius: 12px;
    font-size: 15px;
    transition: all 0.3s ease;
    background: #f8f9fa;
}

.form-group input[type="text"]:focus {
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
    text-decoration: none;
    display: inline-block;
    text-align: center;
}

.btn-secondary:hover {
    background: #5d3a82;
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(118, 75, 162, 0.4);
}

.trainers-table-card {
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

.delete-form {
    display: inline;
}

.btn-delete {
    padding: 8px 20px;
    background: rgba(220, 53, 69, 0.8);
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn-delete:hover {
    background: rgba(200, 35, 51, 0.9);
    transform: scale(1.05);
    box-shadow: 0 5px 15px rgba(220, 53, 69, 0.3);
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
</style>
</head>
<body>

<div class="main-container">
    <div class="header">
        <h1>🎓 Trainer Management System</h1>
        <p>Manage your training team efficiently</p>
    </div>

    <div class="content-wrapper">
        <!-- Add Trainer Card -->
        <div class="add-trainer-card card">
            <h2 class="card-title">➕ Add New Trainer</h2>
            <form action="trainer" method="post">
                <div class="form-group">
                    <label>👤 Trainer Name</label>
                    <input type="text" name="name" placeholder="Enter trainer name" required autocomplete="off">
                </div>
                
                <div class="form-group">
                    <label>📚 Subject</label>
                    <input type="text" name="subject" placeholder="Enter subject" required autocomplete="off">
                </div>
                
                <button type="submit" class="btn-primary">Add Trainer</button>
            </form>
            
            <a href="subject.jsp" class="btn-secondary">📖 Manage Subjects</a>
        </div>

        <!-- Trainers List Card -->
        <div class="trainers-table-card card">
            <h2 class="card-title">👥 All Trainers</h2>
            
            <%
                List<Trainer> trainerList = (List<Trainer>) request.getAttribute("trainers");
                int trainerCount = (trainerList != null) ? trainerList.size() : 0;
            %>
            
            <div class="stats-bar">
                <div class="stat-item">
                    <div class="stat-number"><%=trainerCount%></div>
                    <div class="stat-label">Total Trainers</div>
                </div>
            </div>
            
            <div class="table-wrapper">
                <table>
                    <thead>
                        <tr>
                            <th>🆔 Emp ID</th>
                            <th>👤 Name</th>
                            <th>📚 Subject</th>
                            <th>⚡ Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            if (trainerList != null && !trainerList.isEmpty()) {
                                for (Trainer t : trainerList) {
                        %>
                        <tr>
                            <td><strong>#<%=t.getEmpId()%></strong></td>
                            <td><%=t.getName()%></td>
                            <td><span class="badge"><%=t.getSubject()%></span></td>
                            <td>
                                <form method="post" action="trainer" class="delete-form">
                                    <input type="hidden" name="actionType" value="delete">
                                    <input type="hidden" name="empId" value="<%=t.getEmpId()%>">
                                    <button type="submit" class="btn-delete" onclick="return confirm('Are you sure you want to delete this trainer?')">🗑️ Delete</button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="4" class="no-data">
                                📭 No trainers found. Add your first trainer to get started!
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