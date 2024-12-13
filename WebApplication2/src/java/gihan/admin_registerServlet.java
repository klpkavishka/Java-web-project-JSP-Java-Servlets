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


public class admin_registerServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("mail");
        String pwd = request.getParameter("password");
        out.println(email);
        
        
        try{
        
            // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                //email validation from server
                String query1 = "SELECT * FROM admin WHERE email = ?";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                ps1.setString(1, email);
                
                ResultSet result = ps1.executeQuery();
                
                if(result.next()){
                
                   out.println("<script>");
                out.println("alert('Email Already Taken!');");
                out.println("window.location.href = 'admin.jsp';"); 
                out.println("</script>");
                }
                else{
                
                    
                String query2 = "INSERT INTO admin(first_Name,last_name,email,password) VALUES (?, ?,?,?)";
                PreparedStatement ps = conn.prepareStatement(query2);
                
                // Insert Query
               
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, email);
                ps.setString(4, pwd);

                // Execute Update
                int x = ps.executeUpdate();

                // Output Result
                if (x > 0) {
                    out.println("<script>");
                out.println("alert('Admin Registered Successfully!');");
                out.println("window.location.href = 'admin.jsp';"); 
                out.println("</script>");
                } else {
                    out.println("Error");
                }
                }

        }
        catch(Exception e){
        
            out.println(e);
        }
    }


}