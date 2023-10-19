<%@page import="evoting.dto.UserDetails"%>
<%@page import="org.json.JSONObject" %>
<%@page import="java.util.ArrayList" %>
<%
    
            String userid  = (String)session.getAttribute("userid");
          
            if(userid == null){
                response.sendRedirect("accessdenied.html");
                return;
            }
            String result = (String)request.getAttribute("result");
             if(result != null && result.equalsIgnoreCase("uid_list")){
                   StringBuffer displayBlock = new StringBuffer();
                   ArrayList<String> userList = (ArrayList<String>)request.getAttribute("userid");
                   StringBuffer sb = new StringBuffer();
                      sb.append("<option>Choose user id</option>");
                      for(String c : userList){
                          sb.append("<option value='"+c+"'>"+c+"</option>");
                      }
                      JSONObject json = new JSONObject();
                      json.put("uid", sb.toString());
                      System.out.println(sb.toString());
                      out.println(json);
             }
             else if(result != null && result.equalsIgnoreCase("details")){
                 ArrayList<UserDetails> ls = (ArrayList<UserDetails>)request.getAttribute("user");
                  StringBuffer displayBlock = new StringBuffer("<table cellpadding='30px'>");
                  displayBlock.append("<tr><th>User id </th><th> User Name</th> <th>Address</th>"
                      + "<th>City</th><th>Email</th> <th> Mobile no.</th> </tr>");
                  for(UserDetails ud : ls){
                      displayBlock.append("<tr> <td>"+ud.getUserid()+"</td> <td>"+ud.getUsername()+"</td>"
                              + "<td>"+ud.getAddress()+"</td><td>"+ud.getCity()+"</td><td>"+ud.getEmail()+"</td>"
                                      + "<td> "+ud.getMobile()+"</td></tr>");
                  }
                  displayBlock.append("</table>");
                  out.println(displayBlock);
             }
            
%>