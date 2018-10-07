<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<%
    HashMap<String,String> hm=new HashMap<String,String>();
    hm.put("tablename","cab_status");
    Date d=new Date();
    
    ResultSet rs=Java_Package.My_Queries.select_Query(hm);
    while(rs.next())
    {
        if(rs.getString("date_to").equals(""))
        {
            
        }
    }
    hm.put("date_to", "");
    
            

%>