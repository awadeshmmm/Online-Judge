/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import DAO.DAOservice ;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.DAOservice;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author akash
 */
public class code_eval extends HttpServlet {

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
        String tmp = request.getParameter("problem_id");
        PrintWriter out = response.getWriter();
        try {
            HttpSession session = request.getSession();
            if(session.getAttribute("uname") == null){
                out.println("<script>");
                out.println("alert('You must be logged in to submit code');");
                out.println("</script>");
                request.getRequestDispatcher("login.html").include(request, response);
            }
            else{
           extract_from_database(request, response, tmp);
            }
        } catch (SQLException e) {
            System.out.println(e);
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

    protected void extract_from_database(HttpServletRequest request, HttpServletResponse response, String problem_id) throws SQLException {

        String query = "select input, time_limit, output from contest_problems"
                + " where problem_id = " + problem_id + ";";

        ResultSet rs = DAOservice.selectData(query);
        if (rs.next()) {
            String input = rs.getString("input");
            String time_limit = rs.getString("time_limit");
            String output = rs.getString("output");
            try {
                String solution_content = request.getParameter("solution_content");
                solution_content = solution_content.replace("\n", "$_n_$").replace("\r", "$_n_$");
                //System.out.println(solution_content);
                String language = request.getParameter("language");
                createClientSocket(request, response, input, time_limit, output, solution_content, language, problem_id);
                //return status ;
            } catch (IOException e) {
            }
        }
        //return null;
    }

    private void createClientSocket(HttpServletRequest request, HttpServletResponse response, String input, String time_limit, String output,
            String solution_content, String language, String problem_id) throws IOException {
        
        
            String filename="";
            PrintWriter out = response.getWriter();
            RequestDispatcher rd = request.getRequestDispatcher("contest_problem.jsp");
            /*out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet code_eval</title>");
            out.println("</head>");*/
            out.println("<script>");
            // out.println("<h1>Servlet code_eval at " + request.getContextPath() + "</h1>");
            // out.println(str);
            
            
            switch (language) {
                case "Java":
                    language = "java";
                    filename = "Solution.java";
                    break;
                case "C":
                    language = "c";
                    filename = "Solution.c";
                    break;
                case "C++":
                    language = "cpp";
                    filename = "Solution.cpp";
                    break;
                case "Python":
                    language = "python";
                    filename = "Solution.py";
                    break;
            }
            
            //to replace all new line characters with @_n_@
            input = input.replaceAll("(\\r|\\n|\\r\\n)+", "@_n_@");
            Socket client = new Socket("localhost", 3057);
            InputStream is = client.getInputStream();
            OutputStream os = client.getOutputStream();
            
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(os));
            bw.write(filename);
            bw.newLine();
            bw.write(time_limit);
            bw.newLine();
            bw.write(solution_content);
            bw.newLine();
            bw.write(input);
            bw.newLine();
            bw.write(language);
            bw.newLine();
            bw.flush();
            
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            int status = Integer.parseInt(br.readLine());
            
            if(status == 1){
                String user_code_output = br.readLine();
                output = output.trim().replaceAll("(\\r|\\n|\\r\\n)+", "@_n_@");
                if(user_code_output.equals(output))
                {
                    System.out.println("Status = AC");
                    addToSubmissionTable(request, problem_id);
                    out.println("alert('Status = AC');") ;
                }
                else
                {
                    out.println("alert('Wrong Answer');");
                }
            }
            else if(status == 0){
                String errors = br.readLine();
                String msg = "Compile Error:"+errors ;
                
                
                System.out.println("Compile Error:"+errors);
                out.println("alert('Compile Errors');");
            }
            else if(status == 2){
                System.out.println("Time Limit Exceed");
                out.println("alert('Time Limit Exceed');");
            }
            client.close();
            out.println("</script>");
        try {
            rd.include(request, response);
            // out.println("</html>");
        } catch (ServletException ex) {
            Logger.getLogger(code_eval.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    private void addToSubmissionTable(HttpServletRequest request, String problem_id) {
        HttpSession session = request.getSession(false);
        if(session != null)
        { 
            System.out.println(problem_id);
            try {
                String exits_query = "select * from submission where problem_id = "+ problem_id;
                ResultSet rs = DAOservice.selectData(exits_query);
                System.out.println(rs.next());
                if(!rs.next()){
                    String user_name = (String)session.getAttribute("uname");
                    String userid = (String)session.getAttribute("user_id");
                    
                    System.out.println("userid = "+userid);
                    String query = "insert into submission ( userid,problem_id)  values (" + userid + "," + problem_id +");";
                    
                    
                    int i = DAOservice.updateData(query);
                    int problem_points = 0, user_total_points = 0;
                    //System.out.println(i);
                    
                    //read points of problem from table
                    String read_porblem_points = "select points from contest_problems where problem_id ="+problem_id;
                    ResultSet probelem_points_rs = DAOservice.selectData(read_porblem_points);
                    if(probelem_points_rs.next()){
                        problem_points = Integer.parseInt(probelem_points_rs.getString(1));
                    }
                    
                    //read user total points from table
                    String read_user_points = "select total_points from userdb where userid="+userid;
                    ResultSet user_points_rs = DAOservice.selectData(read_user_points);
                    if(user_points_rs.next()){
                        user_total_points = Integer.parseInt(user_points_rs.getString(1));
                    }
                    
                    int updated_user_points = user_total_points + problem_points;
                    
                    //update the new points to the userdb table
                    String update_user_points = "update userdb set total_points="+updated_user_points+" where userid = "+userid;
                    int temp = DAOservice.updateData(update_user_points);
                }
            } catch (SQLException ex) {
                Logger.getLogger(code_eval.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        
    }
        
    }

