<%-- 
    Document   : book
    Created on : 10-Apr-2018, 17:10:04
    Author     : HP
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("user_id") == null) 
    {
        response.sendRedirect("login.jsp");
    }

    String user_id=session.getAttribute("user_id").toString();
    String cab_id=session.getAttribute("cab_id").toString();
    session.removeAttribute("cab_id");
    String cab_from=request.getParameter("cab_from"),cab_to=request.getParameter("cab_to"),date_from=request.getParameter("date_from"),date_to=request.getParameter("date_to");
    ResultSet rs=null;
    int check=0;
//    out.print(user_id);
//    out.print(cab_id);
//    out.print(date_from);
//    out.print(date_to);
    
    HashMap<String,String> hm=new HashMap<String,String>();
    hm.put("tablename","cab_status");
    hm.put("user_id", user_id);
    hm.put("id", cab_id);  //**name id is given this is special case for more see update query 
    hm.put("id_name","cab_id");   //**special attribute see update query for more details
    hm.put("status", "1");
    hm.put("date_from", date_from);
    hm.put("date_to", date_to);
    check=Java_Package.My_Queries.update_Query(hm);
    if(check!=0)
    {
        session.setAttribute("status","1");
        session.setAttribute("msg", "Cab Booked Successfully");
        response.sendRedirect("SendMail");
        //out.print("booking success");
        
    }
    else
    {
        session.setAttribute("status","0");
        session.setAttribute("msg", "Cab Not Booked");
        response.sendRedirect("SendMail");
        //out.print("booking fail");
    }
    
    
%>