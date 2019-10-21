package com.HOD;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Accept_Permission
 */
@WebServlet("/Accept_Permission")
public class Accept_Permission extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Decision =Integer.parseInt(request.getParameter("customRadioInline11"));
		
		HttpSession session = request.getSession();
	 	
	 	String event_id = (String)session.getAttribute("event_id");
	 	
	 	String Delete_from_Slots_and_detials = null;
	 	
	 	String update_event_ledger = null;
	 	System.out.print(event_id);
		
		
	}

}
