package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import evoting.dto.CandidateInfo;

public final class showcandidate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>show candidate</title>\n");
      out.write("           <script src=\"//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>        \n");
      out.write("        <link href =\"stylesheet/pageheader.css\" rel = \"stylesheet\">\n");
      out.write("        <link href=\"stylesheet/backgroundimage.css\" rel =\"stylesheet\">\n");
      out.write("        <link href = \"stylesheet/showcandidate.css\" rel = \"stylesheet\">\n");
      out.write("        <script src=\"//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body style=\"color: white;\">\n");
      out.write("        ");

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
                displayBlock.append(""
                        + "<input type = 'radio' name='flat'  id='abc'"
                                + " value=' "+c.getCandidateId()+" ' onclick='addvote()' ");
                //System.err.println("@@@@@@@@@@@"+c.getCandidateId());
                displayBlock.append("<label for ='"+c.getCandidateId() +" ' ><img src = 'data:image/jpg;base64,"+c.getSymbol()+" ' style='width:300px;height:200px;'/></lable>");
                displayBlock.append("<br><div class='candidateprofile'><p>CandidateId:"+c.getCandidateId()+"<br>");
                displayBlock.append("Candidate Name : "+c.getCandidateName()+"<br>");
                displayBlock.append("Party : "+c.getParty()+"<br> </div>");
            }
            out.println(displayBlock);
        
      out.write(" \n");
      out.write("        <script>\n");
      out.write("            function addvote(){\n");
      out.write("                \n");
      out.write("                var id = $('#abc').val();\n");
      out.write("               // alert($('input[type=radio] [name=flat] :checked').attr('id'));\n");
      out.write("                data = {candidateid : id};//candidateid\n");
      out.write("                //alert(\"id is\" , id);\n");
      out.write("                $.post(\"AddVoteControllerServlet\" , data , processresponse);\n");
      out.write("            }\n");
      out.write("            function processresponse(responseText){\n");
      out.write("                responseText = responseText.trim();\n");
      out.write("                console.log(responseText);\n");
      out.write("                if(responseText === \"success\")\n");
      out.write("                {\n");
      out.write("                    swal(\"Success\",\"You vote is recorded\",\"success\").then((value)=>{\n");
      out.write("                        window.location=\"votingresponse.jsp\";\n");
      out.write("                    });\n");
      out.write("                }\n");
      out.write("                else\n");
      out.write("                {\n");
      out.write("                    swal(\"Failure\",\"Someting went wrong\",\"error\").then((value)=>{\n");
      out.write("                        window.location=\"votingresponse.jsp\";\n");
      out.write("                    });\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
