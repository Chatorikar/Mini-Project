package com.Principal_Decision;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DataBaseConnection.GetConnection;
import com.mysql.jdbc.PreparedStatement;

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
					 	
					 	String insert_into_event_communication = "insert into event_communication values( ? , ? , ? , ?)";
					 	
					 	Connection con = (Connection) GetConnection.getConnection();
					 	
					 	PreparedStatement st_change_status_level = (PreparedStatement) con.prepareStatement(change_status_level); 
				 		
				 		st_change_status_level.setInt(1, Integer.parseInt(event_id));
				 		
				 		ResultSet rs_change_status_level = st_change_status_level.executeQuery();
				 		
				 		
				 		PreparedStatement st = (PreparedStatement) con.prepareStatement(update_event_ledger);;
					 	
					 	if(request.getParameter("btn") == null) 
					 		st.setInt(1, Integer.parseInt(event_id));
					 	else 
					 		st.setInt(1, Integer.parseInt(request.getParameter("btn")));
					 	
					 	
					 		int i = st.executeUpdate();
					 	
					 	st = (PreparedStatement)con.prepareStatement(insert_into_event_communication);
					 	
					 	if(request.getParameter("btn") == null) {
					 						 		
					 		st.setInt(1, Integer.parseInt(event_id));   		 // Event id
					 		
					 		session.removeAttribute( "event_id" );
					 		
					 	}
					 	else
					 		st.setInt(1, Integer.parseInt(request.getParameter("btn")));
					              
					 	if(request.getParameter("description") == null)
					 		st.setString(2 , request.getParameter("description") );   // Event description
					 	else 
					 		response.sendRedirect("DashBoard_Principal.jsp");
					 		
					 	
					 	if(rs_change_status_level.next() == false){  				 // if result set is empty
				 		
					 		st.setInt(3 , 1 );										  // Communication number
				 		}
					 	else {
					 	
					 		int current_status = rs_change_status_level.getInt(1); // if ongoing Communication
				 			current_status++;
				 			st.setInt(3 , current_status );	
					 	}
					 										  // Communication number
					 	
					 	st.setInt(4 , 1 ); 										  // flag = 1 ==> Principal Message.
					 
					 	i = st.executeUpdate();				   					  // flag = 0 ==> User Message.
					 	 	
			
//					 
						getServletContext().setAttribute("event_id", event_id);	
				 		getServletContext().getRequestDispatcher("/eventProp_detail.jsp").forward(request,response);
				 	
				 	}
			 	
			 	catch (Exception ex) {
			 		
			 		 ex.printStackTrace(); 
			 	}
		 	
		}
		else{
			 	
			 	int i = 0;
			 	
			 		
				 	try {
				 		
					 		Connection con = (Connection) GetConnection.getConnection();
					 		
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
						 	
					
						 	if(session.getAttribute("username").equals("principal"))
						 		st.setInt(4 , 1 ); 										  // flag = 1 ==> Principal Message.
						 	else
						 		st.setInt(4 , 0);
						 	
						 	
						 	i = st.executeUpdate();				   					  // flag = 0 ==> User Message.
					 		

							getServletContext().setAttribute("event_id", event_id);	
					 		getServletContext().getRequestDispatcher("/eventProp_detail.jsp").forward(request,response);
//						 	response.sendRedirect("DashBoard_Principal.jsp");
					 			
					 	}
				 	
				 	catch(Exception ex) 
				 	{
				 		
				 		 ex.printStackTrace(); 
				 	}
			 	
			}
		
			 	
	}
}
