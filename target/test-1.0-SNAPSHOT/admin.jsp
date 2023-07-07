<%-- 
    Document   : admin
    Created on : Jun 28, 2023, 1:03:02 AM
    Author     : rebaz
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>User List</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Username</th>
                    <th>Email</th>
                </tr>
            </thead>
            <tbody>
                <% for (User user : User.getUserList()) { %>
                <tr>
                    <td><%= user.getUserId() %></td>
                    <td><%= user.getUsername() %></td>
                    <td><%= user.getEmail() %></td>
                    
                    <!-- comment 
                           <td>${user.userId}</td>
            <td>${user.username}</td>
            <td>${user.email}</td> // we also can get the data using Regular expressions
                    
                    -->
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
