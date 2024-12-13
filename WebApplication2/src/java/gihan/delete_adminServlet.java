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


public class delete_adminServlet extends HttpServlet {

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String admin_id_para = request.getParameter("admin_id");
        
       
        
        try{
        
            int admin_id = Integer.parseInt(admin_id_para);
            //build connection
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String query1 = "DELETE FROM admin WHERE id = ?";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                ps1.setInt(1,admin_id);
                
                int x = ps1.executeUpdate();
                
                if(x>0){
                
                    out.println("<script>");
                out.println("alert('Admin Removed Successfully!');");
                out.println("window.location.href = 'admin.jsp';"); 
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