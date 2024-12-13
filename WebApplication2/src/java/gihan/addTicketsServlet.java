package gihan;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class addTicketsServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String type = request.getParameter("type");

        String pricepara = request.getParameter("price");


       
        
        try{
        
          
           
            //build connection
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String query1 = "INSERT INTO tickets(type, price) VALUES (?, ?)";

                PreparedStatement ps1 = conn.prepareStatement(query1);
//                
                //CONVERT PRICE DATA(STRING TO INT)
                int price = Integer.parseInt(pricepara);

                
                //assign data
                ps1.setString(1, type);

                ps1.setInt(2, price);

                int x = ps1.executeUpdate();
                if(x>0){
                
                    out.println("<script>");
    out.println("alert('Ticket Added successfully!');");
    out.println("window.location.href = 'tickets.jsp';");
    out.println("</script>");
                    
                }
                else{
                
                    out.println("error1");
                }
        }
        catch(Exception e){
        
            out.println(e);
        }
}
}