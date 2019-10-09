 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.DataBaseConnection.GetConnection"%>
    <%@page import="com.mysql.jdbc.Connection"%>
  
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.PreparedStatement"%>
   <%--  <%@page import="java.sql.Connection"%> --%>
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
    <script>

    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
    
    </script>
    <style type="text/css">
  
* {
  margin: 0;
  padding: 0;
}

.seat {
  float: left;
  display: block;
  margin: 5px;
  background: #E3F2FD;
  border: 2px #263238 solid;
  width: 60px;
  height: 60px;
}

.seat1 {
  float: left;
  display: block;
  margin: 5px;
  background: #E3F2FD;
  border: 2px #263238 solid;
  width: 60px;
  height: 135px;
}

.seat2 {
  float: left;
  display: block;
  margin: 5px;
  background: #E3F2FD;
  border: 2px #263238 solid;
  width: 135px;
  height: 360px;
}

input:disabled {
  display: block;
  margin: 5px;
  background: #BDBDBD;
  border: 2px #9E9E9E solid;
  width: 100px;
  height: 110px;
}

.seat-select {
  display: none;
}

.seat-select:checked+.seat {
  background: #536DFE;
}

.seat-select:checked+.seat1 {
  background: #536DFE;
}

.seat-select:checked+.seat2 {
  background: #536DFE;
}

</style>

<script>

</script>
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

      <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">

          <section class="py-5">
            <div class="row">
              <div class="col-lg-12 mb-4">
                <div class="card">
                  <div class="card-header">
                    <h6 class="text-uppercase mb-0">My Events</h6>
                  </div>
                  <div class="card-body">
                    <form id="room_book" method="post" action="accept_details_of_selected_rooms.jsp">
                      <!-- Floor Selection -->
                      <!-- <div class="form-group row justify-content-center">
                        <label class="col-md-2 form-control-label"><p class="pt-1" style="font-size: 20px;">Select Floor :</p></label>
                        <div class="col-md-3 select mb-3 pl-0">
                          <select name="account" class="form-control">
                            <option>Ground</option>
                            <option>First</option>
                            <option>Second</option>
                            <option>Third</option>
                            <option>Fourth</option>
                          </select>
                        </div>
                      </div> -->

                      <div class="form-group row justify-content-center">
                        <label class="col-md-12 form-control-label text-center"><p class="pt-1" style="font-size: 20px;">Select Rooms for your Event</p></label>
                      </div>
			
                      <div class="row justify-content-center pb-5">
                        <div class="col-md-4">
                          <section id="seats">
                            <table>
                              <!-- Row 1 -->
                              <tr>
                                <td>
                                  <input id="seat-1" class="seat-select" type="checkbox" value="1" name="seat[]">
                                  <label for="seat-1" class="seat" data-toggle="popover" data-content="001"></label>
                                </td>
                                <td>
                                  <input id="seat-2" class="seat-select" type="checkbox" value="2" name="seat[]">
                                  <label for="seat-2" class="seat" data-toggle="popover" data-content="002"></label>
                                </td>
                                <td colspan="2" rowspan="5">
                                  <input id="seat-3" class="seat-select" type="checkbox" value="3" name="seat[]">
                                  <label for="seat-3" class="seat2" data-toggle="popover" data-content="BasketBall Ground"></label>
                                </td>
                              </tr>
                              <!-- Row 2 -->
                              <tr>
                                <td>
                                  <input id="seat-4" class="seat-select" type="checkbox" value="4" name="seat[]">
                                  <label for="seat-4" class="seat" data-toggle="popover" data-content="003"></label>
                                </td>
                                <td rowspan="2">
                                  <input id="seat-5" class="seat-select" type="checkbox" value="5" name="seat[]">
                                  <label for="seat-5" class="seat1" data-toggle="popover" data-content="Seminar Hall 1"></label>
                                </td>
                              </tr>
                              <!-- Row 3 -->
                              <tr>
                                <td>
                                  <input id="seat-6" class="seat-select" type="checkbox" value="6" name="seat[]">
                                  <label for="seat-6" class="seat" data-toggle="popover" data-content="004"></label>
                                </td>
                              </tr>
                              <!-- Row 4 -->
                              <tr>
                                <td>
                                  <input id="seat-7" class="seat-select" type="checkbox" value="7" name="seat[]">
                                  <label for="seat-7" class="seat" data-toggle="popover" data-content="005"></label>
                                </td>
                                <td rowspan="2">
                                  <input id="seat-8" class="seat-select" type="checkbox" value="8" name="seat[]">
                                  <label for="seat-8" class="seat1" data-toggle="popover" data-content="Seminar Hall 2"></label>
                                </td>
                              </tr>
                              <!-- Row 5 -->
                              <tr>
                                <td>
                                  <input id="seat-9" class="seat-select" type="checkbox" value="9" name="seat[]">
                                  <label for="seat-9" class="seat" data-toggle="popover" data-content="006"></label>
                                </td>
                              </tr>
                            </table>

                          </section>
                        </div>
                      </div>

                      <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-5 mx-auto">
                          <button type="reset" id="refresh" class="btn btn-secondary ml-4 mr-2">Clear</button>
                          <input class="btn btn-primary ml-2" type="submit" value="Next">
                        </div>
                      </div>
                    </form>

                  </div>
                </div>

                <section class="py-2"></section>




	 <%
			        
				Connection con 		 = null;
			   	PreparedStatement st = null;
			 	ResultSet rs_1 		 = null;
			 	ResultSet rs_2 		 = null;
            	
          
             	
            	try
            	{
            		
            		
            		con = (Connection) GetConnection.getConnection();
            		
            		String sql_1 = "select message , communication_flag from resource_communication where event_id = ? order by communication_number desc";
            		
            		String sql_2 = "select name from users where username  = ? ";
            		
            		String value = request.getParameter("btn");   // calling from DashBoard.java to this 
            		
            		String username =(String)session.getAttribute("username");
            		
            		int id = 0;
            		
            		if(value == null)
            		{
            			// calling from user_to_principal.java to this 
            			
            			/* ServletContext sc = request.getServletContext();
            			value = (String)sc.getAttribute("event_id"); */
            			
            			value = (String)session.getAttribute("event_id_1");	
            			 if(value == null)
            				value = (String)session.getAttribute("event_id");	 
            			System.out.println("***1******" + value);
            			
            		}
            		
            		System.out.println("******2***");
            		
            		id = Integer.parseInt(value);
            		
            		System.out.println("*****3****");
            		System.out.println(id);
            		
            		st = con.prepareStatement(sql_1);
            		System.out.println("*****4****");
            		
            		st.setInt(1, id);
            		System.out.println("*****5****");
            		
            		rs_1 = st.executeQuery();
            		System.out.println("*****6****");
            		 
            		st = null;
            		System.out.println("*****7****");
            		
            		st = con.prepareStatement(sql_2);
            		System.out.println("*****8****");
            		
            		st.setString(1 ,username);
            		System.out.println("*****9****");
            		
            		rs_2 = st.executeQuery();
            		System.out.println("*****10****");
            		
            		//String event_id =null;
            		
            		System.out.println("*****11****");
/*             		session.setAttribute("event_id", value);
 */            		
 					rs_2.next();
 					
 					System.out.println("*****12****");
            		
 					
            	%>
            	
                      
                      
                      
                      
                        







                  <div class="card">
                    <div class="card-header">
                      <h3 class="h6 text-uppercase mb-0">Messaging (HOD)</h3>
                    </div>

                    <div class="card-body">
                      <form action="Hod_Chat" method="post">
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
                                 <h2 class="h6 mb-0 text-uppercase">HOD</h2>
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
                <p class="mb-2 mb-md-0">Mini Bois &copy; 2019</p>
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
    <script src="js/animation.js"></script>
    <script src="js/front.js"></script>

    
    <script type="text/javascript">
      
      $(document).ready(function(){
        $('[data-toggle="popover"]').popover({
            placement : 'top',
            trigger : 'hover'
        });

        $('input[type="checkbox"]').on('change', function(e){
          if(e.target.checked){
            $('#myModal').modal();
          }
        });

        $("#refresh").click(function () { 
          location.reload(true); 
        }); 

      });

    </script>
  </body>
</html>