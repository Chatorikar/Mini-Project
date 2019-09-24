<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Event_ledger" method="post">
		
		
		<label for="name"><b>Name</b></label>
	    <input type="text"  name="name" required>
	    
	    <br><label for="email"><b>Email</b></label>
	    <input type="text"  name="email" required> <br>
		<input type="submit" value="Submit">
	</form>
</body>
</html> --%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="Event_ledger" method="post">
		
		
		<label for="name"><b>Name</b></label>
	    <input type="text"  name="name" required>
	    
	    <br><label for="email"><b>Email</b></label>
	    <input type="text"  name="email" required> <br>
		<input type="submit" value="Submit">
	</form>
</body>
</html> --%>

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
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>
  <body>
 		 <%
		
			
			
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

        <a href="index.html" class="navbar-brand font-weight-bold text-uppercase text-base">Event Manager Dashboard</a>
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
            <div aria-labelledby="userInfo" class="dropdown-menu"><a href="#" class="dropdown-item"><strong class="d-block text-uppercase headings-font-family">Mark Stephen</strong><small>Web Developer</small></a>
              <div class="dropdown-divider"></div><a href="#" class="dropdown-item">Settings</a><a href="#" class="dropdown-item">Activity log       </a>
              <div class="dropdown-divider"></div><a href="Login.jsp" class="dropdown-item">Logout</a>
            </div>
          </li>
        </ul>
      </nav>
    </header>
    <div class="d-flex align-items-stretch">
      <div id="sidebar" class="sidebar py-3">
        <ul class="sidebar-menu list-unstyled">
              <li class="sidebar-list-item"><a href="DashBoard.jsp" class="sidebar-link text-muted"><i class="o-home-1 mr-3 text-gray"></i><span>Home</span></a></li>
              <!-- <li class="sidebar-list-item"><a href="tables.html" class="sidebar-link text-muted"><i class="o-table-content-1 mr-3 text-gray"></i><span>Tables</span></a></li> -->
              <li class="sidebar-list-item"><a href="forms.html" class="sidebar-link text-muted active"><i class="o-survey-1 mr-3 text-gray"></i><span>New Event</span></a></li>
          <li class="sidebar-list-item"><a href="#" data-toggle="collapse" data-target="#pages" aria-expanded="false" aria-controls="pages" class="sidebar-link text-muted"><i class="o-wireframe-1 mr-3 text-gray"></i><span>Events</span></a>
            <div id="pages" class="collapse">
              <ul class="sidebar-menu list-unstyled border-left border-primary border-thick">
                <li class="sidebar-list-item"><a href="past_events.html" class="sidebar-link text-muted pl-lg-5">Past Events</a></li>
                <li class="sidebar-list-item"><a href="upcoming_events.html" class="sidebar-link text-muted pl-lg-5">Current/Upcoming Events</a></li>
            </div>
          </li>
              <li class="sidebar-list-item"><a href="login.html" class="sidebar-link text-muted"><i class="o-exit-1 mr-3 text-gray"></i><span>Login</span></a></li>
        </ul>
      </div>
      <div class="page-holder w-100 d-flex flex-wrap">
        <div class="container-fluid px-xl-5">
          <section class="py-5">
            <div class="row">
              <!-- Form Elements -->
              <div class="col-lg-12 mb-5">
                <div class="card">

                  <div class="card-header">
                    <h3 class="h6 text-uppercase mb-0">Organize New Event</h3>
                  </div>

                  <div class="card-body">
                  	<h5 id="req"></h5>
                    <form class="form-horizontal" action="Event_ledger" method="post" name="event_registration">
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label">Event Name</label>
                        <div class="col-md-7">
                          <input type="text" class="form-control" id="ename" onblur="validate(1)" name="event_name">
                        </div>
                        <div class="col-md-1" id="info1" style="display: none;">
                        	<img src="img/alert.png" style="max-width: 1.5rem;" class="img-fluid rounded-circle shadow" data-toggle="popover" data-content="This field is Required!">
                        </div>
                      </div>

                      <div class="line"></div>
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label">Event Description</label>
                        <div class="col-md-7">
                          <textarea type="text" class="form-control" id="edes" onblur="validate(2)" style="height: calc(2.25rem + 150px);" name="description"></textarea>
                          <small class="form-text text-muted ml-3">Provide full description of the Event for approval.</small>
                        </div>
                        <div class="col-md-1" id="info2" style="display: none;">
                        	<img src="img/alert.png" style="max-width: 1.5rem;" class="img-fluid rounded-circle shadow" data-toggle="popover" data-content="This field is Required!">
                        </div>
                      </div>

                      <!-- Event Start Date -->
                      <div class="line"></div>
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label">Event Start Date</label>
                        <div class="col-md-2">
                          <input type="date" class="form-control" id="date1" onblur="validateStart_Date()" style="width:100%;" name="start_date">
                        </div>
                        <div class="col-md-1" id="info3" style="display: none;" data-placement="left">
                        	<img src="img/alert.png" style="max-width: 1.5rem;" id="start_date" class="img-fluid rounded-circle shadow" data-toggle="popover" data-placement="left">
                        </div>
                      </div>

                      <!-- Event End Date -->
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label">Event End Date</label>
                        <div class="col-md-2">
                          <input type="date" class="form-control" id="date2" onblur="validateEnd_Date()" style="width:100%;" name="end_date">
                        </div>
                        <div class="col-md-5" id="info4" style="display: none;" data-placement="left">
                        	<img src="img/alert.png" style="max-width: 1.3rem;" id="end_date" class="img-fluid rounded-circle shadow" data-toggle="popover" data-placement="left">
                        </div>
                      </div>

                      <!-- Event Organiser -->
                      <div class="line"></div>
                      <div class="form-group row">
                        <label class="col-md-3 form-control-label">Head Organiser</label>
                        <div class="col-md-2 select mb-3">
                          <select name="account" class="form-control">
                            <option>HOD</option>
                            <option>Teacher</option>
                            <option>Student</option>
                          </select>
                        </div>
                        <div class="col-md-5">
                        	<input type="text" class="form-control" placeholder="Name" id="org" onblur="validate(5)">
                        </div>
                        <div class="col-md-1" id="info5" style="display: none;">
                        	<img src="img/alert.png" style="max-width: 1.5rem;" class="img-fluid rounded-circle shadow" data-toggle="popover" data-content="This field is Required!">
                        </div>
                      </div>

                      <div class="line"></div>
                      <div class="form-group row">
                        <div class="col-md-9 ml-auto">
                          <button type="reset" class="btn btn-secondary">Clear</button>
                          <input type="submit" class="btn btn-primary" value="submit">
                        </div>
                      </div>

                    </form>
                  </div>

                </div>
              </div>
            </div>
          </section>
        </div>
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
    <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
    <script src="js/front.js"></script>

    <script>
    function validateStart_Date()
    {
	    	d1 = document.getElementById("date1");
	        info3 = document.getElementById("info3");
	        start_d = document.querySelector("#start_date");
    	    
    	    var GivenDate = document.forms["event_registration"]["start_date"].value;
    	    
    	    var CurrentDate = new Date();
    	    
    	    GivenDate = new Date(GivenDate);
    	    
    	    if(GivenDate < CurrentDate){
    	        
    	    	d2.style.borderColor = "red";
                info3.style.display = "block";
                start_d.setAttribute("data-content", "Invalid End Date!");
                flag = true;
    	       
    	        document.getElementById("date1").value = "";
    	        document.getElementById("date1").focus();
    	    }
    	    else {
    	    	date1.style.borderColor = "green";
                info3.style.display = "none";
            }
    	}
    
    function validateEnd_Date()
    {
	    	
	        d2 		= document.getElementById("date2");
	        info4   = document.getElementById("info4");
	        end_d = document.querySelector("#end_date");
    	    
    	    var StartDate = document.forms["event_registration"]["start_date"].value;
    	    var EndDate   = document.forms["event_registration"]["end_date"].value;
    	    
    	   
    	    StartDate = new Date(StartDate);
    	    EndDate   = new Date(EndDate);
    	    
    	    if(StartDate > EndDate){
    	        
    	    	d2.style.borderColor = "red";
                info4.style.display = "block";
                end_d.setAttribute("data-content", "Invalid End Date!");
                flag = true;
    	       
    	        document.getElementById("date2").value = "";
    	        document.getElementById("date2").focus();
    	    }
    	    else {
    	    	date2.style.borderColor = "green";
                info4.style.display = "none";
            }
    	}
    
    
    
        function validate(val) {
            flag = false;
            ename = document.getElementById("ename");
            edes = document.getElementById("edes");
            d1 = document.getElementById("date1");
            d2 = document.getElementById("date2");
            org = document.getElementById("org");
            info1 = document.getElementById("info1");
            info2 = document.getElementById("info2");
            info3 = document.getElementById("info3");
            info4 = document.getElementById("info4");
            info5 = document.getElementById("info5");
            start_d = document.querySelector("#start_date");
            end_d = document.querySelector("#end_date");
            today = Date();
            selectStart = Date(d1);

            if(val >= 1 || val == 0) {
	            if (ename.value == "") {
	                ename.style.borderColor = "red";
	                info1.style.display = "block";
	                flag = true;
	            } else {
	                ename.style.borderColor = "green";
	                info1.style.display = "none";
	            }
	        }

	        if(val >= 2 || val == 0) {
	            if (edes.value == "") {
	                edes.style.borderColor = "red";
	                info2.style.display = "block";
	                flag = true;
	            } else {
	                edes.style.borderColor = "green";
	                info2.style.display = "none";
	            }
	        }

	        if(val >= 3 || val == 0) {
	            if (d1.value == "") {
	                d1.style.borderColor = "red";
	                info3.style.display = "block";
	                start_d.setAttribute("data-content", "This field is Required!");
	                flag = true;
	            }
	            else if(selectStart < today) {
	            	d1.style.borderColor = "red";
	                info3.style.display = "block";
	                start_d.setAttribute("data-content", "Invalid Start Date!");
	                flag = true;
	            }
	            else {
	                d1.style.borderColor = "green";
	                info3.style.display = "none";
	            }
	        }

	        if(val >= 4 || val == 0) {
	            if (d2.value == "") {
	                d2.style.borderColor = "red";
	                info4.style.display = "block";
	                end_d.setAttribute("data-content", "This field is Required!");
	                flag = true;
	            } 
	            else if(d2.value < d1.value) {
	            	d2.style.borderColor = "red";
	                info4.style.display = "block";
	                end_d.setAttribute("data-content", "Invalid End Date!");
	                flag = true;
	            }
	            else {
	                d2.style.borderColor = "green";
	                info4.style.display = "none";
	            }
	        }

	        if(val >= 5 || val == 0) {
	            if (org.value == "") {
	                org.style.borderColor = "red";
	                info5.style.display = "block";
	                flag = true;
	            } else {
	                org.style.borderColor = "green";
	                info5.style.display = "none";
	            }
	        }

            if (flag) {
                // document.getElementById("req").innerHTML = "Please Fill all the Details..!!";
                document.getElementById("req").style.color = "red";
            }

            event.preventDefault();
        }

        $(document).ready(function(){
		    $('[data-toggle="popover"]').popover({
		        placement : 'right',
		        trigger : 'hover'
		    });
		});
        
        
       
    </script>
  </body>
</html>