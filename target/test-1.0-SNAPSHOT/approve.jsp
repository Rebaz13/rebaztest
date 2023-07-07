<%@page import="model.DbConnection"%>
<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <div class="container mt-5">
        <h2>Approval</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Cart ID</th>
                    <th>Product Name</th>
                    <th>Product Price</th>
                </tr>
            </thead>
            <tbody>
         
     
         
                <% 
                    try {
                        // Establish database connection
                        Connection conn = DbConnection.getConnection();
                        
                        // Retrieve cart items from the database
                        String sql = "SELECT buyer, product_name, product_price FROM cart";
                        PreparedStatement statement = conn.prepareStatement(sql);
                        ResultSet resultSet = statement.executeQuery();
                        
                        // Iterate over the result set and populate the table rows
                        while (resultSet.next()) {
                            String cartId = resultSet.getString("buyer");
                            String productName = resultSet.getString("product_name");
                            String productPrice = resultSet.getString("product_price");
                %>
                            <tr>
    <td><%= cartId %></td>
    <td><%= productName %></td>
    <td><%= productPrice %>$</td>
    
    <td>
        <form action="remove" method="post">
            <input type="hidden" name="cartId" value="<%= cartId %>">
            <button type="submit" class="btn btn-primary">approve</button>
            <button type="submit" class="btn btn-danger">Reject</button>
            
        </form>
    </td>
</tr>

                <% 
                        }
                        
                        // Close resources
                        resultSet.close();
                        statement.close();
                        conn.close();
                        
                    } catch (SQLException ex) {
                        ex.printStackTrace();
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
