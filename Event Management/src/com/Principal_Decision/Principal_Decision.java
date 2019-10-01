package com.Principal_Decision;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

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
		 	
		 	PrintWriter pwinsert = response.getWriter();
		 	
		 	int Decision =Integer.parseInt(request.getParameter("customRadioInline1"));  // 1 ==> Accept // 2 ==> Reject
		  
		 	String update_event_ledger = null;
		 	
		 	int i = 0;
		 	
		 		
			 	try {
			 		
			 		if(Decision == 1)
			 			update_event_ledger = "update event_ledger set status_level = 3  where event_id=?";
			 		else
			 			update_event_ledger = "update event_ledger set status_level = 2  where event_id=?";
				 	
				 	String insert_into_event_communication = "insert into event_communication values( ? , ? , ? , ?)";
				 	
				 	Connection con = (Connection) GetConnection.getConnection();  
				 	 
				 	PreparedStatement st = (PreparedStatement) con.prepareStatement(update_event_ledger);
				 	
				 	
				 	if(request.getParameter("btn") == null) 
				 		st.setInt(1, Integer.parseInt(event_id));
				 	else 
				 		st.setInt(1, Integer.parseInt(request.getParameter("btn")));
				 	
				 	
				 		i = st.executeUpdate();
				 	
			/*
			 * if(i!=0){ pwinsert.println("Your data has been stored in the database"); }
			 * else { pwinsert.println("Your data could not be stored in the database"); }
			 */
				 	
				 	//-------------------------------------------------------------------------
				 	
				 	st = (PreparedStatement)con.prepareStatement(insert_into_event_communication);
				 	
				 	if(request.getParameter("btn") == null) {
				 						 		
				 		st.setInt(1, Integer.parseInt(event_id));   		 // Event id
				 		
				 		session.removeAttribute( "event_id" );
				 		
				 	}
				 	else
				 		st.setInt(1, Integer.parseInt(request.getParameter("btn")));
				              
				 	
				 	st.setString(2 , request.getParameter("description") );   // Event description
				 	
				 	st.setInt(3 , 1 );										  // Communication number
				 	
				 	st.setInt(4 , 1 ); 										  // flag = 1 ==> Principal Message.
				 
				 	i = st.executeUpdate();				   					  // flag = 0 ==> User Message.
				 	 	
			/*
			 * if(i!=0){ pwinsert.println("Your data has been stored in the database"); }
			 * else { pwinsert.println("Your data could not be stored in the database"); }
			 */
				 	response.sendRedirect("DashBoard_Principal.jsp");
			 	
			 	}
			 	
			 	catch (Exception ex) {
			 		
			 		 ex.printStackTrace(); 
			 		}
		 	
		 	
		 	
	}
}
