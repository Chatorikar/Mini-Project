package com.Permission;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DataBaseConnection.GetConnection;

/**
 * Servlet implementation class user_hoarding_permisson
 */
@WebServlet("/user_hoarding_permisson")
public class user_hoarding_permisson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	try {
			HttpSession session = request.getSession();
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	        
	        String sql = "insert into misc_ledger values( ? , 1 , ? , ? , 1 , ? ) ";
	        
	        String Discripition = "OK";
	      
	        java.util.Date util_StartDate =format.parse(request.getParameter("start_date"));
	        
	        java.sql.Date sql_StartDate = new java.sql.Date( util_StartDate.getTime() );
	
	        java.util.Date util_EndDate = format.parse(request.getParameter("end_date"));
	      
	        java.sql.Date sql_EndDate = new java.sql.Date( util_EndDate.getTime() );
	        
	        Connection con = (Connection) GetConnection.getConnection();
	       
	        PreparedStatement st = (PreparedStatement) con .prepareStatement(sql);  // Create a Query
	        
	        String username = (String)session.getAttribute("username");
	      
	        st.setInt(1, Integer.parseInt((String)session.getAttribute("event_id")));
	        
	        
	        System.out.print((Integer.parseInt((String)session.getAttribute("event_id"))));
	        
	        st.setDate(2, sql_StartDate);
	        
	        st.setString(3, Discripition);
	        
	        st.setDate(4, sql_EndDate);
	      
	        st.executeUpdate();
	      
	        
	        
	        
	        sql = "insert into misc_ledger values( ? , 2 , ? , ? , 1 , ? ) ";
	        
	        st = (PreparedStatement) con .prepareStatement(sql); 
	        
	        st.setInt(1, Integer.parseInt((String)session.getAttribute("event_id")));
	        
	        st.setDate(2, sql_StartDate);
	        
	        st.setString(3, Discripition);
	        
	        st.setDate(4, sql_EndDate);
	      
	        st.executeUpdate();
	        
	        st.close();
	        
	        con.close();
	        
	        response.sendRedirect("my_events_detail.jsp");
			
		}
	
	catch (Exception e) {
        e.printStackTrace();
    }
  }
}