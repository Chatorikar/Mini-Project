<%@page import="com.sun.tools.javac.util.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.DataBaseConnection.GetConnection"%>
    <%-- <%@page import="com.mysql.jdbc.Connection"%> --%>
  
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="java.sql.*"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
    

    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Event Manager</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
	<link rel="stylesheet" href="css/font.css">    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link href="css/icon.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="img/logo.png">
     <script src="https://kit.fontawesome.com/e7282b0417.js" crossorigin="anonymous"></script>
     
  </head>
  <body>
		  <%
		
			response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate" );
		
			response.setHeader("Progma", "no-cahce");
			
			response.setHeader("Expires", "0");
			
			if(session.getAttribute("username") == null)
			{
				response.sendRedirect("Login.jsp");
			}
			
			/* if(request.getParameter("btn") == null)
			{
				response.sendRedirect("DashBoard.jsp");
			} */
			
		
		%>
    <!-- navbar-->
    <header class="header">
      <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow">

        <!-- LOGO img E top left corner -->
        <a href="index.html"><img src="img/logo.png" style="width:50px; height:40px;"></a>

        <!-- For Side Bar Toggle -->
       <a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i class="fas fa-align-left ml-2"></i></a> 

        <a href="#" class="navbar-brand font-weight-bold text-uppercase text-base "><font size="4.6">Welcome  ${username} </font>  </a>
        <ul class="ml-auto d-flex align-items-center list-unstyled mb-0">
          <li class="nav-item dropdown mr-3"><a id="notifications" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle text-gray-400 px-1"><i class="fa fa-bell"></i><span class="notification-icon"></span></a>
            <div aria-labelledby="notifications" class="dropdown-menu"><a href="#" class="dropdown-item">
                <div class="d-flex align-items-center">
                  <div class="icon icon-sm bg-violet text-white"><i class="fab fa-twitter"></i></div>
                  <div class="text ml-2">
                    <p class="mb-0">You have 2 followers</p>
                  </div>
                </div></a><a href="#" class="dropdown-item"> 
                <div class="d-flex align-items-center">
                  <div class="icon icon-sm bg-green text-white"><i class="fas fa-envelope"></i></div>
                  <div class="text ml-2">
                    <p class="mb-0">You have 6 new messages</p>
                  </div>
                </div></a><a href="#" class="dropdown-item">
                <div class="d-flex align-items-center">
                  <div class="icon icon-sm bg-blue text-white"><i class="fas fa-upload"></i></div>
                  <div class="text ml-2">
                    <p class="mb-0">Server rebooted</p>
                  </div>
                </div></a><a href="#" class="dropdown-item">
                <div class="d-flex align-items-center">
                  <div class="icon icon-sm bg-violet text-white"><i class="fab fa-twitter"></i></div>
                  <div class="text ml-2">
                    <p class="mb-0">You have 2 followers</p>
                  </div>
                </div></a>
              <div class="dropdown-divider"></div><a href="#" class="dropdown-item text-center"><small class="font-weight-bold headings-font-family text-uppercase">View all notifications</small></a>
            </div>
          </li>
          <li class="nav-item dropdown ml-auto"><a id="userInfo" href="http://example.com" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="nav-link dropdown-toggle"><img src="img/Dp.jpeg" style="max-width: 5.5rem;" class="img-fluid rounded-circle shadow"></a>
            <div aria-labelledby="userInfo" class="dropdown-menu"><a href="#" class="dropdown-item"><strong class="d-block text-uppercase headings-font-family">${username}</strong><small>Web Developer</small></a>
              <div class="dropdown-divider"></div><a href="#" class="dropdown-item">Settings</a><a href="#" class="dropdown-item">Activity log       </a>
              <div class="dropdown-divider"></div><a href="Logout" class="dropdown-item">Logout</a>
            </div>
          </li>
        </ul>
      </nav>
    </header>

    <div class="d-flex align-items-stretch">

      <!-----Side-Bar--------------------------------------------------------------------------------------------->

      <div id="sidebar" class="sidebar py-3">
        <ul class="sidebar-menu list-unstyled">
              <li class="sidebar-list-item"><a href="DashBoard.jsp" class="sidebar-link text-muted"><i class="o-home-1 mr-3 text-gray"></i><span>Home</span></a></li>
              <!-- <li class="sidebar-list-item"><a href="tables.html" class="sidebar-link text-muted"><i class="o-table-content-1 mr-3 text-gray"></i><span>Tables</span></a></li> -->
              <li class="sidebar-list-item"><a href="forms.html" class="sidebar-link text-muted"><i class="o-survey-1 mr-3 text-gray"></i><span>New Event</span></a></li>
          <li class="sidebar-list-item"><a href="#" data-toggle="collapse" data-target="#pages" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted active"><i class="o-wireframe-1 mr-3 text-gray"></i><span>Events</span></a>
            <div id="pages" class="collapse">
              <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                <li class="sidebar-list-item"><a href="past_events.html" class="sidebar-link text-muted pl-lg-5">Past Events</a></li>
                <li class="sidebar-list-item"><a href="my_events.html" class="sidebar-link text-muted pl-lg-5">My Events</a></li>
              </ul>
            </div>
          </li>
              <li class="sidebar-list-item"><a href="login.html" class="sidebar-link text-muted"><i class="o-exit-1 mr-3 text-gray"></i><span>Login</span></a></li>
        </ul>
      </div>

      <!-----Center-Content--------------------------------------------------------------------------------------------->

	<%
            	Connection con 		 = null;
              	PreparedStatement st = null;
            	ResultSet rs_1 		 = null;
            	ResultSet rs_2 		 = null;
          
             	
            	try
            	{
            		
            		String username =(String)session.getAttribute("username");
            		
            		String sql_1 = "select * from event_ledger join misc_ledger using(event_id) where event_id = ?";
            		
            		String if_join_fails = "select * from event_ledger  where event_id = ?";
            		
            		String sql_2 = "select * from users where username  = ? ";
            		
            		String value = request.getParameter("btn");   // calling from DashBoard.java to this 
            		
            		if(value == null)
            		{
            			// calling from user_to_principal.java to this 
            			
            			/* ServletContext sc = request.getServletContext();
            			value = (String)sc.getAttribute("event_id"); */
            			
            			value = (String)session.getAttribute("event_id_1");	
            			
            		}
            		
            		
            		boolean join_fail = false;
            		
            		int id = Integer.parseInt(value);
            		
            		con = (Connection) GetConnection.getConnection();
            		
            		st = con.prepareStatement(sql_1);
            		
            		st.setInt(1, id);
            		
            		rs_1 = st.executeQuery();
            		
            		st = null;
            		
            		st = con.prepareStatement(sql_2);
            		
            		st.setString(1 ,username);
            		
            		rs_2 = st.executeQuery();
            		
            		String event_id =null;
            		
            		session.setAttribute("event_id", value);
            		
            		if(!rs_1.absolute(1))
            		{
            			join_fail = true;
            			
            			st = con.prepareStatement(if_join_fails);
                		
                		st.setInt(1, id);
                		
                		rs_1 = st.executeQuery();
                		
            			
            		}
            		  rs_2.next();
            		  int c = 1;
            		  if(join_fail)
            		  {
            			  rs_1.next();	
            		  }
            		do/* ( (rs_1.next())) */
            		{
            	%>
            	

      <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">

          <section class="py-5">
            <div class="row">
              <div class="col-lg-12 mb-4">

                  <div class="card">
                    <div class="card-header">
                      <h3 class="h6 text-uppercase mb-0">Event Name</h3>
                    </div>

                    <div class="card-body">
					<%
						if( rs_1.getInt(5) >= 3)
						{
					
					%>
           
           				<h5><span>Approved by Principal </span> </h5>
          		  <% 
						}
						else if( rs_1.getInt(5) == 2) {
						
                   %>
           				  <h5><span>Rejected by Principal</span> </h5>
           				  <%} else  { %>
           				  
           				  <h5><span>Waiting for Principal Response</span></h5>
           				  <%} %>
           				  
           		
                      <br>
                      <div class="row">
                      <div class="col-md-12">
                        <div class="row py-3">
                          <div class="col-md-2">Head Organiser</div>
                          <div class="col-md-1">:</div>
                          <div class="col-md-9"><i><%= rs_2.getString(4)  %></i></div>
                        </div>
                        <div class="row py-3">
                          <div class="col-md-2">Start Date</div>
                          <div class="col-md-1">:</div>
                          <div class="col-md-9"><i><%= rs_1.getDate(7)  %></i></div>
                        </div>
                        <div class="row py-3">
                          <div class="col-md-2">End Date</div>
                          <div class="col-md-1">: </div>
                          <div class="col-md-9"><i><%= rs_1.getDate(8)  %></i></div>
                        </div>
                        <div class="row py-3">
                          <div class="col-md-2">Event Description</div>
                          <div class="col-md-1">:</div>
                          <div class="col-md-9"><i><%= rs_1.getString(3)  %></i></div>
                        </div>
					
						<%
						if( rs_1.getInt(5) >= 3 )
						{
					
					%>
           				 <div class="row py-3">
                          <div class="col-md-2">Flex Start Date : </div>
                          <div class="col-md-1">:</div>
                          <% if (!join_fail){ %>
                          <div class="col-md-9 d-inline""><i><%= rs_1.getDate(10)  %></i>
                         <% if (  rs_1.getInt(12) == 3 ){ %>
                         	<div class="col-md -12 d-inline my-5 ml-lg-0"><i class="fa fa-check-circle fa-2x" aria-hidden="true"  ></i></div>
                         <%} else { %>
                         	<div class="col-md -12 d-inline my-5 ml-lg-0">  <i class="fas fa-sync fa-spin"></i></div> 	
                         <%} %>
                          </div>
                          
                          <%} else {%>
                          			-
                          	<%} %>
                        </div>
                        
                        <div class="row py-3">
                          <div class="col-md-2">Flex End Date : </div>
                          <div class="col-md-1">:</div>
                          <% if (!join_fail){ System.out.print("O-----join-------" ); %>
                          <div class="col-md-9 d-inline"><i><%= rs_1.getDate(13)  %></i>
                         <% if (  rs_1.getInt(12) == 3 ){  %>
                         	<div class="col-md -12 d-inline my-5 ml-lg-0"><i class="fa fa-check-circle fa-2x" aria-hidden="true"  ></i></div>
                         <%} else { 
                        	 System.out.println("O------------" );
                        	 System.out.println(rs_1.getInt(1));
                        	 System.out.println(rs_1.getString(2));
                        	 System.out.println(rs_1.getString(3));
                        	 System.out.println(rs_1.getString(4));
                        	 System.out.println(rs_1.getInt(5));
                        	 System.out.println(rs_1.getInt(6));
                        	 System.out.println(rs_1.getDate(7));
                        	 System.out.println(rs_1.getDate(8));
                        	 System.out.println(rs_1.getInt(9));
                        	 System.out.println(rs_1.getDate(10));
                        	 System.out.println(rs_1.getString(11));
                        	 System.out.println(rs_1.getInt(12) ); 
                        	 System.out.print(rs_1.getDate(13));%>
                         	<div class="col-md -12 d-inline my-5 ml-lg-0">  <i class="fas fa-sync fa-spin"></i></div> 	
                         <%} %>
                          </div>
                          
                          <%} else {%>
                          			-
                          	<%} %>
                        </div>
                        
                        
                        
                        
                        
                        
                        
                        <div class="row py-3">
                          <div class="col-md-2">Publicity Start Date : </div>
                          <div class="col-md-1">:</div>
                          <% if (!join_fail){  System.out.print(rs_1.getInt(9) );%>
                          <div class="col-md-9 d-inline""><i><%= rs_1.getDate(10)  %></i>
                         <% if(c == 1){ 
                         		rs_1.next();
                         		c++;
                         		System.out.print("ODDDDDDDDDDDDDDDD " );
                         		System.out.print(rs_1.getInt(9) );
                         		
                         	}
                         	if (  rs_1.getInt(12) == 3 ){ %>
                         	<div class="col-md -12 d-inline my-5 ml-lg-0"><i class="fa fa-check-circle fa-2x" aria-hidden="true"  ></i></div>
                         <%} else { %>
                         	<div class="col-md -12 d-inline my-5 ml-lg-0">  <i class="fas fa-sync fa-spin"></i></div> 	
                         <%} %>
                          </div>
                          
                          <%} else {%>
                          			-
                          	<%} %>
                        </div>
                        
                        <div class="row py-3">
                          <div class="col-md-2">Publicity End Date : </div>
                          <div class="col-md-1">:</div>
                          <% if (!join_fail){ %>
                          <div class="col-md-9 d-inline""><i><%= rs_1.getDate(13)  %></i>
                         <% if (  rs_1.getInt(12) == 3 ){ %>
                         	<div class="col-md -12 d-inline my-5 ml-lg-0"><i class="fa fa-check-circle fa-2x" aria-hidden="true"  ></i></div>
                         <%} else if (  rs_1.getInt(12) == 2){ %>
                         	haha	
                         <%} else {%>
                         	<div class="col-md -12 d-inline my-5 ml-lg-0">  <i class="fas fa-sync fa-spin"></i></div> 	
                         <%} %>
                          </div>
                          
                          <%} else {%>
                          			-
                          	<%} %>
                        </div>
                        
                        
                           <div class="row py-3">
                        	<form action="room_selection.jsp">
           						<button type="submit" class="btn-sm btn-success mx-3" >ClassRoom Selection</button>
           				    </form> 
           				   
           				        <button type="button" data-toggle="modal" data-target="#myModal1" class="btn-sm btn-info mx-3">Flex Permission</button>
                            <div id="myModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
                            <div role="document" class="modal-dialog modal-lg">
                              <div class="modal-content">

                                <div class="modal-header">
                                  <h4 id="exampleModalLabel" class="modal-title">Event Name</h4>
                                  <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                                </div>

                                <div class="modal-body">
                                  <p>Request for granting permission to put flex in college </p>

                                  <form class="form-horizontal" action="user_hoarding_permisson" method="post">
                                    <div class="form-group row">
                                      <label class="col-sm-2 form-control-label">From Date</label>
                                      <div class="col-sm-1"> : </div>
                                      <div class="col-md-3">
                                        <input id="inputHorizontalSuccess" type="Date" placeholder="" class="form-control form-control-success"  name="start_date">
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                      <label class="col-sm-2 form-control-label">To Date</label>
                                      <div class="col-sm-1"> : </div>
                                      <div class="col-md-3">
                                        <input id="inputHorizontalWarning" type="Date" placeholder="" class="form-control form-control-warning"  name="end_date">
                                      </div>
                                    </div>
                                    <div class="form-group row">       
                                      <div class="col-md-9 ml-auto">
                                        <input type="submit" value="Submit" class="btn btn-primary" >
                                      
                                      </div>
                                    </div>
                                  </form>

                                </div>

                              </div>
                            </div>
                            </div>
           				  <button type="button" data-toggle="modal" data-target="#myModal1" class="btn-sm btn-info mx-3">Publicity Permission</button>
                            <div id="myModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
                            <div role="document" class="modal-dialog modal-lg">
                              <div class="modal-content">

                                <div class="modal-header">
                                  <h4 id="exampleModalLabel" class="modal-title">Event Name</h4>
                                  <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                                </div>

                                <div class="modal-body">
                                  <p>Request for granting Publicity permission </p>

                                  <form class="form-horizontal" action=#>
                                    <div class="form-group row">
                                      <label class="col-sm-2 form-control-label">From Date</label>
                                      <div class="col-sm-1"> : </div>
                                      <div class="col-md-3">
                                        <input id="inputHorizontalSuccess" type="Date" placeholder="" class="form-control form-control-success">
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                      <label class="col-sm-2 form-control-label">To Date</label>
                                      <div class="col-sm-1"> : </div>
                                      <div class="col-md-3">
                                        <input id="inputHorizontalWarning" type="Date" placeholder="" class="form-control form-control-warning">
                                      </div>
                                    </div>
                                    <div class="form-group row">       
                                      <div class="col-md-9 ml-auto">
                                       <button type="submit" value="submit_btn" class="btn btn-primary pull-right my-2" style="float:right;" name="submit"  id="submit_btn"> Submit</button> 
                                      </div>
                                    </div>
                                  </form>

                                </div>

                              </div>
                            </div>
                            </div>
                             </div>
          		  <% 
						}
						else if( rs_1.getInt(5) == 2) {
						
                   %>
           				  <button type="button" class="btn btn-primary disabled ">Proceed</button>
           				  <%} else  { %>
           				  
           				  
           				 	
           				 	<button type="button" class="btn disabled">Proceed</button>
           				 	
           				  <%} %>
					
					
                         
                            
                      </div>
                    </div>


                    </div>
                  </div>

                  <section class="py-2"></section>

                  <div class="card">
                    <div class="card-header">
                      <h3 class="h6 text-uppercase mb-0">Messaging</h3>
                    </div>

                    <div class="card-body">
                      <form action="user_to_principal_message" method="post">
                        <br>
                        <div class="form-group">
                          <label>Message</label>
                          <textarea type="textarea" class="form-control" style="height: 80px;" name="message"></textarea>
                        </div>

                        <div class="form-group">
                          <div class="row justify-content-right">
                            <div class="col-10"></div>
                            <div class="col-2">
                              <input type="submit" value="Send" class="btn btn-primary">
                            </div>
                          </div>
                        </div>
                      </form>

                     
                       
		<% 	
			
		                  		}while(!rs_1.next());
		                  		
		                     }
		                  	
		                  	catch(Exception ex)
		                  	{
		                  			//out.print(ex);
		                  	}
                  	
          %>
                      
                      
        <%
			        
			      	 st 		 = null;
			    	 rs_1 		 = null;
			    	
            	
          
             	
            	try
            	{
            		
            		
            		
            		String sql_1 = "select message , communication_flag from event_communication where event_id = ? order by communication_number desc";
            		
            		String sql_2 = "select name from users where username  = ? ";
            		
            		String value = request.getParameter("btn");   // calling from DashBoard.java to this 
            		
            		String username =(String)session.getAttribute("username");
            		
            		if(value == null)
            		{
            			// calling from user_to_principal.java to this 
            			
            			/* ServletContext sc = request.getServletContext();
            			value = (String)sc.getAttribute("event_id"); */
            			
            			value = (String)session.getAttribute("event_id_1");	
            			
            		}
            		
            		
            		
            		int id = Integer.parseInt(value);
            		
            		st = con.prepareStatement(sql_1);
            		
            		st.setInt(1, id);
            		
            		rs_1 = st.executeQuery();
            		 
            		st = null;
            		
            		st = con.prepareStatement(sql_2);
            		
            		st.setString(1 ,username);
            		
            		rs_2 = st.executeQuery();
            		
            		String event_id =null;
            		
/*             		session.setAttribute("event_id", value);
 */            		
 					rs_2.next();
            		
            		while( rs_1.next() )
            		{
            	%>
            	
                      
                      
                      
                      
                        
                     

                      <section class="py-2"></section>

                      <section>
                        <div class="row">
                          <div class="col-lg-12">
                            <div class="card mb-lg-0">         
                              <div class="card-header">
                              <%
                              	 if(rs_1.getInt(2) == 0)
                              	 {
                              %>
                                <h2 class="h6 mb-0 text-uppercase"><%= rs_2.getString(1)  %></h2>
                               <% 
                               	 }
                              	 else
                              	 { 
                               
                               %> 
                                 <h2 class="h6 mb-0 text-uppercase">Principal</h2>
                                 <%} %>
                              </div>
                              <div class="card-body"><%= rs_1.getString(1)  %>.</div>
                            </div>
                            <% } %>
                          </div>
                        </div>
                      </section>

                    </div>
                  </div>
                
              </div>
            </div>
          </section>
        </div>
        
		<% 	
			
		                  		
		                  		
		
		                     }
		                  	
		                  	catch(Exception ex)
		                  	{
		                  			out.print(ex);
		                  	}
                  	
          %>
        <!-----Footer--------------------------------------------------------------------------------------------->

        <footer class="footer bg-white shadow align-self-end py-3 px-xl-5 w-100">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-6 text-center text-md-left text-primary">
                <p class="mb-2 mb-md-0">Your company &copy; 2018-2020</p>
              </div>
              <div class="col-md-6 text-center text-md-right text-gray-400">
                <p class="mb-0">Design by <a href="https://bootstrapious.com/admin-templates" class="external text-gray-400">Mini Bois</a></p>
                <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
              </div>
            </div>
          </div>
        </footer>

      </div>
    </div>
    <!-- JavaScript files-->
  
    
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/popper.js/umd/popper.min.js"> </script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>