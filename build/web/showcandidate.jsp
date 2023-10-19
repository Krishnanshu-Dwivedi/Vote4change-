<%-- 
    Document   : showcandidate.jsp
    Created on : 12 Aug, 2023, 11:32:33 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,evoting.dto.CandidateInfo"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>show candidate</title>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>        
        <link href ="stylesheet/pageheader.css" rel = "stylesheet">
        <link href="stylesheet/backgroundimage.css" rel ="stylesheet">
        <link href = "stylesheet/showcandidate.css" rel = "stylesheet">
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script>
            function addvote(){                
                var id  =$('input[type=radio][name=flat]:checked').attr('value');
                data = {candidateid : id};//candidateid
                //alert("id is" , id);
                $.post("AddVoteControllerServlet" , data , processresponse);
            }
            function processresponse(responseText){
                responseText = responseText.trim();
                if(responseText === "success")
                {
                    swal("Success","You vote is recorded","success").then((value)=>{
                        window.location="votingresponse.jsp";
                    });
                }
                else
                {
                    swal("Failure","Someting went wrong","error").then((value)=>{
                        window.location="votingresponse.jsp";
                    });
                }
            }
        </script>
    </head>
    <body style="color: white;">
        <%
            String userid  = (String)session.getAttribute("userid");
            if(userid == null){
                response.sendRedirect("accessdenied.html");
                return;
            }
            StringBuffer displayBlock = new StringBuffer("");
            displayBlock.append(""
                    + "<div class = 'sticky'>"
                        + "<div class='candidate'> Vote For Change</div><br>"
                        + "<div class ='subcandidate'> whome do you want to vote ?</div>"
                        + "<div class='logout'><a href='login.html'>logout</a></div>"
                    + "</div>"
                    + "<div ><br><br><br><br><br><br>");
            ArrayList<CandidateInfo>candidateList = (ArrayList<CandidateInfo>)request.getAttribute("candidateList");

            for(CandidateInfo c: candidateList)
            {
                displayBlock.append("<input type = 'radio' name='flat'  ' value= '"+c.getCandidateId()+"' onclick='addvote()' >");                
                displayBlock.append("<label for ='"+c.getCandidateId() +" ' ><img src = 'data:image/jpg;base64,"+c.getSymbol()+" ' style='width:300px;height:200px;'/></lable>");
                displayBlock.append("<br><div class='candidateprofile'><p>CandidateId:"+c.getCandidateId()+"<br>");
                displayBlock.append("Candidate Name : "+c.getCandidateName()+"<br>");
                displayBlock.append("Party : "+c.getParty()+"<br> </div>");
            }
            out.println(displayBlock);
        %> 
        
    </body>
</html>
