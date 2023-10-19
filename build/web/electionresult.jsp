<%-- 
    Document   : electionresult
    Created on : 26 Aug, 2023, 12:23:23 PM
    Author     : HP
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="evoting.dto.CandidateDetails"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
         
    </head>
    <body>
        <%
            String userid  = (String)session.getAttribute("userid");
             if(userid == null){
                     response.sendRedirect("accessdenied.html");
                      return;
               }
              LinkedHashMap<CandidateDetails,Integer> resultDetails = (LinkedHashMap) request.getAttribute("result");
              int voteCount = (int) request.getAttribute("votecount");
              Iterator it = resultDetails.entrySet().iterator();
              StringBuffer displayBlock = new StringBuffer("<table cellpadding='30px'>");
              displayBlock.append("<tr><th>Candidate id </th><th> Candidate Name</th> <th>Party</th>"
                      + "<th>Symbol</th><th>vote count</th> <th> vote % </th> </tr>");
              while (it.hasNext()) {
                      Map.Entry<CandidateDetails,Integer> e = (Map.Entry) it.next();
                      CandidateDetails cd = e.getKey();
                      float voteper = (e.getValue()*100.0f)/voteCount;
                      displayBlock.append("<tr> <td>"+cd.getCandidateId()+"</td> <td>"+cd.getCandidateName()+"</td>"
                              + "<td>"+cd.getParty()+"</td><td><img src = 'data:image/jpg;base64,"+cd.getSymbol()+" ' style='width:300px;height:200px;'/></td><td>"+e.getValue()+"</td>"
                                      + "<td> "+voteper+"</td></tr>");
                  }
              displayBlock.append("</table>");
              out.println(displayBlock);
        %>      
    </body>
</html>
