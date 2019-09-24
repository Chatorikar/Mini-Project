<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.DataBaseConnection.GetConnection"%>
    <%-- <%@page import="com.mysql.jdbc.Connection"%> --%>
  
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.PreparedStatement"%>
    <%@page import="java.sql.Connection"%>
    <%@page import="java.sql.*"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
 
    

    
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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <!-- Google fonts - Popppins for copy-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,800">
    <!-- orion icons-->
    <link rel="stylesheet" href="css/orionicons.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="img/logo.png">
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
		
		%>
    <!-- navbar-->
    <header class="header">
      <nav class="navbar navbar-expand-lg px-4 py-2 bg-white shadow">

        <!-- LOGO img E top left corner -->
        <a href="index.html"><img src="img/logo.png" style="width:50px; height:40px;"></a>

        <!-- For Side Bar Toggle -->
        <!-- <a href="#" class="sidebar-toggler text-gray-500 mr-4 mr-lg-5 lead"><i class="fas fa-align-left"></i></a> -->

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
      <div id="sidebar" class="sidebar py-3">
        <ul class="sidebar-menu list-unstyled">
              <li class="sidebar-list-item"><a href="index.html" class="sidebar-link text-muted active"><i class="o-home-1 mr-3 text-gray"></i><span>Home</span></a></li>
              <!-- <li class="sidebar-list-item"><a href="tables.html" class="sidebar-link text-muted"><i class="o-table-content-1 mr-3 text-gray"></i><span>Tables</span></a></li> -->
              <li class="sidebar-list-item"><a href="form.jsp" class="sidebar-link text-muted"><i class="o-survey-1 mr-3 text-gray"></i><span>New Event</span></a></li>
          <li class="sidebar-list-item"><a href="#" data-toggle="collapse" data-target="#pages" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>Events</span></a>
            <div id="pages" class="collapse">
              <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                <li class="sidebar-list-item"><a href="past_events.html" class="sidebar-link text-muted pl-lg-5">Past Events</a></li>
                <li class="sidebar-list-item"><a href="upcoming_events.html" class="sidebar-link text-muted pl-lg-5">My Events</a></li>
            </div>
          </li>
              <li class="sidebar-list-item"><a href="login.html" class="sidebar-link text-muted"><i class="o-exit-1 mr-3 text-gray"></i><span>Login</span></a></li>
        </ul>
      </div>

      <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">

          <section class="py-4">
          </section>

          <section>
            <div class="row">
              <div class="col-lg-12">
                <div class="card mb-5 mb-lg-0">         
                  <div class="card-header">
                    <h2 class="h6 mb-0 text-uppercase">Recent Messages from Authority</h2>
                  </div>
                  <div class="card-body">
                    <div class="d-flex justify-content-between align-items-start align-items-sm-center mb-4 flex-column flex-sm-row">
                      <div class="left d-flex align-items-center">
                        <div class="icon icon-lg shadow mr-3 text-gray"><i class="fab fa-dropbox"></i></div>
                        <div class="text">
                          <h6 class="mb-0 d-flex align-items-center"> <span>Dropbox Inc.</span><span class="dot dot-sm ml-2 bg-violet"></span></h6><small class="text-gray">Account renewal</small>
                        </div>
                      </div>
                      <div class="right ml-5 ml-sm-0 pl-3 pl-sm-0 text-violet">
                        <h5>-$20</h5>
                      </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-start align-items-sm-center mb-4 flex-column flex-sm-row">
                      <div class="left d-flex align-items-center">
                        <div class="icon icon-lg shadow mr-3 text-gray"><i class="fab fa-apple"></i></div>
                        <div class="text">
                          <h6 class="mb-0 d-flex align-items-center"> <span>App Store.</span><span class="dot dot-sm ml-2 bg-green"></span></h6><small class="text-gray">Software cost</small>
                        </div>
                      </div>
                      <div class="right ml-5 ml-sm-0 pl-3 pl-sm-0 text-green">
                        <h5>-$20</h5>
                      </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-start align-items-sm-center mb-4 flex-column flex-sm-row">
                      <div class="left d-flex align-items-center">
                        <div class="icon icon-lg shadow mr-3 text-gray"><i class="fas fa-shopping-basket"></i></div>
                        <div class="text">
                          <h6 class="mb-0 d-flex align-items-center"> <span>Supermarket.</span><span class="dot dot-sm ml-2 bg-blue"></span></h6><small class="text-gray">Shopping</small>
                        </div>
                      </div>
                      <div class="right ml-5 ml-sm-0 pl-3 pl-sm-0 text-blue">
                        <h5>-$20</h5>
                      </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-start align-items-sm-center mb-4 flex-column flex-sm-row">
                      <div class="left d-flex align-items-center">
                        <div class="icon icon-lg shadow mr-3 text-gray"><i class="fab fa-android"></i></div>
                        <div class="text">
                          <h6 class="mb-0 d-flex align-items-center"> <span>Play Store.</span><span class="dot dot-sm ml-2 bg-red"></span></h6><small class="text-gray">Software cost</small>
                        </div>
                      </div>
                      <div class="right ml-5 ml-sm-0 pl-3 pl-sm-0 text-red">
                        <h5>-$20</h5>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <section class="py-3">
          </section>

          <section>
            <div class="row">
               <div class="col-lg-6">
                <div class="card">
                  <div class="card-header">
                    <h6 class="text-uppercase mb-0"><a href="upcoming_events.html">My Events</a></h6>
                  </div>
                  
                  
                  
                  
                  
                  
                  
                  
                  <c:set var="count" value="0" scope="page" />
                  
                  <div class="card-body">                          
                    <table class="table table-striped table-md card-text">
                    
                      <thead>
                        <tr>
                          <th class="text-center">Sr.No</th>
                          <th class="text-center">Event Name</th>
                          <th class="text-center">Start Date</th>
                          <th class="text-center">End Date</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
		                  	Connection con 		 = null;
                      		PreparedStatement st = null;
		                  	ResultSet rs 		 = null;
		                
		                   	
		                  	try
		                  	{
		                  		String sql = "select * from event_ledger where username= ? order by start_date asc limit 5";
		                  		con = (Connection) GetConnection.getConnection();
		                  		st = con.prepareStatement(sql);
		                  		String Username =(String)session.getAttribute("username");
		                  		
		                  		
		                  		st.setString(1,Username);
		                  		rs = st.executeQuery();
		                  		while(rs.next())
		                  		{
		                  			
		                  %>
		                  			
		                  	
		                  		<tr class="text-center">
		                          <th scope="row">  <c:set var="count" value="${count + 1}" scope="page"/> ${count} </th>
		                          <td class="text-center"><%= rs.getString(2)  %></td>
		                          <td class="text-center"><%= rs.getDate(7)  %></td>
		                          <td class="text-center"><%= rs.getDate(8)  %></td>
                       		 	</tr>
		                  <% 	
		                  		}
		                  		
		                  	}
		                  	catch(Exception ex)
		                  	{
		                  		
		                  	}
                  	
                 	 %>
                 
                      
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>

              <div class="col-lg-6">
                <div class="card">
                  <div class="card-header">
                    <h6 class="text-uppercase mb-0"><a href="upcoming_events.html">Upcoming/Ongoing Events</a></h6>
                  </div>
                  
                  
                  
                  
                  
                  
                  
                  
                  <c:set var="count" value="0" scope="page" />
                  
                  <div class="card-body">                          
                    <table class="table table-striped table-md card-text table table-hover">
                    
                      <thead>
                        <tr>
                          <th class="text-center">Sr.No</th>
                          <th class="text-center">Event Name</th>
                          <th class="text-center">Start Date</th>
                          <th class="text-center">End Date</th>
                        </tr>
                      </thead>
                      <tbody>
                      <%
		                  	 con 				 = null;
		                  	 st 				 = null;
		                  	 rs 				 = null;
		                  	 ResultSet rs_1 	 = null;
		                  	 ResultSet row_num 	 = null;
		                   	
		                  	try
		                  	{
		                  		String query_1 = "select * from event_ledger order by start_date asc limit 5";
		                  		
		                  		String  query_2 = "select * from (select * from event_ledger order by start_date limit 5) as t where t.username= ? ";
		                  		
		                  		String  query_3 = "select * from event_ledger where username = ? order by start_date limit 1 ";
		                  		
		                  		con = (Connection) GetConnection.getConnection();
		                  		
		                  		st = con.prepareStatement(query_1);
		                  		
		                  		PreparedStatement st_1 = con.prepareStatement(query_2);
		                  		
		                  		String username = (String)session.getAttribute("username");
		                  		
		                  		st_1.setString(1,username);
		                  		
		                  		rs = st.executeQuery();
		                  		
		                  		rs_1 = st_1.executeQuery();
		                  		
		                  		int i = 1 , flag = 0;
		                  		
		                  		// rs_1.absolute(1) ==> True if it has some record ==> User having event in top 5 event 
		                  		
		                  		// rs_1.absolute(1) ==> Fasle if it is an empty set ==> 
		                  		// We have to find First Upcoming Event of a user to show it in last record in Upcoming/OnGoing table ===> 
		                  		// So we have to fetch it's details. 
		                  		
		                  		if(!rs_1.absolute(1))
		                  		{
		                  			st_1 = con.prepareStatement(query_3);
		                  			st_1.setString(1,(String)session.getAttribute("username"));
		                  			rs_1 = st_1.executeQuery();
		                  			st_1 = con.prepareStatement(query_3);
		                  			
		                  		}else{
		                  			i=6;
		                  		}
		                  		
		                  		
		                  		
		                  		while(rs.next())
			                  		{
		                  				if(rs_1.absolute(1) && i == 5) {
		                  					
		                  					/*  if( rs_1.getString(1).equals(username) )*/
			                  %>			
					                  		<tr bgcolor="#FFF000"  class="text-center " >
					                          <th bgcolor="#FFF000" scope="row">  <c:set var="count" value="${count + 1}" scope="page"/> ${count} </th>
					                          <td bgcolor="#FFF000" class="text-center dark-2" ><%= rs_1.getString(2)  %></td>
					                          <td bgcolor="#FFF000" class="text-center" ><%= rs_1.getDate(7)  %></td>
					                          <td bgcolor="#FFF000" class="text-center"><%= rs_1.getDate(8)  %></td>
			                       		 	</tr>
			                  <% 	
		                  				}
		                  				else 
		                  				{	
		                  					if(!username.equals(rs.getString(4)))
		                  					{
		                  					%>
		                  					<tr  class="text-center">
					                          <th scope="row">  <c:set var="count" value="${count + 1}" scope="page"/> ${count} </th>
					                          <td class="text-center"><%= rs.getString(2)  %></td>
					                          <td class="text-center"><%= rs.getDate(7)  %></td>
					                          <td class="text-center"><%= rs.getDate(8)  %></td>
					                          
			                       		 	</tr>
		                  					<% 
		                  					}
		                  					else{
			                  					
			                  					/*  if( rs_1.getString(1).equals(username) )*/
				                  %>			
						                  		<tr bgcolor="#FFF000"  class="text-center " >
						                          <th bgcolor="#FFF000" scope="row">  <c:set var="count" value="${count + 1}" scope="page"/> ${count} </th>
						                          <td bgcolor="#FFF000" class="text-center dark-2" ><%= rs.getString(2)  %></td>
						                          <td bgcolor="#FFF000" class="text-center" ><%= rs.getDate(7)  %></td>
						                          <td bgcolor="#FFF000" class="text-center"><%= rs.getDate(8)  %></td>
				                       		 	</tr>
				                  <% 	
			                  				}
		                  				}
		                  				i++;
			                  		}		                  		
		                  	}
		                  	catch(Exception ex)
		                  	{
		                  		
		                  	}
                 	 %>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <section class="py-3">
          </section>

        </div>
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
    <script src="js/charts-home.js"></script>
    <script src="js/front.js"></script>
  </body>
</html>