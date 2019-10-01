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
			if(request.getParameter("btn") == null)
			{
				response.sendRedirect("DashBoard_Principal.jsp");
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
              <li class="sidebar-list-item"><a href="DashBoard_Principal.jsp" class="sidebar-link text-muted"><i class="o-home-1 mr-3 text-gray"></i><span>Home</span></a></li>
              <!-- <li class="sidebar-list-item"><a href="tables.html" class="sidebar-link text-muted"><i class="o-table-content-1 mr-3 text-gray"></i><span>Tables</span></a></li> -->
              <li class="sidebar-list-item"><a href="forms.html" class="sidebar-link text-muted"><i class="o-survey-1 mr-3 text-gray"></i><span>New Event</span></a></li>
              <li class="sidebar-list-item"><a href="eventProp.html" class="sidebar-link text-muted active"><i class="o-survey-1 mr-3 text-gray"></i><span>Event Proposals</span></a></li>
          <li class="sidebar-list-item"><a href="#" data-toggle="collapse" data-target="#pages" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>Events</span></a>
            <div id="pages" class="collapse">
              <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                <li class="sidebar-list-item"><a href="past_events.html" class="sidebar-link text-muted pl-lg-5">Past Events</a></li>
                <li class="sidebar-list-item"><a href="upcoming_events.html" class="sidebar-link text-muted pl-lg-5">My Events</a></li>
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
		                  		
		                  		String sql_1 = "select * from event_ledger where event_id = ? ";
		                  		String sql_2 = "select * from users where username  = ? ";
		                  		
		                  		String value = request.getParameter("btn");
		                  		
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
		                  		
		                  		
		                  		
		                  		while( (rs_1.next()) && (rs_2.next()))
		                  		{
		                  	%>
		                  	
                
	




      <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">

          <section class="py-4">
          </section>

          <section id="msg" style="display: none;">
            <div class="alert alert-success">
              <strong>Success!</strong> Message sent Successfully
            </div>
          </section>

          <section id="msg0" style="display: none;">
            <div class="alert alert-danger">
              <strong>Ops!</strong> Please select ACCEPTED or REJECTED
            </div>
          </section>

          <section>
            <div class="row">
              <div class="col-lg-12 mb-4">
                
                <div class="card">
                  <div class="card-header">
                    <div class="row">
                      <div class="col-sm-3">
                       <h3 class="h6 text-uppercase mb-0">Event Name : <span><%= rs_1.getString(2)  %></h3>
                       
                      </div>
                      <div class="col-sm-3"></div>
                      <div class="col-sm-6">
                        <h3 class="h6 text-uppercase mb-0">Sender : <span><%= rs_2.getString(4)  %></span></h3>
                      </div>
                    </div>
                  </div>

                  <div class="card-body">

                    <div class="row">
                      <div class="col-md-12">
                        <div class="row py-3">
                          <div class="col-md-2">Head Organiser</div>
                          <div class="col-md-1">:</div>
                          <div class="col-md-9"><i>Mark</i></div>
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

                            
                      </div>
                    </div>

                    <section class="py-3"></section>

                    <div class="row">
                      <div class="col-md-12">
                          <form action="Principal_Decision" onsubmit="validate()" method="post">
                            <div class="form-group">
                              <div class="row">
                                <div class="col-md-3"></div>
                                <div class="custom-control custom-radio custom-control-inline col-md-3">
                                  <input id="customRadioInline1" type="radio" name="customRadioInline1" class="custom-control-input" value="1" >
                                  <label for="customRadioInline1" class="custom-control-label"><h4>Accept</h4></label>
                                </div>
                                <div class="custom-control custom-radio custom-control-inline col-md-3">
                                  <input id="customRadioInline2" type="radio" name="customRadioInline1" class="custom-control-input" value="0" >
                                  <label for="customRadioInline2" class="custom-control-label"><h4>Reject</h4></label>
                                </div>
                                <div class="col-md-3"></div>
                              </div>
                            </div>

                            <br>

                            <div class="form-group">
                              <div class="row">
                                <div class="col-md-2">
                                  <label>Message</label>
                                </div>
                                <div >
                                  <label>:</label>
                                </div>
                                <div class="col-md-8">
                                  <textarea type="textarea" class="form-control" style="min-height: 100px;" name="description"></textarea>
                                  <small class="form-text text-muted ml-3">Any Message for the Organiser.</small>
                                </div>
                              </div>
                            </div>

                            <br>
                            <div class="row">
                              <div class="col-md-10"></div>
                              <div class="form-group col-md-2">       
                                <button type="submit" class="btn btn-primary">Send</button>
                              </div>
                            </div>
                          </form>
                      </div>
                    </div>

                  </div>
                </div>

              </div>
            </div>
          </section>
        </div>
			<% 	
			
		                  		}
		                  		
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

    <script type="text/javascript">
      function validate() {
        //alert("Please select ACCEPT or REJECT !");
        c1 = document.getElementById("customRadioInline1");
        c2 = document.getElementById("customRadioInline2");

        if(c1.checked == false && c2.checked == false) {
          accept = document.getElementById("msg");
          reject = document.getElementById("msg0");

          accept.style.display = "none";
          reject.style.display = "block";

          event.preventDefault();

          $("html, body").animate({ scrollTop: 0 }, 600);
        }
        else {
          success();
        }
      }

      function success() {
        accept = document.getElementById("msg");
        reject = document.getElementById("msg0");
        
        accept.style.display = "block";
        reject.style.display = "none";

        $("html, body").animate({ scrollTop: 0 }, 600);
      }

      $(document).ready(function(){
      $('[data-toggle="popover"]').popover({
          placement : 'bottom',
          trigger : 'hover'
        });
      });

    </script>
  </body>
</html>