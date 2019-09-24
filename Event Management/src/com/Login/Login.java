package com.Login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.Login.DataBase.LoginDataBase;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
			
		LoginDataBase db = new LoginDataBase();
		HttpSession session = request.getSession();
		
		int access_level = db.check(uname, pass);
		
		if(access_level != -1)
		{
			
			session.setAttribute("username", uname);
			
			switch(access_level)
			{
				case 1:
					response.sendRedirect("DashBoard.jsp");
					break;
				
				case 2:
					response.sendRedirect("DashBoard_Principal.jsp");
					break;
				default:
					response.sendRedirect("DashBoard.jsp");
					break;
			}
			
		}
		
		else
		{	
			session.invalidate();
			response.sendRedirect("Login.jsp");
		}
		
	}

	
}
