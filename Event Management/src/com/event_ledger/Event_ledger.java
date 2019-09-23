package com.event_ledger;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        		
    		  
        	  HttpSession session = request.getSession();
        	
    		  response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate" );
    		
			  response.setHeader("Progma", "no-cahce");
			
			  response.setHeader("Expires", "0");
			
			  if((String)session.getAttribute("username") == null)
			  {
				response.sendRedirect("Login.jsp");
			  }

            // JDBC
	          SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	          
	          String sql = "insert into event_ledger (event_name,description,username,status_level,prev_status_level,start_date,end_date   )values( ? , ? , ? , 1 , 1 , ? ,? ) ";
            
	    	  java.util.Date util_StartDate =format.parse(request.getParameter("start_date"));
	          
	          java.sql.Date sql_StartDate = new java.sql.Date( util_StartDate.getTime() );
	
	          java.util.Date util_EndDate = format.parse(request.getParameter("end_date"));
	        
	          java.sql.Date sql_EndDate = new java.sql.Date( util_EndDate.getTime() );
	          
	          Connection con = (Connection) GetConnection.getConnection();
	         
	          PreparedStatement st = (PreparedStatement) con .prepareStatement(sql);  // Create a Query
              
              String username = (String)session.getAttribute("username");
            
              st.setString(1, request.getParameter("event_name"));
              
              st.setString(2, request.getParameter("description"));
              
              st.setString(3, username);
              
              st.setDate(4, sql_StartDate);
              
              st.setDate(5, sql_EndDate);
            
             
              st.executeUpdate();
            
              st.close();
              
              con.close();
          

              response.sendRedirect("DashBoard.jsp");
           
              
              
          
            // to Database Updations
            


            


        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
