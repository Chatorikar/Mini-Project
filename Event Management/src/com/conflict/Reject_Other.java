package com.conflict;

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
import com.mysql.jdbc.CallableStatement;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class Reject_Other
 */
@WebServlet("/Reject_Other")
public class Reject_Other extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Decision =Integer.parseInt(request.getParameter("customRadioInline11"));
		
		HttpSession session = request.getSession();
	 	
	 	String event_id = (String)session.getAttribute("event_id");
	 	
	 	String Delete_from_Slots_and_detials = null;
	 	
	 	String update_event_ledger = null;
	 	
	 //	session.removeAttribute( "event_id" );
		if(Decision == 1)
		{
			try {
				String sql = " select distinct T.event_id,T.event_name , T.description ,  T.room_id,T.start_date,T.end_date from (select el.event_id, el.event_name , el.description ,  room_id,start_date,end_date,time_slot from event_ledger as el join slots_and_details as sd where el.event_id = sd.event_id and time_slot = 1) as T,(select el.event_id,el.event_name , el.description , room_id,start_date,end_date,time_slot from event_ledger as el join slots_and_details as sd where el.event_id = sd.event_id and time_slot = 1) as F where T.event_id != F.event_id and T.start_date = F.start_date";
				Connection	con = (Connection) GetConnection.getConnection();
				PreparedStatement	st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery();
				ResultSet rs_temp = null;
				while(rs.next())
				{
					if(rs.getInt(1) == Integer.parseInt(event_id) )
						continue;
					
					Delete_from_Slots_and_detials  = "delete from slots_and_details where event_id = ?";
					st = con.prepareStatement(Delete_from_Slots_and_detials);
					st.setInt(1, rs.getInt(1));
					st.executeUpdate();
					
					update_event_ledger  = "update event_ledger set status_level=3  where event_id  = ?";
					st = con.prepareStatement(update_event_ledger);
					st.setInt(1, rs.getInt(1));
					st.executeUpdate();
					
					
				}
				
//				sql = "call reject_others(?)";
//				
//				
//				CallableStatement stmt = null;
//				stmt = con.prepareCall("{call reject_others(?)}");
//				stmt.setInt(1, Integer.parseInt(event_id));
//				
				String query = "{CALL reject_others1(?)}";
//				CallableStatement stmt = con.prepareCall(query);
//				stmt.setInt(1, rs.getInt(1));
//				
//					
//				stmt.executeQuery();
				//register the OUT parameter before calling the stored procedure
				//stmt.registerOutParameter(6, java.sql.Types.VARCHAR);
				
				//stmt.executeUpdate();
//	            Statement statement = con.createStatement();
//
//				CallableStatement callableStatement = con.prepareCall(query)) ;
//				
//		            // create or replace stored procedure
//		            statement.execute(createSP);
//
//		            callableStatement.setInt(1, 3);
//				
				java.sql.Statement statement = con.createStatement();
				java.sql.CallableStatement callableStatement = con.prepareCall(query);
				
				callableStatement.setInt(1,rs.getInt(1) );
				callableStatement.executeUpdate();

				
				
			}
			catch(Exception e)
			{
				
			}
		}	
		
	}

}
