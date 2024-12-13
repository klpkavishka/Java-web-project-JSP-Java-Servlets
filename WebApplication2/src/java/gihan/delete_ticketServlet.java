package gihan;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class delete_ticketServlet extends HttpServlet {

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String ticket_id_para = request.getParameter("ticket_id");
        
        out.println(ticket_id_para);
        
        try{
        
            int ticket_id = Integer.parseInt(ticket_id_para);
            //build connection
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String query1 = "DELETE FROM tickets WHERE id = ?";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                ps1.setInt(1,ticket_id);
                
                int x = ps1.executeUpdate();
                
                if(x>0){
                
                    out.println("<script>");
    out.println("alert('Ticket Removed successfully!');");
    out.println("window.location.href = 'tickets.jsp';");
    out.println("</script>");

                }
                else{
                
                    out.println("error");
                }
                
        }
        catch(Exception e){
        
            out.println(e);
        }
    }


}