<%-- 
    Document   : adminactions.jsp
    Created on : 30 Jul, 2023, 4:54:36 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
         <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="stylesheet/backgroundimage.css" rel ="stylesheet">
        <link href ="stylesheet/pageheader.css" rel = "stylesheet">
        <link href = "stylesheet/admin.css" rel = "stylesheet">
        <link href = "stylesheet/result.css" rel = "stylesheet">
        <script>
               function manageuser()
            {
                swal("Admin","Redirection to User Management Page!","success").then((value)=>{
                    window.location = "manageuser.jsp";
                });
            }
            function managecandidate()
            {
                swal("Admin!" , "Redirectiong to Candidate Mangement page!","success").then(value=>{
                   window.location="managecandidate.jsp"; 
                });
            }
            function electionresult(){
                $.post("ElectionResultControllerServlet",null, function(responseText){
                    swal("Results fetched !!" ,"Success","success");
                    $("#result").html(responseText.trim());
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
                             "<div class = 'logout'><a href='login.html'>logout</a></div>"+
                     "</div>"+
                    "<div class='container'>"+
                        "<div id = 'dv1' onclick='manageuser()'><img src ='images/muser.png' height='300px' width='300px'/><br><h3>Manage user</h3></div>"+
                        "<div id ='dv2' onclick = 'managecandidate()'><img src = 'images/ManageCandLists.jpg' height='300px' width='300px'/><br/><h3>Manage Candidate</h3></div>"+
                        "<div id = 'dv3' onclick='electionresult()'><img src='images/resultgraph.jpg' height='300px' width='300px'/><br/><h3>Show Result</h3></div></div><br/><br/>"
                    + "<div align='center' id='result' style='margin-bottom:60px; color:white'></div>");
            out.println(displayBlock);
        %>
    </body>
</html>
