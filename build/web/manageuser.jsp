<%-- 
    Document   : manageuser
    Created on : 24 Sep, 2023, 6:16:57 PM
    Author     : HP
--%>

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
            function removeuser()
            {
                       removeuserForm();
                       var newdiv = document.createElement("div");
                       newdiv.setAttribute("id", "userform");
                       newdiv.setAttribute("float", "left");
                       newdiv.setAttribute("padding-left", "12px");
                       newdiv.setAttribute("border","solid 2px red");
                       newdiv.innerHTML = "<h3> Choose a User Id to remove</h3>";
                       newdiv.innerHTML = newdiv.innerHTML+
                       "<div style='color:white; font-weight:bold'>User Id:</div>"+
                       "<div><select id = 'uid'></select></div>"; // here could be something
                       
                        newdiv.innerHTML = newdiv.innerHTML+"<br> <span id = 'addresp'></span>";
                       
                       var addcand = $("#result")[0];
                       addcand.appendChild(newdiv);
                       $("#userform").hide();
                       $("#userform").fadeIn(3500);
                       var data = { data :"uid"};
                       $.post("ShowUserControllerServlet", data ,function(responseText){
                           console.log(responseText);
                           try {
                            var userlist = JSON.parse(responseText);
                            console.log(userlist);
                           $("#uid").append(userlist.uid);
                          } catch (e) {
                            console.error("Error parsing JSON: " + e);
                          }
                           
                       });
                                               
                       $("#uid").change( function(){
                           var uid = $("#uid").val();
                           if(uid === ''){
                               swal("No Selection" , "Please select a id" ,"error");
                               return;
                           }
                           swal({
                                title: "Are you sure?",
                                text: "Do you want to remove candidate with id " + uid+" !",
                                type: "warning",
                                icon: "warning",
                                buttons: true,
                                dangerMode: true
                                }).then((willDelete) => {
                                    if (willDelete){
                                        var data = { data : uid };
                                        $.post("RemoveUserControllerServlet", data, function(responseText){
                                             responseText = responseText.trim();
                                             if(responseText == "success")
                                             {
                                                  swal("Success","Candidate removed","success");
                                                  addcand.innerHTML="";
                                             }
                                             else
                                                 swal("Failure","Someting went wrong","error");
                                           });
                                    }
                                });
                       });
                       
                   }
            function showuser(){
                data = { data :"user_list"};
                $.post("ShowUserControllerServlet" , data, function(responseText){
                   swal("List fetched !!" ,"Success","success");
                    $("#result").html(responseText.trim());
                });
            }
                 function removeuserForm(){
                       var contdiv = document.getElementById("result");
                       $("#result")[0].innerHTML = "";
                       var formdiv =document.getElementById("userform");
                       if(formdiv !== null){
                           $("#userform").fadeOut("3500");
                           contdiv.removeChild(formdiv);
                       }
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
                        "<div id = 'dv1' onclick='showuser()'><img src ='images/show.png' height='300px' width='300px'/><br><h3>Show users</h3></div>"+
                        "<div id ='dv2' onclick = 'removeuser()'><img src = 'images/delete.jpg' height='300px' width='300px'/><br/><h3>Remove users</h3></div>"+
                       "<br/><br/>"
                    + "<div align='center' id='result' style='margin-bottom:60px;'></div>");
            out.println(displayBlock);
        %>
    </body>
</html>

