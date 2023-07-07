<%-- 
    Document   : adminPanel
    Created on : Jun 28, 2023, 1:50:45 AM
    Author     : rebaz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 50px;
        }
        .btn-lg {
            width: 200px;
            height: 200px;
            font-size: 24px;
            margin: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, Admin</h2>
        <div class="text-center">
            <a href="admin.jsp" class="btn btn-primary btn-lg">Users</a>
            <a href="approve.jsp" class="btn btn-primary btn-lg">Requests</a>
            <a href="upload_item.html" class="btn btn-primary btn-lg">Upload</a>
        </div>
    </div>
</body>
</html>
