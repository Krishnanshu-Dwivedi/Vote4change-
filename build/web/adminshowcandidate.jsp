<%-- 
    Document   : adminshowcandidate
    Created on : 10 Aug, 2023, 4:38:09 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONObject" %>
<%@page import="evoting.dto.CandidateDetails" %>
<%@page import="java.util.ArrayList" %>
<%
    
            String userid  = (String)session.getAttribute("userid");
            StringBuffer displayBlock = new StringBuffer();
            if(userid == null){
                response.sendRedirect("accessdenied.html");
                return;
            }
            String result = (String)request.getAttribute("result");
            if(result != null && result.equalsIgnoreCase("candidatelist")){
                ArrayList<String> candidateId = (ArrayList<String>)request.getAttribute("candidateid");
                displayBlock.append("<option>Choose candidate id</option>");
                for(String c : candidateId){
                    displayBlock.append("<option value='"+c+"'>"+c+"</option>");
                }
                JSONObject json = new JSONObject();
                json.put("cid", displayBlock.toString());
                out.println(json);
            }
            else if(result != null && result.equalsIgnoreCase("details")){
                System.out.println("***************************");
                CandidateDetails cd = (CandidateDetails)request.getAttribute("candidate");
                String str = "<img src = 'data:image/jpg;base64,"+cd.getSymbol()+"'sytle='width:300px; height:200px;'/>";
                displayBlock.append("<table>");
                displayBlock.append("<tr><th>UserId :</th><td>"+cd.getUserid()+"</td></tr>");
                displayBlock.append("<tr><th>Candidate Name:</th><td>"+cd.getCandidateName()+"</td></tr>");
                displayBlock.append("<tr><th>City :</th><td>"+cd.getCity()+"</td></tr>");
                displayBlock.append("<tr><th>Party:</th><td>"+cd.getParty() +"</td></tr>");
                displayBlock.append("<tr><th>Symbol:</th><td>"+str+"</td></tr>");
                displayBlock.append("</table>");
                JSONObject json = new JSONObject();
                json.put("subdetails", displayBlock.toString());
                out.println(json);
                
            }
            else if(result != null && result.equalsIgnoreCase("update")){
                 CandidateDetails cd = (CandidateDetails)request.getAttribute("candidate");
                  JSONObject json = new JSONObject();
                  json.put("userid", cd.getUserid());
                  json.put("name", cd.getCandidateName());
                  json.put("city", cd.getCity());
                  json.put("party", cd.getParty());
                  out.println(json);
                 
            }
            
%>