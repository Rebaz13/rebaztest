/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author rebaz
 */
import java.util.ArrayList;
import java.util.List;

public class User {
    private int userId;
    private String username;
    private String email;

    public User(int userId, String username, String email) {
        this.userId = userId;
        this.username = username;
        this.email = email;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Static list of users
    private static List<User> userList = new ArrayList<>();

    // Method to add a user to the list
    public static void addUser(User user) {
        userList.add(user);
    }
    public static void removeUser(User user){
    userList.remove(user);
    }

    // Method to get the list of users
    public static List<User> getUserList() { // from here we will get the list
        return userList;
    }
}
