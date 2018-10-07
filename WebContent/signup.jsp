<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Java_Package.My_Queries"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<%
    //out.print("submit" +request.getParameter("submit"));
    String submit=request.getParameter("submit");
    String name=request.getParameter("name");
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String mobile_no=request.getParameter("mobile_no");
    String city=request.getParameter("city");
    String confirm=request.getParameter("confirm");
    int valid=1;
    
    
   if(submit!=null && name!="" && email!="" && password!="" && confirm!="" && mobile_no!="" && city!="" && name!=null && email!=null && password!=null && confirm!=null && mobile_no!=null && city!=null)
    {
        
        String user_type="";
        if(request.getParameter("user_type").toLowerCase().equals("user"))
        {
        user_type="normal_user";
        }
        else
        {
        user_type="dealer";
        }
        HashMap<String,String> hm0=new HashMap<String,String>();
            hm0.put("tablename", "all_users");
            hm0.put("email",email);
            hm0.put("user_type",user_type);
            ResultSet rs0=My_Queries.select_Query(hm0);
            rs0.next();
//        out.println("name"+name);
//        out.println("email"+email);
//        out.println("pass"+password);
//        out.println("mobile"+mobile_no);
//        out.println("city"+city);
//        out.println("user type"+user_type);
            if(rs0.next()==false)
            {
        if(password.equals(confirm))
        {
            HashMap<String,String> hm=new HashMap<String,String>();
            hm.put("tablename", "all_users");
            hm.put("email",email);
            hm.put("user_type",user_type);
            hm.put("password",password);
            int check=My_Queries.insert_Query(hm);
            //out.println(check);
            if(check!=0)
            {
                hm.clear();
                hm.put("tablename","all_users");
                ResultSet rs=My_Queries.select_Query(hm);
                rs.last();
                String user_id=String.valueOf(rs.getInt("user_id"));
                HashMap<String,String> hm1=new HashMap<String,String>();
                hm1.put("tablename", user_type);
                hm1.put("user_id",user_id);
                hm1.put("user_name",name);
                hm1.put("mobile_no",mobile_no);
                hm1.put("city",city);
                //My_Queries.reset_fk("0");
                int checksub=My_Queries.insert_Query(hm1);
                //out.println(checksub);
                //My_Queries.reset_fk("1");
                if(checksub!=0)
                {
                    session.setAttribute("msg", "Registered Successfully");
                    session.setAttribute("status", "1");
                    
                }
            }
            else
            {
                session.setAttribute("msg", "Registration Failed");
                session.setAttribute("status", "0");
            }
        }
        
            
        else 
        {
            session.setAttribute("msg", "Password Do Not Matched");
            session.setAttribute("status", "0");
        }
    }
    else{
            session.setAttribute("msg", "User Already Exist");
            session.setAttribute("status", "0");
            valid=0;
    }
    }
   
   else
   {
        session.setAttribute("msg", "Please Enter The Form");
        session.setAttribute("status", "0");
        valid=0;
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
              <a class="nav-link" href="index.html">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="signup.jsp">Sign Up</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="login.jsp">Log In</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
		<div class="container text-white">
			<div class="row main ">
				<div class="main-login main-center masthead  text-white ">
				
					<form class="Register" method="get" action="signup.jsp">
                                            <h2 class="masthead-subheading mb-0">Sign Up Here</h2>
                                            <br>
                                            <%
                                            if(submit!=null && valid!=0)
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
                                              valid=0;
                                            }
                                            %>
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">Your Name</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="name" id="name"  placeholder="Enter your Name"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">Your Email</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									<input type="email" class="form-control" name="email" id="email"  placeholder="Enter your Email"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="username" class="cols-sm-2 control-label">Your Mobile No.</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="mobile_no" id="username"  placeholder="Enter your Mobile No."/>
								</div>
							</div>
						</div>
                                                <div class="form-group">
							<label for="city" class="cols-sm-2 control-label">Enter Your City</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-address-card fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="city" id="city"  placeholder="Enter your City"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Confirm your Password"/>
								</div>
							</div>
						</div>
                                            <div class="form-group">
                                                <label for="user_type" class="cols-sm-2 control-label">Select User Type</label>
                                                <div class="cols-sm-10">
                                                    <div class="input-group">
                                                        <select class="form-control" name="user_type" id="user_type">
                                                            <option  name="normal_user">User</option>
                                                            <option name="dealer">Dealer</option>
                                                        </select>
                                                    </div>
                                              </div>
                                            </div>
                                                <div class="form-group">
<!--							<label for="submit" class="cols-sm-2 control-label">Submit</label>-->
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input style="background-color:#fb531d" type="submit" class="form-control btn login-button " name="submit"  value="Submit"/>
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