package com.DataBaseConnection;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 


public class GetConnection 
{
    private static String url = "jdbc:mysql://localhost:3306/Event_Management?useSSL=false";
    private static String Driver = "com.mysql.jdbc.Driver";   
    private static String username = "pratham";   
    private static String password = "1";
    private static Connection con;
    private static String urlstring;

    public static Connection getConnection() 
    {
        try {
            Class.forName(Driver);
            try {
                con = DriverManager.getConnection(url, username, password);
            } catch (SQLException ex) {
                // log an exception. from example:
                System.out.println("Failed to create the database connection."); 
            }
        } catch (ClassNotFoundException ex) {
            // log an exception. for example:
            System.out.println("Driver not found."); 
        }
        return con;
    
    }
    
}