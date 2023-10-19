<%-- 
    Document   : adminoptions.jsp
    Created on : 30 Jul, 2023, 3:49:53 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<!--        <script scr="jsScript/adminoptions.js"></script>-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link href="stylesheet/backgroundimage.css" rel ="stylesheet">
        <link href ="stylesheet/pageheader.css" rel = "stylesheet">
        <link href = "stylesheet/admin.css" rel = "stylesheet">
        <script>
            function redirectadministratorpage()
            { 
                swal("Admin","Redirection to Admin Action Page!","success").then((value)=>{
                    window.location = "adminactions.jsp";
                });
            }
            function redirectvotingpage()
            {
                swal("Admin!" , "Redirectiong to Voting  page!","success").then(value=>{
                   window.location="VotingControllerServlet"; 
                });
            }
            
         
        </script>

    </head>
    <body>
        <%
            String userid  = (String)session.getAttribute("userid");
            if(userid == null){
                response.sendRedirect("accessdenied.html");
                return;
            }
             StringBuffer displayBlock = new StringBuffer(""+
                    "<div class='sticky'>"+
                        "<div class='candidate'> Vote for change </div><br/>"+
                        "<div class='subcandidate'>Admin Actions Page</div><br><br>"+
                        "<div class = 'logout'><a href='login.html'>logout></a></div>"+
                     "</div>"+
                    "<div class='container'>"+
                            "<div id = 'dv1' onclick='redirectadministratorpage()'>"+
                                 "<img src = 'images/administrator.png' height='300px' width='300px'/><br>"+
                                "<h3>Admin Options</h3>"+
                              "</div>"+
                            "<div id ='dv2' onclick = 'redirectvotingpage()'>"+
                                    "<img src = 'images/voteadmin.jpg' height='300px' width='300px'/><br/>"+
                                    "<h3>Voting Page</h3>"+
                             "</div>"+
                      "</div><br/><br/>"+
                     "<div align='center' id='result'></div>");
            out.println(displayBlock);
        %>
    </body>
</html>

