package gihan;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;


public class delete_movieServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String movie_id_para = request.getParameter("movie_id");
        
        out.println(movie_id_para);
        
        try{
        
            int movie_id = Integer.parseInt(movie_id_para);
            //build connection
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String query1 = "DELETE FROM movie WHERE movie_id = ?";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                ps1.setInt(1,movie_id);
                
                int x = ps1.executeUpdate();
                
                if(x>0){
                
                      out.println("<script>");
                out.println("alert('Movie Removed Successfully!');");
                out.println("window.location.href = 'movie.jsp';"); 
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