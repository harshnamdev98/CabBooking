<%@page import="Java_Package.My_Queries"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%
    
//    out.println(session.getAttribute("id"));
    if (session.getAttribute("user_id") == null) 
    {
        response.sendRedirect("login.jsp");

    }
    //out.print(request.getParameter("cab_id"));
    String cab_id=request.getParameter("cab_id");
    
    //out.print(cab_id);
    ResultSet rs = null;
    
    String cab_from="";
    String cab_to="";
    if(cab_id!=null)
    {
        session.setAttribute("cab_id", cab_id);
        HashMap<String, String> hm = new HashMap<String, String>();
        hm.put("tablename", "all_cabs");
        hm.put("cab_id",cab_id);
        rs = My_Queries.select_Query(hm);   
        rs.next();
        cab_from=rs.getString("cab_from");
        cab_to=rs.getString("cab_to");
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
		<title>Sign Up</title>
                <link rel="shortcut icon" href="img/01.jpg" />
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
              <a class="nav-link active" href="search_cab.jsp">Search Cab</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="get_all_cabs.jsp">All Cabs</a>
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
                    
                    <br>
                        <div class="main-login main-center masthead  text-white ">
                                   
                                <form class="Register" method="get" action="">
                                    <h2 class="masthead-subheading mb-0">Search For A Cab Here</h2>
                                            <br>    
                                        <div class="form-group">
                                                <label for="cab_from" class="cols-sm-2 control-label">From Place</label>
                                                <div class="cols-sm-10">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                                <input type="text" class="form-control profile" name="cab_from" id="cab_from"   placeholder="<%=(cab_from=="")?"Enter Pick Up Place":cab_from%>" value="<%=cab_from%>" />
                                                        </div>
                                                </div>
                                        </div>

                                        <div class="form-group">
                                                <label for="cab_to" class="cols-sm-2 control-label">To Place</label>
                                                <div class="cols-sm-10">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                                                <input type="text" class="form-control profile" name="cab_to" id="cab_to"   placeholder="<%=(cab_to=="")?"Enter Drop Place":cab_to%>" value="<%=cab_to%>" />
                                                        </div>
                                                </div>
                                        </div>
                                        <div class="form-group">
                                                <label for="date_from" class="cols-sm-2 control-label">From Date</label>
                                                <div class="cols-sm-10">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                                <input type="date" class="form-control profile" name="date_from" id="date_from"  placeholder=""/>
                                                        </div>
                                                </div>
                                        </div>
                                        <div class="form-group">
                                                <label for="name" class="cols-sm-2 control-label">To Date</label>
                                                <div class="cols-sm-10">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                                                <input type="date" class="form-control profile" name="date_to" id="date_to"  placeholder=""/>
                                                        </div>
                                                </div>
                                        </div>

                                        <div class="form-group">
                                                <div class="cols-sm-10">
                                                        <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                                                <input style="background-color:#fb531d" onclick="scrollWin()" type="button" id="book" class="form-control btn btn-block" name="submit"  value="Show All"/>
                                                        </div>
                                                </div>
                                        </div>
                                </form>
                        </div>
                </div>
        </div>
                                                        <div class="container col-sm-12 col-lg-12 " id="cab_search_data">

                                                        </div>
		
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
     <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <script>
    $(document).ready(function(){
        
        $("#book").click(function(){
            
        var cab_from=$("#cab_from").val();
        var cab_to=$("#cab_to").val();
        var cab_id=$("#cab_id").val();
        var date_from=$("#date_from").val();
        var date_to=$("#date_to").val();
           // alert(date_from+","+date_to);
        $.ajax({
           url:"cab_search_data.jsp",
           type:"post",
           data:{cab_from:cab_from,cab_to:cab_to,cab_id:cab_id,date_from:date_from,date_to:date_to},//,date_from:date_from,date_to:date_to
           dataType:"text",
           success:function(data){
               $("#cab_search_data").html(data);
               //alert(data);
           },
           error:function(data){
               alert("error generated");
           }
           
        });
       
          });
       
        
    });
    function scrollWin() {
    window.scrollTo(0,500);
}
//    window.setInterval(function() {
//  var elem = document.getElementById('cab_search_data');
//  elem.scrollHeight = elem.scrollHeight;
//}, 5000);

</script>

	</body>
</html>