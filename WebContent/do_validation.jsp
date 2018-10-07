<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<html>
    <head>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
         <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
  <script src="./assets/js/bootstrap.min.js"></script>
         
    </head>

    <body>
   
        <%
            ResultSet rs=null;  
            String email="",password="",user_type="";
            try
            {
                user_type=request.getParameter("user_type").equalsIgnoreCase("user")?"normal_user":"dealer";
                email=request.getParameter("email");
                password=request.getParameter("password");
                HashMap<String,String> hm=new HashMap<String,String>();
                hm.put("tablename", "all_users");
                hm.put("email", email);
                hm.put("password",password);
                hm.put("user_type", user_type);
                rs=Java_Package.My_Queries.select_Query(hm);
                if(rs.next())
                {
                    session.setAttribute("user_id", rs.getInt("user_id"));
                    session.setAttribute("user_type",user_type);
                    //out.println("true");
                    response.sendRedirect("get_"+user_type+".jsp");
                }
                else
                {
                   session.setAttribute("msg", "Invalid Details");
                   session.setAttribute("status", "0");
                   out.println("false");
                   out.println(user_type);
                 //  response.setContentType(user_type);
                    response.sendRedirect("login.jsp?submit=submit");
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
           %>
          </body>
                </html>
                