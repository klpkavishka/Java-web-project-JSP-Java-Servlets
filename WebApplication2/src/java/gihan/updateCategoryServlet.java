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


public class updateCategoryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("name");

        String description = request.getParameter("description");

        String category_id_para = request.getParameter("category_id");
        
        

        
        try{
        
           
            
            //build connection
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String query1 = "UPDATE movie_category SET category = ?, description = ? WHERE id = ?";


                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                int category_id = Integer.parseInt(category_id_para); // Parse movie_id
                
                //assign data
                ps1.setString(1, name);

                ps1.setString(2, description);

                ps1.setInt(3,category_id);
                
                int x = ps1.executeUpdate();
                if(x>0){
                
                   out.println("<script>");
                out.println("alert('Category Updated Successfully!');");
                out.println("window.location.href = 'movie_category.jsp';"); 
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