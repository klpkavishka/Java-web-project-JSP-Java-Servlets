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

/**
 *
 * @author gihan
 */
public class adminUpdateServlet extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("mail");
        String pwd = request.getParameter("password");
        
        String admin_id_para = request.getParameter("admin_id");
        try{
        
            
            //build connection
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                
                
               String query = "UPDATE admin SET first_name = ?, last_name = ?, email = ?, password = ? WHERE id = ?";


                PreparedStatement ps1 = conn.prepareStatement(query);

                int admin_id = Integer.parseInt(admin_id_para); // Parse movie_id
                
                //assign data
                ps1.setString(1, fname);
                ps1.setString(2, lname);
                ps1.setString(3, email);
                ps1.setString(4, pwd);
                ps1.setInt(5, admin_id);
                
                int x = ps1.executeUpdate();
                if(x>0){
                
                    out.println("<script>");
                out.println("alert('Admin Updated Successfully!');");
                out.println("window.location.href = 'admin.jsp';"); 
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