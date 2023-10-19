<%-- 
    Document   : success.jsp
    Created on : 5 Aug, 2023, 8:14:39 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String userid = (String)session.getAttribute("userid");
    if(userid == null){
        session.invalidate();
        response.sendRedirect("accessdenied.html");
        return;
    }
    out.println("success");
%>