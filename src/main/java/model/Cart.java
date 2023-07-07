/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Cart {
    private String productId;
    private String productPrice;
    private String productName;

    public Cart(String productId, String productPrice, String productName) {
        this.productId = productId;
        this.productPrice = productPrice;
        this.productName = productName;
    }

    public Cart() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void insertIntoDatabase() throws SQLException {
        Connection conn = DbConnection.getConnection();
       
        String sql = "INSERT INTO cart (buyer, product_name, product_price) VALUES (?, ?, ?)"; // we insert each data based on the query
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, productId);
        statement.setString(2, productName);
            statement.setString(3, productPrice);
        statement.executeUpdate();
        statement.close();
        
  
    }
}