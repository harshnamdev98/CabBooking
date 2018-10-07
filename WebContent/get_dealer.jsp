
<%@page import="Java_Package.My_Queries"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%
    
//    out.println(session.getAttribute("id"));
//    if(session==null)
//                response.sendRedirect(request.getHeader("referer"));
    if (session.getAttribute("user_id") == null) 
    {
        response.sendRedirect("index.html");

    }
    else
    {

    ResultSet rs = null;
    ResultSet rs1 = null;
    
        HashMap<String, String> hm = new HashMap<String, String>();
        hm.put("tablename", "all_users");
        hm.put("user_id", String.valueOf(session.getAttribute("user_id")));
        rs = My_Queries.select_Query(hm);
        rs.next();
        String user_id=rs.getString("user_id");
        String user_type=rs.getString("user_type");
        
        HashMap<String, String> hm1 = new HashMap<String, String>();
        hm1.put("tablename", user_type);
        hm1.put("user_id", user_id);
        rs1 = My_Queries.select_Query(hm1);
        rs1.next();
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

                                <form class="Register" method="get" action="signup.jsp">
                                    <h2 class="masthead-subheading mb-0">Your Profile</h2>
                                            <br>
                                        <div class="form-group">
                                                <label for="name" class="cols-sm-2 control-label">Your Name</label>
                                                <div class="cols-sm-10">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                                <input type="text" class="form-control profile" name="name" id="name"  placeholder="<%=rs1.getString("user_name")%>" readonly/>
                                                        </div>
                                                </div>
                                        </div>

                                        <div class="form-group">
                                                <label for="email" class="cols-sm-2 control-label">Your Email</label>
                                                <div class="cols-sm-10">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                                                <input type="text" class="form-control profile" name="email" id="email"  placeholder="<%=rs.getString("email")%>" readonly/>
                                                        </div>
                                                </div>
                                        </div>

                                        <div class="form-group">
                                                <label for="username" class="cols-sm-2 control-label">Your Mobile No.</label>
                                                <div class="cols-sm-10">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                                                <input type="text" class="form-control profile" name="mobile_no" id="username"  placeholder="<%=rs1.getString("mobile_no")%>" readonly/>
                                                        </div>
                                                </div>
                                        </div>
                                        <div class="form-group">
                                                <label for="city" class="cols-sm-2 control-label">Your City</label>
                                                <div class="cols-sm-10">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-address-card fa" aria-hidden="true"></i></span>
                                                                <input type="text" class="form-control profile" name="city" id="city"  placeholder="<%=rs1.getString("city")%>" readonly/>
                                                        </div>
                                                </div>
                                        </div>
                                        <div class="form-group">
                                                <label for="cabs_count" class="cols-sm-2 control-label">Total Cabs Added</label>
                                                <div class="cols-sm-10">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-address-card fa" aria-hidden="true"></i></span>
                                                                <input type="text" class="form-control profile" name="cabs_count" id="cabs_count"  placeholder="" readonly/>
                                                        </div>
                                                </div>
                                        </div>

                                        <div class="form-group">
                                                <label for="password" class="cols-sm-2 control-label">Password</label>
                                                <div class="cols-sm-10">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                                <input type="password" class="form-control profile" name="password" id="password"  placeholder="<%=rs.getString("password")%>" readonly/>
                                                        </div>
                                                </div>
                                        </div>

                                        <div class="form-group">
<!--							<label for="submit" class="cols-sm-2 control-label">Submit</label>-->
                                                <div class="cols-sm-10">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                                <input style="background-color:#fb531d" type="button" id="edit" class="form-control " name="edit"  value="edit"/>
                                                        </div>
                                                </div>
                                        </div>
                                </form>
                        </div>
                </div>
        </div>
<%}%>
		 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
     <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
    $(document).ready(function() {
        $("#edit").click(function() {
            $(".profile").removeAttr("readonly");
            $(this).hide();
        });
    });
</script>

	</body>
</html>