<%-- 
    Document   : Home
    Created on : Jun 27, 2023, 3:34:58 PM
    Author     : rebaz
--%>

<%@page import="com.mysql.cj.Session"%>
<%@page import="model.DbConnection"%>
<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Additional custom styles can be added here */
    </style>

</head>
<body>
    <%@ include file="navbar.jsp" %>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <h2>Bike Shop</h2>
                <p>Welcome to our bike shop. We offer a wide range of bikes for all your cycling needs.</p>
            </div>
            <div class="col-md-6">
                <img src="https://th.bing.com/th/id/R.459bf5801dfc967e0ec6113a3c7ecb1d?rik=%2fPOorNqXjaIQeQ&riu=http%3a%2f%2fdreamicus.com%2fdata%2fbicycle%2fbicycle-04.jpg&ehk=BDRPhrmtlZoOZ5vulpOYsx0Mrzo4nyKg9Tqb%2b5QLnDs%3d&risl=&pid=ImgRaw&r=0" class="img-fluid" alt="Bike Image">
            </div>
        </div>
    </div>
    <hr>
    
     <div class="container mt-5">
        <h2>Product List</h2>
        <div class="row">
            <% 
            try {
                Connection conn = DbConnection.getConnection();
                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM bicycle");

                while (resultSet.next()) {
                    String productName = resultSet.getString("product_name");
                    double productPrice = resultSet.getDouble("product_price");
                    String productImage = resultSet.getString("product_image");
                    int productId = resultSet.getInt("product_id");
                    String buyer = (String) session.getAttribute("username");
            %>
         <div class="card text-center" style="width: 18rem;">
    <div class="card-body d-flex flex-column justify-content-center align-items-center">
        <img src="<%= productImage %>" class="card-img-top" alt="Product Image">
        <h5 class="card-title mt-3"><%= productName %></h5>
        <p class="card-text">Price: $<%= productPrice %></p>
        <form action="cartServlet" method="post">
            <input type="hidden" name="productName" value="<%= productName %>">
            <input type="hidden" name="productPrice" value="<%= productPrice %>">
            <input type="hidden" name="productId" value="<%=buyer%>">
            <button class="btn btn-primary">Order Now</button>
        </form>
    </div>
</div>


            <%
                }
                resultSet.close();
                statement.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            %>
        </div>
    </div>
</div>

    
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
