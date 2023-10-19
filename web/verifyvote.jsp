<%-- 
    Document   : verifyvote
    Created on : 13 Aug, 2023, 3:57:01 PM
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
    boolean result = (boolean)request.getAttribute("result");
    if(result == true){
        out.println("success");
    }else{
        out.println("failed");
    }
%>
