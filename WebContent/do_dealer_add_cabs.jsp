<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Java_Package.My_Queries"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<%if(session.getAttribute("user_id")==null)
{
    response.sendRedirect("index.html");
}

%>
<html lang="en">
    
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="css/signup.css" rel="stylesheet">
                <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
                <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
                <link href="css/one-page-wonder.min.css" rel="stylesheet">
		<title>Add Cabs</title>
	</head>
        <body class="masthead">
          <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#"> </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
              <li class="nav-item">
              <a class="nav-link" href="get_dealer.jsp">Profile</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="do_dealer_add_cabs.jsp">Add Cabs</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">View Bookings</a>
            </li>
<!--            <li class="nav-item">
              <a class="nav-link" href="signup.jsp">Account</a>
            </li>-->
            <li class="nav-item">
              <a class="nav-link" href="logout_user">Log Out</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
		<div class="container text-white">
			<div class="row main ">
				<div class="main-login main-center masthead  text-white ">
				
					<form class="Register" method="get" action="add_cab.jsp">
                                            <h2 class="masthead-subheading mb-0">Add Cabs</h2>
                                            <br>
                                           <%
                                                String msg="",status="";
                                                if(session.getAttribute("done")!=null)
                                                {
                                                    msg=session.getAttribute("msg").toString();
                                                    status=session.getAttribute("status").toString();
                                                
                                           %>
                                            <div class="alert alert-<%=(status.equals("1"))?"success":"danger"%>">
                                                <strong><%=msg%></strong>
                                            </div>
                                            <%
                                                }
                                                session.removeAttribute("msg");
                                                session.removeAttribute("status");
                                                session.removeAttribute("done");
                                            
                                            %>
                                          
						<div class="form-group">
							<label for="cab_name" class="cols-sm-2 control-label">Cab Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="cab_name" id="cab_name"  placeholder="Enter Cab Name"/>
								</div>
							</div>
						</div>

						

						<div class="form-group">
							<label for="cab_no" class="cols-sm-2 control-label">Enter Cab Number</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="cab_no" id="cab_no"  placeholder="Enter your Cab Reg. No."/>
								</div>
							</div>
						</div>
                                            <div class="form-group">
							<label for="cab_from" class="cols-sm-2 control-label">Cab From</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="cab_from" id="cab_from"  placeholder="Enter your Starting Place"/>
								</div>
							</div>
						</div>
                                            <div class="form-group">
							<label for="cab_to" class="cols-sm-2 control-label">Cab To</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="cab_to" id="cab_to"  placeholder="Enter your Lase Place"/>
								</div>
							</div>
						</div>
                                             
<!--                                            <div class="form-group">
                                                <label for="cab_type" class="cols-sm-2 control-label">Cab Type</label>
                                                <div class="cols-sm-10">
                                                    <div class="input-group">
                                                        <select class="form-control" name="cab_type" id="user_type">
                                                            <option >User</option>
                                                            <opti                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       on >Dealer</option>
                                                            <option name="dealer">Admin</option>
                                                        </select>
                                                    </div>
                                              </div>
                                            </div>-->
                                                
                                            <div class="form-group">
							<label for="driver_name" class="cols-sm-2 control-label">Driver Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="driver_name" id="driver_name"  placeholder="Enter Driver Name"/>
								</div>
							</div>
						</div>
                                            <div class="form-group">
							<label for="driver_mobile_no" class="cols-sm-2 control-label">Driver Mobile No.</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="driver_mobile_no" id="driver_mobile_no"  placeholder="Enter Driver Mobile No."/>
								</div>
							</div>
						</div>
                                            <div class="form-group">

							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="submit" style="background-color:#fb531d" class="form-control btn btn-lg login-button" name="submit"  value="Submit"/>
								</div>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>

		 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
     <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	</body>
</html>