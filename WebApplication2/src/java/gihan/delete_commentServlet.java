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


public class delete_commentServlet extends HttpServlet {

 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String comment_id_para = request.getParameter("comment_id");
        
       
        
        try{
        
            int comment_id = Integer.parseInt(comment_id_para);
            //build connection
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String query1 = "DELETE FROM comments WHERE comment_id = ?";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                ps1.setInt(1,comment_id);
                
                int x = ps1.executeUpdate();
                
                if(x>0){
                
                    out.println("<script>");
                out.println("alert('Comment Removed Successfully!');");
                out.println("window.location.href = 'comments.jsp';"); 
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