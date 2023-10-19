/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.controller;

import evoting.dao.CandidateDAO;
import evoting.dto.CandidateDetails;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class CandidateUpdateControllerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        HttpSession sess = request.getSession();
        RequestDispatcher rd = null;
        String userid = (String)sess.getAttribute("userid");
        if(userid == null){
            sess.invalidate();
            response.sendRedirect("accessdenied.html");
            return;
        }
        String name = request.getParameter("name");
        String cid = request.getParameter("id");
        String party = request.getParameter("party");       
        String city = request.getParameter("city");
        String uid = request.getParameter("uid");
        //System.out.println(name+" "+cid+" "+party+" "+city);
         try{
             boolean ans = CandidateDAO.updateCandidate(cid,name,party,city,uid);
              PrintWriter out = response.getWriter();
               out.print(ans);
        }
        catch(Exception ex){
            ex.printStackTrace();
            rd = request.getRequestDispatcher("showexception.jsp");
            request.setAttribute("Exception", ex);
            rd.forward(request, response);
        }
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
