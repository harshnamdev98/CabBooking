
<%@page import="Java_Package.My_Queries"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%
if (session.getAttribute("user_id") == null) {
        response.sendRedirect("login.jsp");
 }
    String cab_from=request.getParameter("cab_from");
    String cab_to=request.getParameter("cab_to");
    String date_to=request.getParameter("date_to");
    String date_from=request.getParameter("date_from");
    //out.print("cabfrom"+cab_from+",cabto"+cab_to);
    ResultSet rs = null;
    HashMap<String, String> hm = new HashMap<String, String>();
    hm.put("tablename", "all_cabs");
    hm.put("cab_from",cab_from);
    hm.put("cab_to",cab_to);
 
    rs = My_Queries.select_Query(hm);
        

     int table=0;   
%>
<html>
    <head>
        <style>
            a.disabled1 {
               pointer-events: none;
               background-color: gray;
               cursor: default;
            }
        </style>
    </head> 
    <body>   
    
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
                if (session.getAttribute("cab_id") == null) 
                {
                    session.setAttribute("cab_id",cab_id);
                }
                
                HashMap<String, String> hm1 = new HashMap<String, String>();
                hm1.put("tablename", "cab_status");
                hm1.put("cab_id", cab_id);
                //out.print("cab_id"+cab_id);
                rs1 = My_Queries.select_Query(hm1);
                
                rs1.next();
                int i=rs1.getString("status").equals("0")?0:1;
                
                table=1;
                 out.print(i);
            %>
           
            <tr>
                <td><%=(rs.getString("cab_name")).toUpperCase()%></td>
                <td><%=rs.getString("cab_no").toUpperCase()%></td>
                <td><%=rs.getString("cab_from")%></td>
                <td><%=rs.getString("cab_to")%></td>
                <td><%=rs.getString("driver_name")%></td>
                <td><%=rs.getString("driver_mobile_no")%></td>
                <td id="status"><%=rs1.getString("status").equals("0")?"<mark>Available</mark>":"<kbd>Booked</kbd>"%></td>
                <td class="text-center"><%=rs1.getString("date_to")==null?"-":(rs1.getString("date_to"))%></td>
                <td><a id="book" href="book.jsp?date_from=<%=date_from%>&date_to=<%=date_to%>"  name="book" class="btn btn-block btn-dark btn-outline-dark <%= i==1?"disabled1":""%> " >Book</a></td>
            </tr>
            <%
            
            }
            if(table==0)
            {%>
            <tr>
        <div class="alert alert-warning text-center">
            No   Cab    Found
        </div>  </tr>
            <%}
            %>
        </tbody>
    </table>
               
<!--        <script>
            document.getElementById("status").valueOf().toString()=="0"?document.getElementById("book").disabled=true:"";
        </script>            
       -->
        
            
   </body>
</html> 