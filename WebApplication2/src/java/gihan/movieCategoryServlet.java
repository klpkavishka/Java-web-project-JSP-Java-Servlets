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

public class movieCategoryServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        
        out.println(title);
        out.println(description);
        
        //start build connection
        try {
                // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String query1 = "INSERT INTO movie_category(category,description) VALUES(?,?)";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                ps1.setString(1, title);
                ps1.setString(2, description);
                
                int x = ps1.executeUpdate();
                
                if(x>0){
                
                    out.println("<script>");
    out.println("alert('Category Added successfully!');");
    out.println("window.location.href = 'movie_category.jsp';");
    out.println("</script>");
                }
                else{
                
                    out.println("error");
                }
        }
        catch(Exception e){
        
            out.println(e.getMessage());
        }
    }


}