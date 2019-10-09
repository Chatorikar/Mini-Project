package com.HOD;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DataBaseConnection.GetConnection;

/**
 * Servlet implementation class Hod_Chat
 */
@WebServlet("/Hod_Chat")
public class Hod_Chat extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	 	
		System.out.print("=======1========");
	 	String event_id = (String) session.getAttribute("event_id_1");
	 	String event_id_1 = (String) session.getAttribute("event_id");
	 	System.out.print("=======1========");
	 	session.removeAttribute( "event_id" );
	 	
	 	
	 	
	 	
	  
	 	String update_event_ledger = null;
	 	
	 	String change_status_level = "select max(communication_number) from resource_communication where event_id = ?";
	 	
	 	
	 	System.out.print("=======1========");
	 	
	 	int i = 0;
	 	
	 		
		 	try {
		 		
		 		System.out.print("=======1========");
		 		String record_in_Database = "select * from resource_communication where ( event_id = ?  and message = ? and communication_flag =1)"; 
		 		System.out.print("=======2========");	
	 			Connection con = (Connection) GetConnection.getConnection();
	 			System.out.print("=======3========");
	 			PreparedStatement check_record_in_Database = (PreparedStatement) con.prepareStatement(record_in_Database);
	 			System.out.print("=======4========");
	 			if(event_id != null)
	 				check_record_in_Database.setInt(1, Integer.parseInt(event_id)); 
	 			else
	 				check_record_in_Database.setInt(1, Integer.parseInt(event_id_1)); 
	 			
	 			System.out.print("=======5========");
	 			
	 			System.out.print("=======6========");
	 			check_record_in_Database.setString(2, request.getParameter("message")); 
	 			System.out.print("=======7========");
	 			
	 			

	 			ResultSet Check_DB = check_record_in_Database.executeQuery();
	 			System.out.print("=======8========");
	 			if( Check_DB.next() == true)
	 			{	System.out.print("=======9========");
	 				System.out.print(Check_DB.getString(2));
	 				session.setAttribute("event_id_1", event_id);	

	 				System.out.print("=======10========");
				 	response.sendRedirect("room_selection.jsp");
	 			}
			
		 		
		 		//Connection con = (Connection) GetConnection.getConnection();
	 			System.out.print("=======11========");
		 		PreparedStatement st_change_status_level = (PreparedStatement) con.prepareStatement(change_status_level); 
		 		System.out.print("=======12========");
		 		if(event_id != null)
		 			st_change_status_level.setInt(1, Integer.parseInt(event_id));
		 		else
		 			st_change_status_level.setInt(1, Integer.parseInt(event_id_1));
		 		System.out.print("=======13========");
		 		ResultSet rs_change_status_level = st_change_status_level.executeQuery();
		 		System.out.print("=======14========");
		 			
		 		
		 		
		 		
		 		
		 	  
			 	
			 	String insert_into_event_communication = "insert into resource_communication values( ? , ? , ? , ?)";
			 	System.out.print("=======15========");
			 	  
			 	 
			 	
			 	
	
			 	//-------------------------------------------------------------------------
			 	
			 	PreparedStatement st = (PreparedStatement)con.prepareStatement(insert_into_event_communication);
			 	
			 	System.out.print("=======16========");
			 	if(event_id != null)
			 		st.setInt(1, Integer.parseInt(event_id));
			 	else
			 		st.setInt(1, Integer.parseInt(event_id_1));
			 	System.out.print("=======17========");
			 	
			 	st.setString(2 , request.getParameter("message") );     	 // Event description
			 	System.out.print("=======18========");
			 	
			 	if(rs_change_status_level.next() == false)  				 // if result set is empty
		 		{
			 		System.out.print("=======19========");
			 	
			 		st.setInt(3 , 1 );										  // Communication number
			 		System.out.print("=======20========");
		 		}
			 	else {
			 		System.out.print("=======21========");
			 		int current_status = rs_change_status_level.getInt(1); // if ongoing Communication
		 			current_status++;
		 			st.setInt(3 , current_status );	
		 			System.out.print("=======22========");
			 	}
			 	
		
			 	if(session.getAttribute("username").equals("hod"))
			 		st.setInt(4 , 1 ); 										  // flag = 1 ==> Principal Message.
			 	else
			 		st.setInt(4 , 0);
			 	
			 	System.out.print("=======23========");
			 	i = st.executeUpdate();				   					  // flag = 0 ==> User Message.
			 	System.out.print("=======24========");
		 		
		 		
		 		//getServletContext().setAttribute("event_id", event_id);	
		 		//getServletContext().getRequestDispatcher("/my_events_detail.jsp").forward(request,response);
			 	if(event_id == null) {
			 		session.setAttribute("event_id_1", event_id_1);	
			 	
			 		session.setAttribute("event_id", event_id_1);	
			 	}
			 	else {
			 		session.setAttribute("event_id_1", event_id);	
				 	
			 		session.setAttribute("event_id", event_id);	
			 	}

			 	System.out.print("======25========");
			 	response.sendRedirect("room_selection.jsp");	
		 			
			 	System.out.print("=======36========");	
		 			
		 			
		 	
		 		
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
