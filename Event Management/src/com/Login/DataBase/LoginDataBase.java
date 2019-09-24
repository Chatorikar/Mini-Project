package com.Login.DataBase;

import java.sql.ResultSet;

import com.DataBaseConnection.GetConnection;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;


/*
 * Data Access Object.java
 * For JDBC connection
 * Fetch Data From DataBase
 * */
public class LoginDataBase {
	
	String sql = "select * from users where username=? and password=? ";
	
	public int check(String uname , String pass)
	{
		try
		{
			Connection con = (Connection) GetConnection.getConnection();
			PreparedStatement st = (PreparedStatement) con.prepareStatement(sql);
			
			st.setString(1, uname);
			st.setString(2, pass);
			
			ResultSet rs = st.executeQuery();
			
			if(rs.absolute(1))
			{
				return rs.getInt(3);		// Return Access Level if Match Found
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
		
		return -1;
	}
}
