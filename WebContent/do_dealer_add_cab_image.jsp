<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Java_Package.My_Queries"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<%
    
    if (session.getAttribute("user_id") != null) 
    {
       
    
    String submit=request.getParameter("submit");
%>

<html lang="en">
    
    <head> 
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="css/signup.css" rel="stylesheet">
                <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
                <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
                <link href="css/one-page-wonder.min.css" rel="stylesheet">
		<title>Sign Up</title>
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
              <a class="nav-link active" href="get_dealer.jsp">Profile</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="do_dealer_add_cabs.jsp">Add Cabs</a>
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
				
                                    <form class="Register" method="post" enctype="multipart/form-data" action="do_dealer_add_cab_image">
                                        <input type="hidden" name="user_id" value="<%=session.getAttribute("user_id").toString()%>">
                                            <h2 class="masthead-subheading mb-0">Upload Image Here</h2>
                                            <br>
                                            <%
                                                if(submit!=null)
                                                {
                                                String msg=session.getAttribute("msg").toString();
                                                String status=session.getAttribute("status").toString();
                                                if(msg!=null)
                                                {
                                            %>
                                            <div class="alert alert-<%=(status.equals("1"))?"success":"danger"%>">
                                                <strong><%=msg%></strong>
                                            </div>
                                            <%
                                            }
                                              session.removeAttribute("msg");
                                              session.removeAttribute("status");
                                            }
                                            %>
						

                                            <div class="form-group">
                                                    <label for="img" class="cols-sm-2 control-label">Browse Image</label>
                                                    <div class="cols-sm-10">
                                                            <div class="input-group">
                                                                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                                                    <input type="file" class="form-control" name="image" id="img"  placeholder="Upload image here"/>
                                                            </div>
                                                    </div>
                                            </div>
                                            <div class="form-group">
							<div class="cols-sm-10">
								<div class="input-group">
									
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
<%
    }
    else
    {
         response.sendRedirect("index.html");
    }
%>