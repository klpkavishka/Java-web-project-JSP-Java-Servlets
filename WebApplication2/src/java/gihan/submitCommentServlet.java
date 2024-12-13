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


public class submitCommentServlet extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String userIdPara = request.getParameter("user_id");
        
        
            // Check if the user_id parameter is null or empty
    if (userIdPara.equals("null")) {
        response.sendRedirect("user_login.jsp");
    }
    else{
        
        
        
        try {
               int user_id = Integer.parseInt(userIdPara);
               String comment = request.getParameter("comment"); 
               if (comment.equals("")) {
                    out.println("<script>");
                out.println("alert('Please enter your comment!');");
                out.println("window.location.href = 'home_page.jsp';"); 
                out.println("</script>");
    }
               else{
                   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                String query = "INSERT INTO comments(user_id,comment) VALUES(?,?)";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, user_id); // Set new status
                ps.setString(2, comment); // Set booking ID

                int rowsUpdated = ps.executeUpdate();
                if(rowsUpdated>0){
                out.println("<script>");
                out.println("alert('Comment Added successfully!');");
                out.println("window.location.href = 'home_page.jsp';"); 
                out.println("</script>");
                }
               }
                
        }
            catch(Exception e){
                out.println(e);
            }
    }
        
        
        
       
 }
}