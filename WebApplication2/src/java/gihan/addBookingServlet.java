package gihan;

import java.beans.Statement;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


public class addBookingServlet extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        

        
        
try{
            //build connection
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String query = "SELECT COUNT(*) AS ticketCount FROM tickets";
                PreparedStatement ps = conn.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

               int ticketCount = 0;
               if (rs.next()) {
                   ticketCount = rs.getInt("ticketCount");
               }

               int sum = 0;
               int tickets_counts = 0;
               String ticketName = "";
               // Process each ticket type
               for (int i = 1; i <= ticketCount; i++) {
                
                  String ticketTypeParam = "ticket_type" + i;
                  String ticketPriceParam = "ticket_price" + i;
                  String ticketCountParam = "ticket_count" + i;
                 String ticketIdParam = "ticket_id" + i;

                 String ticketType = request.getParameter(ticketTypeParam);
                 String ticketPriceStr = request.getParameter(ticketPriceParam);
                 String ticketCountStr = request.getParameter(ticketCountParam);
                 String ticketIdStr = request.getParameter(ticketIdParam);
                 
                 //set attribute
                 request.setAttribute("ticket_type" + i, ticketType);
                 request.setAttribute("ticket_price" + i, ticketPriceStr);
                 request.setAttribute("ticket_count" + i, ticketCountStr);
                 request.setAttribute("ticket_id" + i, ticketIdStr);

                   
                  if (ticketType != null && ticketPriceStr != null && ticketCountStr != null) {
                      int ticketPrice = Integer.parseInt(ticketPriceStr);
                      int ticketCountVal = Integer.parseInt(ticketCountStr);

                      // Calculate total
                     sum = sum + (ticketPrice*ticketCountVal);
                     tickets_counts = tickets_counts + ticketCountVal;
                   
                   if(ticketCountVal>0){
                       ticketName = ticketName+ticketType+"+";
                   }

                    
        } else {
            out.println("Missing parameter for ticket " + i);
        }

          
    }
               
       HttpSession session1 = request.getSession(false);
    
    
      if (session1 == null || session1.getAttribute("user_id") == null) {
       
        response.sendRedirect("user_login.jsp");
    }
             Integer user_id = (Integer) session1.getAttribute("user_id");
             String user_name = (String) session1.getAttribute("user_name");
             
             String movie_id_para = request.getParameter("movie_id");
             int movie_id = Integer.parseInt(movie_id_para);
             
             LocalDateTime now = LocalDateTime.now();
             DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
             String formattedDate = now.format(formatter);
 
               
            String query1 = "INSERT INTO booking(user_id, booking_date, quantity,total,tickets_name,movie_id,status) VALUES (?, ?, ?, ?, ?, ?, ?)";
            //PreparedStatement ps2 = conn.prepareStatement(query1, Statement.RETURN_GENERATED_KEYS);

            String status = "Pending";
            PreparedStatement ps1 = conn.prepareStatement(query1);
            ps1.setInt(1,user_id);
            ps1.setString(2, formattedDate);
            ps1.setInt(3, tickets_counts);
            ps1.setInt(4, sum);
            ps1.setString(5, ticketName);
            ps1.setInt(6, movie_id);
            ps1.setString(7, "Pending");
            
            int x = ps1.executeUpdate();
            if(x>0){
                
                  ResultSet rs2 = conn.createStatement().executeQuery("SELECT LAST_INSERT_ID()");
                 if (rs2.next()) {
                   int booking_id = rs2.getInt(1);
                   request.setAttribute("booking_id", booking_id);
                   
                  
}
//                 Forward data to SecondServlet using setAttribute

                String ticketCountStr = String.valueOf(ticketCount);
                
                
                request.setAttribute("ticketCountStr", ticketCountStr);
                
                
                
               
            }
            else{}
            
            // Forward to SecondServlet
                   RequestDispatcher dispatcher = request.getRequestDispatcher("addBookingItem");
                    dispatcher.forward(request, response);
               
}
        catch(Exception e){
        
            out.println(e);
        }
        
        
    }
}