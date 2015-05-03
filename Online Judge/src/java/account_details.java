import DAO.DAOservice ;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author yadav
 */
public class account_details extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            HttpSession session=request.getSession(false);
        if(session != null){
        int i =Integer.parseInt((String)session.getAttribute("user_id"));
        String q = "select * from userdb where userid="+i ;
     String query = "select problem_id from submission  where userid="+i ;
        ResultSet rs = DAOservice.selectData(q);
        ResultSet result = DAOservice.selectData(query);
       try{
           if(rs.next())
        {String name = rs.getString("name");
         String Userid = rs.getString("userid");
         String Branch = rs.getString("branch");
         String Year = rs.getString("year");
         String email = rs.getString("email");

          out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet account_details</title>");
            out.println("</head>");
            out.println("<body bgcolor=\"" + "#FFFFFF\""+">");
           // out.println("<h1>Servlet account_details at " + request.getContextPath () + "</h1>");
            out.println("<center>");
             out.println("<table border=\""+"1\" " +"bgcolor=\""+"#FFFFFF\" " +"style=\"" + "width:100%;height:100%\">");
              out.println("<th>");
               out.println("User Details");
               out.println("</th>");
                out.println("<tr>");
             out.println("<td>");
             out.println( "USERID    :"+Userid);
             out.println("</td>");
             out.println("</tr>");
             out.println("<tr>");
             out.println("<td>");
             out.println( "Email    :"+email);
             out.println("</td>");
             out.println("</tr>");
             out.println("<tr>");
             out.println("<td>");
             out.println("NAME     :" + name);
             out.println("</td>");
              out.println("</tr>");
             out.println("<tr>");
             out.println("<td>");
             out.println( "BRANCH     :"+Branch);
             out.println("</td>");
             out.println("</tr>");
              out.println("<tr>");
             out.println("<td>");
             out.println( "YEAR     :"+Year);
             out.println("</td>");
             out.println("</tr>");
           out.println("<tr>");
             out.println("<td>");
             out.println( "Problems Solved :");
             out.println( "<br>");




            // out.println( "Problems problem2 problem3 problem4  Problems problem2 problem3 problem4 Problems problem2 problem3 problem4 Problems problem2 problem3 problem4");
             
             
            
            


        }
           while(result.next())
           {  int id = Integer.parseInt(result.getString("problem_id"));
              String str = "select name from contest_problems where problem_id ="+ id ;
              ResultSet solved = DAOservice.selectData(str);
             out.print("<font color=\""+"#33CCFF\"> ");
              if(solved.next())
              { String problem_name = solved.getString("name");
                //out.print(problem_name + "  ");
              out.print(problem_name+", ");
               // out.print("<a href= \""+"show_problem.jsp?problemid="+id+"&problem_name="+problem_name+ "\">"+problem_name+ "</a>");
              }
              
              //out.print(" " + id);
           }
           
           out.println("</td>");
             out.println("</tr>");
            out.println("</table>");
             out.println("</center>");
       }catch(Exception e){}
        
      
     
        out.println("</body>");
            out.println("</html>");
        
        }
        else{
            out.print("Please login first");
            request.getRequestDispatcher("index.jsp").include(request, response);
        }
            
           
            
        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

