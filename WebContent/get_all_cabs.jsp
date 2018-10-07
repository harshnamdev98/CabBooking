
<%@page import="Java_Package.My_Queries"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%

    if (session.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");

    }

    ResultSet rs = null;
    
    
        HashMap<String, String> hm = new HashMap<String, String>();
        hm.put("tablename", "all_cabs");
      //  hm.put("user_id", String.valueOf(session.getAttribute("user_id")));
        rs = My_Queries.select_Query(hm);
        
//        String user_id=rs.getString("user_id");
//        String user_type=rs.getString("user_type");
        
     
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
                <style>
                a.disabled1 {
                pointer-events: none;
                background-color: gray;
                cursor: default;
                 }
        </style>
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
              <a class="nav-link" href="get_normal_user.jsp">Profile</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="search_cab.jsp">Search Cab</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="get_all_cabs.jsp">All Cabs</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="">My Bookings</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="logout_user">Log Out</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
        <div class="container text-white">
                <div class="row main ">
                    <h2 class="masthead-subheading mb-0">All Cabs</h2>
                    <br>
<!--                        <div class="main-login main-center masthead  text-white ">-->
                            <table class="table table-hover table-light table-responsive-lg ">
                                <thead class="table-active">
                                    <tr>
                                        <td>Cab Name</td>
                                    
                                        <td>Cab No</td>
                                    
                                        <td>Cab Available From</td>
                                    
                                        <td>Cab Available To</td>
                                    
                                        <td>Cab Driver Name</td>
                                  
                                        <td>Cab Driver Mobile No.</td>
                                   
                                        <td>Cab Status</td>
                                  
                                        <td>Booked Till</td>
                                        <td>Book Now</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%while(rs.next())
                                    {
                                        ResultSet rs1 = null;
                                        String cab_id=rs.getString("cab_id");
                                        HashMap<String, String> hm1 = new HashMap<String, String>();
                                        hm1.put("tablename", "cab_status");
                                        hm1.put("cab_id", cab_id);
                                        //out.print("cab_id"+cab_id);
                                        rs1 = My_Queries.select_Query(hm1);
                                        
                                        rs1.next();
                                        int i=rs1.getString("status").equals("0")?0:1;
                                        session.setAttribute("cab_id",cab_id);
                                       // session.setAttribute("", value);
                                    %>
                                    <tr>
                                        <td><%=(rs.getString("cab_name")).toUpperCase()%></td>
                                        <td><%=rs.getString("cab_no").toUpperCase()%></td>
                                        <td><%=rs.getString("cab_from")%></td>
                                        <td><%=rs.getString("cab_to")%></td>
                                        <td><%=rs.getString("driver_name")%></td>
                                        <td><%=rs.getString("driver_mobile_no")%></td>
                                        <td><%=rs1.getString("status").equals("0")?"<mark>Available</mark>":"<kbd>Booked</kbd>"%></td>
                                        <td class="text-center"><%=rs1.getString("date_to")==null?"-":(rs1.getString("date_to"))%></td>
<!--                                <input type="hidden" name="cab_from" value="<%=rs.getString("cab_from")%>" />
                                <input type="hidden" name="cab_to" value="<%=rs.getString("cab_to")%>" />-->
                                        <td><a id="book" href="search_cab.jsp?&cab_id=<%=cab_id%>"  name="book" class="btn btn-block btn-dark btn-outline-dark <%= i==1?"disabled1":""%> " onclick="this.disabled=true" >Book</a></td>
                                    </tr>
                                    <%
                                    }
                                    %>
                                </tbody>
                            </table>

                </div>
        </div>

		 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
     <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
        function call_book(){
            
        }
        $(document).ready(function() {
        $("#book").click(function() {
            $(".book_btn").add("disabled");
//            $(this).hide();
        });
    });
    </script>

	</body>
</html>