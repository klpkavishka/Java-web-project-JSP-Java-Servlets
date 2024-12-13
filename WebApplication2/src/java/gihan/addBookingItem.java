package gihan;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gihan
 */
public class addBookingItem extends HttpServlet {
@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String ticketCountStr = (String) request.getAttribute("ticketCountStr");
        int ticketCount = Integer.parseInt(ticketCountStr);
        
        
        
        int booking_id = (int) request.getAttribute("booking_id");
        
        
        
try{        
       //build connection
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", ""); 
    
     HttpSession session1 = request.getSession(false);
    
    
      if (session1 == null || session1.getAttribute("user_id") == null) {
       
        response.sendRedirect("user_login.jsp");
    }
       Integer user_id = (Integer) session1.getAttribute("user_id");
      
            String query1 = "INSERT INTO booking_item(booking_id, ticket_id, quantity, price, total, status) VALUES (?, ?, ?, ?, ?, ?)";
          
            PreparedStatement ps1 = conn.prepareStatement(query1);
            String status = "Pending";
            
    
    int sum = 0;
        int tickets_counts = 0;
               String ticketName = "";
               // Process each ticket type
               for (int i = 1; i <= ticketCount; i++) {
                
                  String ticketTypeParam = "ticket_type" + i;
                  String ticketPriceParam = "ticket_price" + i;
                  String ticketCountParam = "ticket_count" + i;
                  String ticketIdParam = "ticket_id" + i;

                 
                 //get parameter
                 ticketTypeParam = (String) request.getAttribute("ticket_type" + i);
                 
                 
                 ticketPriceParam = (String) request.getAttribute("ticket_price" + i);
                 int ticketPrice = Integer.parseInt(ticketPriceParam);
        
                 ticketCountParam = (String) request.getAttribute("ticket_count" + i);
                 int ticketCountval = Integer.parseInt(ticketCountParam);
                 
                 ticketIdParam = (String) request.getAttribute("ticket_id" + i);
                 int ticketIdval = Integer.parseInt(ticketIdParam);
                 
                 
                 
                 if(ticketCountval>0){
                    
                    sum = sum + (ticketPrice*ticketCountval);
                    
                    
                    ps1.setInt(1,booking_id);
                    ps1.setInt(2, ticketIdval);
                    ps1.setInt(3, ticketCountval);
                    ps1.setInt(4,ticketPrice);
                    ps1.setInt(5, (ticketCountval*ticketPrice));
                    ps1.setString(6, status);
                    
                    ps1.executeUpdate();
                     
                 }
 
               }
              
               response.sendRedirect("SendBookingServlet?booking_id=" + booking_id);

               
      
        
        

           
            
           
               
}
        catch(Exception e){
        
            out.println(e);
        }
        
        
    }
}