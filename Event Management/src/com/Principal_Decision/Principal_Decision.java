package com.Principal_Decision;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DataBaseConnection.GetConnection;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Principal_Decision
 */
@WebServlet("/Principal_Decision")
public class Principal_Decision extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String sql = "update event_ledger set status_level = status_level + 2  where event_id=?";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Decision =Integer.parseInt(request.getParameter("customRadioInline1"));
		int event_id  =Integer.parseInt(request.getParameter("submit"));
		System.out.print(event_id);
		
		// 1 ==> Accept
		// 2 ==> Reject
		if(Decision == 1)
		{	
		  try
			{	
				PrintWriter pwinsert = response.getWriter();
				
				Connection con = (Connection) GetConnection.getConnection();
				
				PreparedStatement st = (PreparedStatement) con.prepareStatement(sql);
				
				st.setInt(1, Integer.parseInt(request.getParameter("submit")));
				
				int i = st.executeUpdate();
				
				
				if(i!=0)    {
	                pwinsert.println("Your data has been stored in the database"); 
	            } 
	            else    { 
	                pwinsert.println("Your data could not be stored in the database"); 
	            } 
				
				
			}catch (Exception e) {
				
				
				e.printStackTrace();
			}
			
			response.sendRedirect("DashBoard_Principal.jsp");
		

	  }
	else {
		response.sendRedirect("DashBoard_Principal.jsp");
	}
}
}
