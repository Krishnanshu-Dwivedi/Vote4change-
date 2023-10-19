<%-- 
    Document   : votingresponse
    Created on : 13 Aug, 2023, 3:59:23 PM
    Author     : HP
--%>

<%@page import="evoting.dto.CandidateInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
         <link href = "stylesheet/admin.css" rel = "stylesheet">
         <link href = "stylesheet/showcandidate.css" rel = "stylesheet">
        <link href ="stylesheet/pageheader.css" rel = "stylesheet">
        <link href="stylesheet/backgroundimage.css" rel ="stylesheet">
       
          <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <%
            String userid = (String)session.getAttribute("userid");
            if(userid == null){
                session.invalidate();
                response.sendRedirect("accessdenied.html");
                return;
            }
           
            CandidateInfo candidate = (CandidateInfo)request.getAttribute("candidate");
            StringBuffer displayBlock = new StringBuffer();
            displayBlock.append("<div class='sticky'><div class='candidate'>Vote for change</div><br>");
            if(candidate == null){
                displayBlock.append("<div class='subcandidate'> Sorry! you vote could not be casted</div> <br><br>");
                displayBlock.append("<div><h4  id='logout'><a href='LoginControllerServlet?logout=logout'></a></h4></div></div>");
                out.println(displayBlock);
            }
            else{
                displayBlock.append("<div class='subcandidate'> Thank you for voting.</div> <br><br>");
                displayBlock.append("<br><div  class ='candidateprofile'><p>Candidate Id : "+candidate.getCandidateId()+"</p><br>");
                displayBlock.append("<strong>You Voted for</strong><br><img src = 'data:image/jpg;base64,"+candidate.getSymbol()+" ' style='width:300px;height:200px;'/></lable>");
                displayBlock.append("<br><div  class ='candidateprofile'><p>Candidate Id : "+candidate.getCandidateId()+"</p>");
                displayBlock.append("Candidate Name : "+candidate.getCandidateName()+"<br><br>");
                displayBlock.append("Party : "+candidate.getParty()+"<br></div>");
                out.println(displayBlock);
            }
        %>
    </body>
</html>
