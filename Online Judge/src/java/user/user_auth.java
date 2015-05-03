/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import DAO.DAOservice;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author akash
 */
public class user_auth extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String email, password;
            email = request.getParameter("email");
            password = request.getParameter("pass");
            String query = "select * from  userdb where email = '" +email +  "' and password = '" +password  + "';";
            //to prevent sql injection
            /*PreparedStatement ps=DAOservice.getConnection().prepareStatement(query);
                ps.setString(1,email);
                ps.setString(2, password);*/
            ResultSet rs = DAOservice.selectData(query);
            /*RequestDispatcher redirect_to_home = request.getRequestDispatcher("index1.jsp");
            RequestDispatcher redirect_to_login = request.getRequestDispatcher("login.html");*/

            if (rs.next()) {
                String user_id = rs.getString(1);
                String name = rs.getString(6);

                HttpSession session = request.getSession();
                session.setAttribute("uname", name);
                session.setAttribute("user_id", user_id);


                /*     
                 out.print("<script>");
                 out.print("alert('logged in successfully')");
                 out.print("</script>");*/
                //redirect_to_home.include(request, response);
                response.sendRedirect("index1.jsp");
            } else {
                out.print("<script>");
                out.print("alert('invalid username or password')");
                out.print("</script>");
                //redirect_to_login.include(request, response);
                response.sendRedirect("login.html");
            }

        } catch (Exception e) {
        } finally {
            out.close();
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
