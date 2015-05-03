/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import DAO.DAOservice;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author yadav
 */
public class register extends HttpServlet {

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
        RequestDispatcher rd = request.getRequestDispatcher("login.html");

        try {
            String email, branch, year, password, name;
            email = request.getParameter("email");
            name = request.getParameter("name");
            branch = request.getParameter("branch");
            year = request.getParameter("year");
            password = request.getParameter("pass");
            String existsQuery = "select email from userdb;";
            ResultSet emailSet = DAOservice.selectData(existsQuery);
            try{
            while(emailSet.next()){
                String temp = emailSet.getString(1);
                if(temp.equals(email)){
                    out.print("<script>");
                out.print("alert('email already exists')");
                out.print("</script>");
                rd.include(request, response);
                return;
                }
            }
            }
            catch(SQLException e){
                System.out.println(e);
            }
            String query = "insert into userdb (email , branch, year,password, name)  values ('" + email + "','" + branch + "','" + year + "','" + password + "','" + name + "');";

            
            int i = DAOservice.updateData(query);
            if (i == 1) {
                out.print("<script>");
                out.print("alert('registered Successfully')");
                out.print("</script>");
                rd.include(request, response);
            }

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
