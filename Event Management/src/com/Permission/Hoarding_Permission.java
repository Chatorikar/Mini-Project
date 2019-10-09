package com.Permission;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DataBaseConnection.GetConnection;

/**
 * Servlet implementation class Hoarding_Permission
 */
@WebServlet("/Hoarding_Permission")
public class Hoarding_Permission extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String update_misc_ledger = null;
		//System.out.print("++++++++++++++" + (String)request.getParameter("customRadioInline1"));
		if(request.getParameter("customRadioInline11") != null)
		{
			int Decision =Integer.parseInt(request.getParameter("customRadioInline11")); // 1 ==> Accept , Publicity // 2 ==> Reject
			{
				if(Decision == 1)
					update_misc_ledger = "update misc_ledger set request_status = 3 where event_id=? and permission_type = 2"; //   permission_type = 2 ==> Hoarding_Permission 
		 		else
		 			update_misc_ledger = "update misc_ledger set request_status = 2 where event_id=? and permission_type = 2"; // permission_type = 1 ==> Publicity_Permission 
				
				try {
				 	Connection con = (Connection) GetConnection.getConnection();
				 	PreparedStatement st = (PreparedStatement)con.prepareStatement(update_misc_ledger);
				 	System.out.print(Integer.parseInt((String)request.getParameter("submit")));
				 	st.setInt(1, Integer.parseInt((String)request.getParameter("submit")));
				 	int i = st.executeUpdate();
				}
				catch(Exception ex)
				{
					ex.printStackTrace();
				}

			}
		}
		
		response.sendRedirect("DashBoard_Principal.jsp");
	}

}
