package gihan;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class bookingCancelServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        
        
        try{
             String booking_idPara = request.getParameter("booking_id");
        
             int booking_id = Integer.parseInt(booking_idPara);
             //build connection
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                //validation
                String query1 =  "UPDATE booking SET status = ? WHERE booking_id = ?";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                ps1.setString(1, "Cancelled");
                ps1.setInt(2, booking_id);
                
                int x = ps1.executeUpdate();
                
                if(x>0){
                
                    response.sendRedirect("SendCancelBooking?booking_id="+booking_id);
                }
                else{
                
                     }
        }
        catch(Exception e){
        
            out.println(e);
        }
    }
}