package com.Login.DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


/*
 * Data Access Object.java
 * For JDBC connection
 * Fetch Data From DataBase
 * */
public class LoginDataBase {
	
	String sql = "select * from users where username=? and password=? ";
	String url = "jdbc:mysql://localhost:3306/Event_Management";
	String username="pratham";
	String password="1";
	public boolean check(String uname , String pass)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password);
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1, uname);
			st.setString(2, pass);
			
			ResultSet rs = st.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
		
		return false;
	}
}
