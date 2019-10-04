package com.user_to_principal_message;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DataBaseConnection.GetConnection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class user_to_principal_message
 */
@WebServlet("/user_to_principal_message")
public class user_to_principal_message extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
	 	
	 	String event_id = (String)session.getAttribute("event_id");
	 	
	 	session.removeAttribute( "event_id" );
	 	
	 	
	 	
	 	
	  
	 	String update_event_ledger = null;
	 	
	 	String change_status_level = "select max(communication_number) from event_communication where event_id = ?";
	 	
	 	
	 	
	 	
	 	int i = 0;
	 	
	 		
		 	try {
		 		
			
		 		
		 		Connection con = (Connection) GetConnection.getConnection();
		 		
		 		PreparedStatement st_change_status_level = (PreparedStatement) con.prepareStatement(change_status_level); 
		 		
		 		st_change_status_level.setInt(1, Integer.parseInt(event_id));
		 		
		 		ResultSet rs_change_status_level = st_change_status_level.executeQuery();
		 		
		 			
		 		
		 		
		 		
		 		
		 	  
			 	
			 	String insert_into_event_communication = "insert into event_communication values( ? , ? , ? , ?)";
			 	
			 	  
			 	 
			 	
			 	
	
			 	//-------------------------------------------------------------------------
			 	
			 	PreparedStatement st = (PreparedStatement)con.prepareStatement(insert_into_event_communication);
			 	
			 	
			 	st.setInt(1, Integer.parseInt(event_id));
			              
			 	
			 	st.setString(2 , request.getParameter("message") );     	 // Event description
			 	
			 	
			 	if(rs_change_status_level.next() == false)  				 // if result set is empty
		 		{
		 		
			 	
			 		st.setInt(3 , 1 );										  // Communication number
			 	
		 		}
			 	else {
			 	
			 		int current_status = rs_change_status_level.getInt(1); // if ongoing Communication
		 			current_status++;
		 			st.setInt(3 , current_status );	
			 	}
			 	
		
			 	if(session.getAttribute("username").equals("principal"))
			 		st.setInt(4 , 1 ); 										  // flag = 1 ==> Principal Message.
			 	else
			 		st.setInt(4 , 0);
			 	
			 	
			 	i = st.executeUpdate();				   					  // flag = 0 ==> User Message.
		 		
		 		
		 		
		 			
		 		getServletContext().setAttribute("event_id", event_id);	
		 		getServletContext().getRequestDispatcher("/my_events_detail.jsp").forward(request,response);
		 			
		 			
		 			
		 			
		 			
		 			
		 	
		 		
		/*
		 * if(i!=0){ pwinsert.println("Your data has been stored in the database"); }
		 * else { pwinsert.println("Your data could not be stored in the database"); }
		 */
			 
		 	
		 	}
		 	
		 	catch(Exception ex) {
		 		
		 		 ex.printStackTrace(); 
		 		}
	 	
	 	
	 	
	
	
	}

}
