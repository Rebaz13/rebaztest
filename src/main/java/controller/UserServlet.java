/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DbConnection;
import model.User;

/**
 *
 * @author rebaz
 */
@WebServlet(name = "UserServlet", urlPatterns = {"/UserServlet"})
public class UserServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        try {
            Connection conn = DbConnection.getConnection(); // get database connection first 
            String sql = "SELECT * FROM user";
            Statement statement = conn.createStatement();  
            ResultSet resultSet = statement.executeQuery(sql); // execute the query

            while (resultSet.next()) { // while we have data 
                int userId = resultSet.getInt("id");
                String username = resultSet.getString("username"); // get username from database
                String email = resultSet.getString("email"); // get email from database
                 HttpSession session = request.getSession();
                 session.setAttribute("username", username); // get username 
                User user = new User(userId, username, email);
                User.addUser(user); // adding user data to the list in User class
            }
           
              
                     response.sendRedirect("adminPanel.jsp"); 
                
            resultSet.close();
            statement.close();
            conn.close();
            
           // Redirect to the JSP page to display users
        } catch (SQLException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }



    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
