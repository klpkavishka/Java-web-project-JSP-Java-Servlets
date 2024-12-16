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


public class deleteBooking extends HttpServlet {

 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String booking_id_para = request.getParameter("booking_id");
        
       
        
        try{
        
            int booking_id = Integer.parseInt(booking_id_para);
            //build connection
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String query1 = "DELETE FROM booking WHERE booking_id = ?";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                ps1.setInt(1,booking_id);
                
                int x = ps1.executeUpdate();
                
                if(x>0){
                
                    String query2 = "DELETE FROM booking_item WHERE booking_id = ?";
                PreparedStatement ps2 = conn.prepareStatement(query2);
                
                ps2.setInt(1,booking_id);
                
                int y = ps2.executeUpdate();
                
                if(y>0){
                    
                    out.println("<script>");
                out.println("alert('Booking Removed Successfully!');");
                out.println("window.location.href = 'booking_dashboard.jsp';"); 
                out.println("</script>");
                }
                    

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
