<%-- 
    Document   : managecandidate
    Created on : 1 Aug, 2023, 11:52:36 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
         <link href = "stylesheet/admin.css" rel = "stylesheet">
        
        <link href="stylesheet/backgroundimage.css" rel ="stylesheet">
        <link href ="stylesheet/pageheader.css" rel = "stylesheet">
       
          <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
          <script>
                    function showaddcandidateform()
                   {
                       removecandidateForm();
                       var newdiv = document.createElement("div");
                       newdiv.setAttribute("id", "candidateform");
                       newdiv.setAttribute("float", "left");
                       newdiv.setAttribute("padding-left", "12px");
                       newdiv.setAttribute("border","solid 2px red");
                       newdiv.innerHTML = "<h3> Add New Candidate</h3>";
                       newdiv.innerHTML = newdiv.innerHTML+
                       "<form method='POST' enctype='multipart/form-data' id = 'fileUploadForm' >\n\
                                <table cellspacing='10px'>\n\
                                    <tr><th>Candidate id:</th><td><input type ='text' id ='cid'> </td></tr>\n\
                                    <tr><th>User Id:</th><td><input type='text' id ='uid' onkeypress='return getdetails(event)'></td></tr>\n\
                                    <tr><th>Candidate name:</th><td> <input type='text' id='cname'></td></tr>\n\
                                    <tr><th>City:</th><td> <select id='city'> </select></td></tr>\n\
                                    <tr><th>Party:</th><td> <input type='text' id='party'></td></tr>\n\
                                    <tr><td colspan='10'> <input type='file' name='files' value ='select image'></td></tr>\n\
                                    <tr><th> <input type='button' value ='Add Candidate' onclick='addcandidate()' id ='addcnd'></th>\n\<th>\n\
                                     <input type='reset' value ='clear' onclick='clearText()' ></th>\n\</tr>\n\
                             </table>\n\
                        </form>";
                        newdiv.innerHTML = newdiv.innerHTML+"<br> <span id = 'addresp'></spna>";
                       
                            var addcand = $("#result")[0];
                            addcand.appendChild(newdiv);
                            $("#candidateform").hide();
                            $("#candidateform").fadeIn(3500);
                            data = {id:"getid"};
                            $.post("AddCandidateControllerServlet",data,function(responseText){
                                $("#cid").val(responseText);
                                $("#cid").prop("disabled",true);
                            });
                   } 
                   
                   function showupdatecandidateform(){
                       removecandidateForm();
                       var newdiv = document.createElement("div");
                       newdiv.setAttribute("id", "candidateform");
                       newdiv.setAttribute("float", "left");
                       newdiv.setAttribute("padding-left", "12px");
                       newdiv.setAttribute("border","solid 2px red");
                       newdiv.innerHTML = "<h3> Update Candidate</h3>";
                       newdiv.innerHTML = newdiv.innerHTML+
                       "<form method='POST' enctype='multipart/form-data' id = 'fileUploadForm' >\n\
                                <table cellspacing='10px'>\n\
                                    <tr><th>Candidate id:</th><td><select id = 'cid'></select></td></tr>\n\
                                    <tr><th>User Id:</th><td><input type='text' id ='uid'></td></tr>\n\
                                    <tr><th>Candidate name:</th><td> <input type='text' id='cname'></td></tr>\n\
                                    <tr><th>City:</th><td> <input type='text' id='city'></td></tr>\n\
                                    <tr><th>Party:</th><td> <input type='text' id='party'></td></tr>\n\
                                  \n\<th>\n\
                             </table>\n\
\n\                         <input type='button' value ='Update Candidate' onclick='updatecandidate()' id ='addcnd'>\n\
                        </form>";
                        newdiv.innerHTML = newdiv.innerHTML+"<br> <span id = 'addresp'></spna>";
                       
                            var addcand = $("#result")[0];
                            addcand.appendChild(newdiv);
                            $("#candidateform").hide();
                            $("#candidateform").fadeIn(3500);
                            data = { data :"cid"};
                            $.post("ShowCandidateControllerServlet",data,function(responseText){
                                var candidatelist = JSON.parse(responseText);
                                $("#cid").append(candidatelist.cid);
                            });
                            
                             $("#cid").change( function(){
                                var cid = $("#cid").val();
                                if(cid === ''){
                                    swal("No Selection" , "Please select a id" ,"error");
                                    return;
                                }
                                info = { data : cid};
                               $.post("UpdateCandidateControllerServlet", info, function(responseText){
                                    let details = JSON.parse(responseText);
                                    $("#uid").val(details.userid);
                                    $("#uid").prop("disabled" , true);
                                    $("#cname").val(details.name);
                                    $("#party").val(details.party);
                                    $("#city").val(details.city);                                    
                               
                                });      
                            });
                   }
                   
                   function updatecandidate(){
                       var cid = $("#cid").val();
                       var cname = $("#cname").val();
                       var city = $("#city").val();
                       var party = $("#party").val();    
                       var uid = $("#uid").val();
                       
                       $.post("CandidateUpdateControllerServlet", {
                           id : cid,
                           name : cname,
                           city : city,
                           party : party,
                           uid : uid
                       }, function(responseText){
                                  responseText = responseText.trim();
                                  console.log(responseText);
                                  if(responseText === "true")
                                       swal("Success","Candidate Updated","success");
                                  else
                                      swal("Failure","Someting went wrong","error");
                        });      
                   }
                   
                   function clearText(){
                       $("#addresp").html("");
                   }
                   
                   function getdetails(e)
                   {
                       if(e.keyCode === 13)
                       {
                           data = { uid : $("#uid").val() };
                            $.post("AddCandidateControllerServlet" , data , function(responseText)
                            {
                                let details = JSON.parse(responseText);
                                let city = details.city;
                                let uname = details.username;
                                if(uname == "wrong")
                                {
                                    swal("Wrong Adhar Number! ", "Adhar no. is invalid!!" , "error");
                                }else
                                {
                                    $("#cname").val(uname);
                                    $("#city").empty();
                                    $("#city").append(city);
                                    $("#cname").prop("disabled" , true);
                                }
                            });
                       }
                   }
                   
                   function addcandidate()
                   {
                       var form = $("#fileUploadForm")[0];
                       var data = new FormData(form);
                       var cid = $("#cid").val();
                       var cname = $("#cname").val();
                       var city = $("#city").val();
                       var party = $("#party").val();
                       var uid = $("#uid").val();                       
                       data.append("cid" , cid);
                       data.append("uid" , uid);
                       data.append("cname" , cname);
                       data.append("party" , party);
                       data.append("city" , city);
          

                        $.ajax(
                                {
                                    type : "POST",
                                    enctype :'multipart/form-data',
                                    url : "AddNewCandidateControllerServlet",
                                    data : data,
                                    processData : false,
                                    contentType : false,
                                    cache : false,
                                    timeout : 600000 , 
                                    success : function (data)
                                    {
                                        str = data +"......";
                                        swal("Admin", str , "success").then( (value) => {
                                            showaddcandidateform();
                                        });
                                    },
                                    error : function(e){
                                        swal("Admin" , e, "error");
                                    }
                                }
                                );
                   }
                   function removecandidateForm(){
                       var contdiv = document.getElementById("result");
                       var formdiv =document.getElementById("candidateform");
                       if(formdiv !== null){
                           $("#candidateform").fadeOut("3500");
                           contdiv.removeChild(formdiv);
                       }
                   }
                   
                   function showcandidate()
                   {
                       removecandidateForm();
                       var newdiv = document.createElement("div");
                       newdiv.setAttribute("id", "candidateform");
                       newdiv.setAttribute("float", "left");
                       newdiv.setAttribute("padding-left", "12px");
                       newdiv.setAttribute("border","solid 2px red");
                       newdiv.innerHTML = "<h3> Show Candidate</h3>";
                       newdiv.innerHTML = newdiv.innerHTML+
                       "<div style'color:white; font-weight:bold'>Candidate Id:</div>"+
                       "<div><select id = 'cid'></select></div>"; // here could be something
                       
                        newdiv.innerHTML = newdiv.innerHTML+"<br> <span id = 'addresp'></spna>";
                       
                       var addcand = $("#result")[0];
                       addcand.appendChild(newdiv);
                       $("#candidateform").hide();
                       $("#candidateform").fadeIn(3500);
                       data = { data :"cid"};
                       $.post("ShowCandidateControllerServlet",data,function(responseText){
                           var candidatelist = JSON.parse(responseText);
                           $("#cid").append(candidatelist.cid);
                       });
                       
                       $("#cid").change( function(){
                           var cid = $("#cid").val();
                           if(cid === ''){
                               swal("No Selection" , "Please select a id" ,"error");
                               return;
                           }
                           data = { data : cid };
                           $.post("ShowCandidateControllerServlet", data, function(responseText){
                                clearText();
                                var details = JSON.parse(responseText);
                                $("#addresp").append(details.subdetails);
                                });
                       });
                   }
                   function deletecandidate(){
                       removecandidateForm();
                       var newdiv = document.createElement("div");
                       newdiv.setAttribute("id", "candidateform");
                       newdiv.setAttribute("float", "left");
                       newdiv.setAttribute("padding-left", "12px");
                       newdiv.setAttribute("border","solid 2px red");
                       newdiv.innerHTML = "<h3> Choose a Candidate Id to remove</h3>";
                       newdiv.innerHTML = newdiv.innerHTML+
                       "<div style ='color:white; font-weight:bold'>Candidate Id:</div>"+
                       "<div><select id = 'cid'></select></div>"; // here could be something
                       
                        newdiv.innerHTML = newdiv.innerHTML+"<br> <span id = 'addresp'></span>";
                       
                       var addcand = $("#result")[0];
                       addcand.appendChild(newdiv);
                       $("#candidateform").hide();
                       $("#candidateform").fadeIn(3500);
                       data = { data :"cid"};
                       $.post("ShowCandidateControllerServlet",data,function(responseText){
                           var candidatelist = JSON.parse(responseText);
                           $("#cid").append(candidatelist.cid);
                       });
                       
                       $("#cid").change( function(){
                           var cid = $("#cid").val();
                           if(cid === ''){
                               swal("No Selection" , "Please select a id" ,"error");
                               return;
                           }
                           swal({
                                title: "Are you sure?",
                                text: "Do you want to remove candidate with id " + cid+" !",
                                type: "warning",
                                icon: "warning",
                                buttons: true,
                                dangerMode: true
                                }).then((willDelete) => {
                                    if (willDelete){
                                        var data = { data : cid };
                                        $.post("RemoveCandidateControllerServlet", data, function(responseText){
                                             responseText = responseText.trim();
                                             if(responseText == "success")
                                                 swal("Success","Candidate removed","success");
                                             else
                                                 swal("Failure","Someting went wrong","error");
                                           });
                                    }
                                });
                       });
                       
                   }
                   
          </script>
          <style>
              .container {
                text-align:center;
                padding-top: 12%;
              }
              #dv1, #dv2, #dv3, #dv4 {
                display:inline-block;
                width:20%;
                margin: 0px 40px;
                margin-right: 40px;
              }
              h1, h2, h3, h4, h5, h6{
                  color: white;
              }
              th, tr, td{
                  color: white;
              }
              th{
                  text-align: right;
              }
          </style>
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
                 "<div class='candidate'>Vote For Change</div><br>"+
                 "<div class ='subcandidate'>Admin Actions Page</div><br><br>"+
                 "<div class='logout'><a href ='login.html'>logout</a></div>"+
             "</div>"+    

             "<div class='container'>"+
                "<div id='dv1' onclick='showaddcandidateform()'>"+
                "<img src='images/addcandidate.png' height='300px' width='300px'><br>"+
                "<h3>ADD Candidate</h3>"+
                "</div>"+

                "<div id='dv2' onclick='showupdatecandidateform()'>"+
                    "<img src='images/update1.jpg' height='300px' width='300px'/><br>"+
                    "<h3>Update Candidate</h3>"+
                "</div>"+

                "<div id='dv3' onclick='showcandidate()'>"+
                    "<img src='images/candidate.jpg' height='300px' width='300px'><br>"+
                    "<h3>Show Candidate</h3>"+
                "</div>"+

                "<div id='dv4' onclick='deletecandidate()'>"+
                        "<img src='images/update3.jpg' height='300px' width='300px'><br>"+
                        "<h3>Remove Candidate</h3>"+
                "</div>"+  
                    
                 "<div id = 'result' align='center'></div>"   +

            "</div>");
            out.println(displayBlock);
  
         %>       
        
        
        
    
    </body>
</html>
