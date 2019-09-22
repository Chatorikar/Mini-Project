package com.event_ledger;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DataBaseConnection.GetConnection;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Event_ledger
 */
@WebServlet("/Event_ledger")
public class Event_ledger extends HttpServlet {
	
	
    private static final long serialVersionUID = 1L; 
    
    protected void doPost(HttpServletRequest request,  
HttpServletResponse response) 
        throws ServletException, IOException 
    { 
        try { 
  
            // JDBC 
            Connection con = (Connection) GetConnection.getConnection(); 
  
          
          // Create a Query
            PreparedStatement st = (PreparedStatement) con .prepareStatement("insert into demo values(?, ?)"); 
  
            st.setString(1, request.getParameter("name")); 
  
            
            st.setString(2, request.getParameter("email")); 
  
            
            // to Database Updations
            st.executeUpdate(); 
  
           
            st.close(); 
            con.close(); 
  
            
        } 
        catch (Exception e) { 
            e.printStackTrace(); 
        } 
    } 
} 

