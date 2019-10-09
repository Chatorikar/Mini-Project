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
 * Servlet implementation class Publicity_Permission
 */
@WebServlet("/Publicity_Permission")
public class Publicity_Permission extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String update_misc_ledger = null;
		System.out.print("++++++++++++++" + (String)request.getParameter("customRadioInline1"));
		if(request.getParameter("customRadioInline1") != null)
		{
			int Decision =Integer.parseInt(request.getParameter("customRadioInline1")); // 1 ==> Accept , Publicity // 2 ==> Reject
			{
				if(Decision == 1)
					update_misc_ledger = "update misc_ledger set request_status = 3  where event_id=? and permission_type = 1";
		 		else
		 			update_misc_ledger = "update misc_ledger set request_status = 2  where event_id=? and permission_type = 1";
				
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
