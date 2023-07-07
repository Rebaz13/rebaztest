/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Items {
    private String productName;
    private String productPrice;
    private String productImage;

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public void uploadProduct() {
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            conn = DbConnection.getConnection(); // like other jdbc code we insert our new bike to the shop
            String sql = "INSERT INTO bicycle (product_name, product_price, product_image) VALUES (?, ?, ?)";
            statement = conn.prepareStatement(sql); // to execute sql query and add the new product to bicycle table
            statement.setString(1, productName);
            statement.setString(2, productPrice);
            statement.setString(3, productImage);
            statement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
