package com.Principal_Decision;

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
 * Servlet implementation class Principal_Decision
 */
@WebServlet("/Principal_Decision")
public class Principal_Decision extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	 	
	 	String event_id = (String)session.getAttribute("event_id");
	 			 	
	 	session.removeAttribute( "event_id" );
	 	
	 	String update_event_ledger = null;
	 	
	 	String change_status_level = "select max(communication_number) from event_communication where event_id = ?";
		
		
		
		if(request.getParameter("customRadioInline1") != null)
		{
		 	
		 	int Decision =Integer.parseInt(request.getParameter("customRadioInline1"));  // 1 ==> Accept // 2 ==> Reject	
		 		
			 	try {
			 			
			 			
				 		if(Decision == 1)
				 			update_event_ledger = "update event_ledger set status_level = 3  where event_id=?";
				 		else
				 			update_event_ledger = "update event_ledger set status_level = 2  where event_id=?";
					 	
					 //	String insert_into_event_communication = "insert into event_communication values( ? , ? , ? , ?)";
					 	
					 	Connection con = (Connection) GetConnection.getConnection();
					 	
				//	 	PreparedStatement st_change_status_level = (PreparedStatement) con.prepareStatement(change_status_level); 
				 		
				 		//st_change_status_level.setInt(1, Integer.parseInt(event_id));
				 		
				 		//ResultSet rs_change_status_level = st_change_status_level.executeQuery();
				 		
				 		
				 		PreparedStatement st = con.prepareStatement(update_event_ledger);
				 		st.setInt(1, Integer.parseInt(event_id));
				
				 		int i = st.executeUpdate();				   					  // flag = 0 ==> User Message.
				 	 	
					 	session.setAttribute("event_id_1", event_id);	

					 	
					 	response.sendRedirect("DashBoard_Principal.jsp");
				 		
				 		/*
				 * if(request.getParameter("btn") == null) st.setInt(1,
				 * Integer.parseInt(event_id)); else st.setInt(1,
				 * Integer.parseInt(request.getParameter("btn")));
				 * 
				 * 
				 * int i = st.executeUpdate();
				 * 
				 * st =
				 * (PreparedStatement)con.prepareStatement(insert_into_event_communication);
				 * 
				 * if(request.getParameter("btn") == null) {
				 * 
				 * st.setInt(1, Integer.parseInt(event_id)); // Event id
				 * 
				 * session.removeAttribute( "event_id" );
				 * 
				 * } else st.setInt(1, Integer.parseInt(request.getParameter("btn")));
				 * 
				 * if(request.getParameter("description") == null) st.setString(2 ,
				 * request.getParameter("description") ); // Event description else
				 * 
				 * response.sendRedirect("DashBoard_Principal.jsp");
				 * 
				 * 
				 * if(rs_change_status_level.next() == false){ // if result set is empty
				 * 
				 * st.setInt(3 , 1 ); // Communication number } else {
				 * 
				 * int current_status = rs_change_status_level.getInt(1); // if ongoing
				 * Communication current_status++; st.setInt(3 , current_status ); } //
				 * Communication number
				 * 
				 * st.setInt(4 , 1 ); // flag = 1 ==> Principal Message.
				 */
					 	
//					 
				/*
				 * getServletContext().setAttribute("event_id", event_id);
				 * getServletContext().getRequestDispatcher("/eventProp_detail.jsp").forward(
				 * request,response);
				 */
				 	
				 	}
			 	
			 	catch (Exception ex) {
			 		
			 		 ex.printStackTrace(); 
			 	}
		 	
		}
		else{
			 	
			 	int i = 0;
			 	
			 		
				 	try {
				 			String record_in_Database = "select * from event_communication where ( event_id = ?  and message = ? and communication_flag =1)"; 
				 						 			
				 			Connection con = (Connection) GetConnection.getConnection();
					 		
				 			PreparedStatement check_record_in_Database = (PreparedStatement) con.prepareStatement(record_in_Database);
				 			
				 			check_record_in_Database.setInt(1, Integer.parseInt(event_id)); 
				 			 System.out.print(Integer.parseInt(event_id));
				 			
				 			check_record_in_Database.setString(2, request.getParameter("message")); 
				 			
				 			
				 			

				 			ResultSet Check_DB = check_record_in_Database.executeQuery();
				 			
				 			if( Check_DB.next() == true)
				 			{	
				 				System.out.print(Check_DB.getString(2));
				 				session.setAttribute("event_id_1", event_id);	

							 	
							 	response.sendRedirect("eventProp_detail.jsp");
				 			}
				 			
				 			PreparedStatement st_change_status_level = (PreparedStatement) con.prepareStatement(change_status_level); 			 		
					 		
					 		st_change_status_level.setInt(1, Integer.parseInt(event_id));
					 		
					 		ResultSet rs_change_status_level = st_change_status_level.executeQuery();			 		
					 		
					 		PreparedStatement st = null;
					 		
					 		String insert_into_event_communication = "insert into event_communication values( ? , ? , ? , ?)";
						 	
					 		st = (PreparedStatement)con.prepareStatement(insert_into_event_communication);
						 	
						 	if(request.getParameter("btn") == null) {
						 						 		
						 		st.setInt(1, Integer.parseInt(event_id));   		 // Event id
						 		
						 		session.removeAttribute( "event_id" );
						 		
						 	}
						 	else if((request.getParameter("btn")) == null )
						 		st.setInt(1, Integer.parseInt(request.getParameter("btn")));
						 	else          
						 		st.setInt(1, Integer.parseInt(event_id));
						 	
						 	st.setString(2 , request.getParameter("message") );     // Event description
						 	
						 	
						 	if(rs_change_status_level.next() == false)  				 // if result set is empty
					 		{
					 		
						 		st.setInt(3 , 1 );										  // Communication number
					 		}
						 	else {
						 	
						 		int current_status = rs_change_status_level.getInt(1); // if ongoing Communication
					 			current_status++;
					 			st.setInt(3 , current_status );	
						 	}
						 	
					
						 	if(session.getAttribute("username").equals("princi"))
						 		st.setInt(4 , 1 ); 										  // flag = 1 ==> Principal Message.
						 	else
						 		st.setInt(4 , 0);
						 	
						 	
						 	i = st.executeUpdate();				   					  // flag = 0 ==> User Message.
					 		

					//		getServletContext().setAttribute("event_id", event_id);	
					 //		getServletContext().getRequestDispatcher("/eventProp_detail.jsp").forward(request,response);
						 	session.setAttribute("event_id_1", event_id);	

						 	
						 	response.sendRedirect("eventProp_detail.jsp");
					 			
					 	}
				 	
				 	catch(Exception ex) 
				 	{
				 		
				 		 ex.printStackTrace(); 
				 	}
			 	
			}
		
			 	
	}
}
