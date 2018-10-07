<%-- 
    Document   : add_cab
    Created on : 07-Apr-2018, 18:14:58
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int check=0,check1=0,check2=0,check3=0,suc=0;  
    ResultSet rs=null;
    String user_type="dealer" ,cab_name="",cab_no="",cab_from="",cab_to="",driver_name="",driver_mobile_no="" ,cab_id="";
   String user_id=session.getAttribute("user_id").toString(),to_id="",from_place="";
    try
    {
        //user_type=request.getParameter("user_type").equalsIgnoreCase("user")?"normal_user":"dealer";
        cab_name=request.getParameter("cab_name");
        cab_no=request.getParameter("cab_no");
        cab_from=request.getParameter("cab_from");
        cab_to=request.getParameter("cab_to");
        driver_name=request.getParameter("driver_name");
        driver_mobile_no=request.getParameter("driver_mobile_no");
//        out.println(cab_name);
//        out.println(cab_no);
//        out.println(cab_from);
//        out.println(cab_to);
//        out.println(driver_name);
//        out.println(driver_mobile_no);
        HashMap<String,String> hm=new HashMap<String,String>();
        hm.put("tablename", "all_cabs");
        hm.put("user_id", user_id);
        hm.put("cab_name", cab_name);
        hm.put("cab_no", cab_no);
        hm.put("cab_from", cab_from);
        hm.put("cab_to",cab_to);
        hm.put("driver_name", driver_name);
        hm.put("driver_mobile_no", driver_mobile_no);
        Java_Package.My_Queries.transit_Query();
        check=Java_Package.My_Queries.insert_Query(hm);
//        out.println(check);
//        check=1;
        if(check!=0)
        {
            hm.clear();
            hm.put("tablename", "all_cabs");
            hm.put("user_id", user_id);
            rs=Java_Package.My_Queries.select_Query(hm);
            rs.last();   
            cab_id=String.valueOf(rs.getInt("cab_id"));
            out.print("cab_id:"+cab_id);
            HashMap<String,String> hm1=new HashMap<String,String>();
            hm1.put("tablename", "cab_status");
            hm1.put("cab_id", cab_id);
            hm1.put("user_id", user_id);
            hm1.put("status", "0");
            check1=Java_Package.My_Queries.insert_Query(hm1);
//            out.print(check1);
//            check1=1;
//            cab_id="1";
            if(check1!=0)
            {
                HashMap<String,String> hm2=new HashMap<String,String>();
                hm2.put("tablename", "cab_status");
                hm2.put("cab_id", cab_id);
                hm2.put("user_id", user_id);
                hm2.put("status", "0");
                check2=Java_Package.My_Queries.insert_Query(hm2);
//                out.println("hm2"+check2);
//                check2=1;
                if(check2!=0)
                {
                    HashMap<String,String> hm3=new HashMap<String,String>();
                    hm3.put("tablename", "to_place");
                    hm3.put("cab_id", cab_id);
                    hm3.put("user_id", user_id);
                    hm3.put("place", cab_to);
                    check2=Java_Package.My_Queries.insert_Query(hm3);
                    //out.println("hm3"+check2);
                    hm3.clear();
                    hm3.put("tablename", "to_place");
                    hm3.put("user_id", user_id);
                    rs=Java_Package.My_Queries.select_Query(hm3);
                    rs.last();   
                    to_id=String.valueOf(rs.getInt("to_id"));
                    //out.print("toi"+to_id);
                    if(check2!=0)
                    {
                        HashMap<String,String> hm4=new HashMap<String,String>();
                        hm4.put("tablename", "from_place");
                        hm4.put("to_id", to_id);
                        hm4.put("cab_id", cab_id);
                        hm4.put("user_id", user_id);
                        hm4.put("place",cab_from);    
                        check3=Java_Package.My_Queries.insert_Query(hm4);
                        Java_Package.My_Queries.commit();
                        session.setAttribute("msg", "Cab Added Successfully");
                        session.setAttribute("status", "1");
                    session.setAttribute("done","done");
                    //out.println("true");
                    //response.sendRedirect("do_dealer_add_cabs.jsp");
                    response.sendRedirect("do_dealer_add_cab_image.jsp");
                    }
                    else
                    {
                        Java_Package.My_Queries.roollback();
                        Java_Package.My_Queries.commit();
                    }
                   
                }
                else
                {
                    Java_Package.My_Queries.roollback();
                    Java_Package.My_Queries.commit();
                }
            }
            else
            {
                Java_Package.My_Queries.roollback();
                Java_Package.My_Queries.commit();
            }
            
        }
        else if(check!=0 && check1!=0 && check2!=0 && check3!=0)
        {
            Java_Package.My_Queries.roollback();
            Java_Package.My_Queries.commit();
           session.setAttribute("msg", "Invalid Details");
           session.setAttribute("status", "0");
          // out.println("false");
          // out.println(user_type);
         //  response.setContentType(user_type);
            response.sendRedirect("do_dealer_add_cabs.jsp");
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }

%>