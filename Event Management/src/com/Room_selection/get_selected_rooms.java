package com.Room_selection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DataBaseConnection.GetConnection;

/**
 * Servlet implementation class get_selected_rooms
 */
@WebServlet("/get_selected_rooms")
public class get_selected_rooms extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//final String TIME_FORMAT = "HH:mm:ss";
		//final SimpleDateFormat timeFormat = new SimpleDateFormat(TIME_FORMAT, Locale.getDefault());

		HttpSession session =  request.getSession();
		String[] selectedStudentIds = (String[])session.getAttribute("rooms");
		String event_id = (String) session.getAttribute("event_id");
		
		System.out.print(event_id);
		String sql = " insert into slots_and_details values(?,?,1,1,?,?,?)";
		
		
		
		try 
		{
			Connection con = (Connection) GetConnection.getConnection();
			PreparedStatement Insert_into_slots_and_details = (PreparedStatement) con.prepareStatement(sql);
			ResultSet rs = null;
			
			
			for(int i = 0 ; i < selectedStudentIds.length ; i++)
			{
				Insert_into_slots_and_details = (PreparedStatement) con.prepareStatement(sql);
				
				Insert_into_slots_and_details.setInt(1, Integer.parseInt(event_id));
				
				Insert_into_slots_and_details.setInt(2, Integer.parseInt(selectedStudentIds[i]));
				
				Insert_into_slots_and_details.setString(3, request.getParameter("title"+selectedStudentIds[i] )); // purpose
				
				Insert_into_slots_and_details.setString(4, request.getParameter("description"+selectedStudentIds[i] ));
				
				String string = request.getParameter("time"+selectedStudentIds[i] );
				
				String[] parts = string.split(" ");
				
				String part1 = parts[0]; // 004
				
				String part2 = parts[2]; // 034556
				
				
				System.out.println("]]]]]]]]]]]]]");
				System.out.println(part1);
				System.out.println(part2);
				System.out.println("]]]]]]]]]]]]]");
				
				
				
				//Insert_into_slots_and_details.setTimestamp(5, new java.sql.Timestamp(new java.util.Date().getTime()));
				//Insert_into_slots_and_details.setTimestamp(6, new java.sql.Timestamp(new java.util.Date().getTime()));
				
			
				System.out.println("]]ssssssssss]]]]]]]]]]]");
				 
			//	**Insert_into_slots_and_details.setTime(5,new Time(timeFormat.parse(request.getParameter("starttime")).getTime()));
				
			//	Insert_into_slots_and_details.setTime(6,new Time(timeFormat.parse(request.getParameter("starttime")).getTime()));
				
				System.out.println( (String)request.getParameter("title"+selectedStudentIds[i] ));
				
				System.out.println((String) request.getParameter("description"+selectedStudentIds[i] ));
				
				System.out.println((String) request.getParameter("time"+selectedStudentIds[i] ));
 				String s = (String) request.getParameter("time"+selectedStudentIds[i] );
				
 				String temp[] = s.split(" ");
				
				if(s.equals("09:00 to 13:00"))
					Insert_into_slots_and_details.setInt(5,1);
 				
				if(s.equals("13:00 to 18:00"))
					Insert_into_slots_and_details.setInt(5,2);
				
				if(s.equals("09:00 to 18:00"))
					Insert_into_slots_and_details.setInt(5,3);
 				
//				if(temp[2].equals("18:00"))
//					Insert_into_slots_and_details.setInt(5,3);
//				else if(temp[0].equals("9:00"))
//					Insert_into_slots_and_details.setInt(5,1);
//				else 
//					Insert_into_slots_and_details.setInt(5,2);
					
				
				Insert_into_slots_and_details.executeUpdate();
				
				
			}
			
			
			String update_event_ledger = "update event_ledger set status_level = 4 where event_id = ?";
			
			
			
			Insert_into_slots_and_details = (PreparedStatement) con.prepareStatement(update_event_ledger);
			
			Insert_into_slots_and_details.setInt(1, Integer.parseInt(event_id));
			
			Insert_into_slots_and_details.executeUpdate();
			
			response.sendRedirect("DashBoard.jsp");
			
		}

	 	catch(Exception ex) {
	 		
	 		 ex.printStackTrace(); 
	 		}
 	
		
		
		
	}


	private Time getCurrentJavaSqlTime(String string) {
		// TODO Auto-generated method stub
		return null;
	}

}
