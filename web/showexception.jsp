<%-- 
    Document   : showexception
    Created on : 27 Jul, 2023, 8:10:40 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Exception ex = (Exception)request.getAttribute("Exception");
    System.out.println("Exception is "+ex.getMessage());
    out.println("Some exception Occured: "+ex.getMessage());
%>