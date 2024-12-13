package gihan;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.PreparedStatement;

@MultipartConfig

public class update_movieServlet extends HttpServlet {


    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String name = request.getParameter("name");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String time = request.getParameter("time");
        String date = request.getParameter("date");
        String location = request.getParameter("location");
        String category = request.getParameter("category");
        String releasepara = request.getParameter("release");
        String imdb = request.getParameter("imdb");
        String durationpara = request.getParameter("duration");
        String trailer = request.getParameter("trailer");
        
        String movie_idpara = request.getParameter("movie_id");
        
        
        //getting file name
Part file1 = request.getPart("image1");
Part file2 = request.getPart("image2");

String fileName1 = file1.getSubmittedFileName();
String fileName2 = file2.getSubmittedFileName();




        
        //select path
       
        String uploadPath1 = "C:/Users/gihan/Documents/NetBeansProjects/WebApplication2/web/images/"+fileName1;
        String uploadPath2 = "C:/Users/gihan/Documents/NetBeansProjects/WebApplication2/web/images/"+fileName2;
        String database_path1 = "images/"+fileName1;
        String database_path2 = "images/"+fileName2;
        
        out.println(database_path2);
        out.println(database_path1);
//        
        
        //out.println("C:/Users/gihan/Documents/NetBeansProjects/WebApplication2/images"+fileName);
        
        try{
        
           try{
               //file upload path
            FileOutputStream fos = new FileOutputStream(uploadPath1);
            InputStream is = file1.getInputStream();

            
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
           }
           catch(Exception e){
           }
           
             try{
//file1 upload path
            FileOutputStream fos = new FileOutputStream(uploadPath2);
            InputStream is = file2.getInputStream();

            
            byte[] data = new byte[is.available()];
            is.read(data);
            fos.write(data);
            fos.close();
             }
             catch(Exception e){
           }
            //build connection
            
            int movie_id = Integer.parseInt(movie_idpara);
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                  String query1 = "UPDATE movie SET name = ?, title = ?, description = ?, time = ?, date = ?, location = ?, image = ?, category = ?, release_date = ?, imdb = ?, duration = ?, trailer = ?, bgimage = ? WHERE movie_id = ?";

PreparedStatement ps1 = conn.prepareStatement(query1);

// Convert the price-related data (if needed, but we are removing price from the query)
int duration = Integer.parseInt(durationpara);
int release = Integer.parseInt(releasepara);

// Set values in the PreparedStatement
ps1.setString(1, name);            // Set 'name'
ps1.setString(2, title);           // Set 'title'
ps1.setString(3, description);     // Set 'description'
ps1.setString(4, time);            // Set 'time'
ps1.setString(5, date);            // Set 'date'
ps1.setString(6, location);        // Set 'location'
ps1.setString(7, database_path1);  // Set 'image' (path for file1)
ps1.setString(8, category);        // Set 'category'
ps1.setInt(9, release);            // Set 'release_date' as an integer
ps1.setString(10, imdb);           // Set 'imdb' as a string
ps1.setInt(11, duration);          // Set 'duration' as an integer
ps1.setString(12, trailer);        // Set 'trailer'
ps1.setString(13, database_path2); // Set 'bgimage' (path for file2)
ps1.setInt(14, movie_id);          // Set 'movie_id' to identify the record

// Execute the query
int rowsUpdated = ps1.executeUpdate();
if (rowsUpdated > 0) {
    out.println("<script>");
    out.println("alert('Movie updated successfully!');");
    out.println("window.location.href = 'movie.jsp';");
    out.println("</script>");
} else {
    out.println("<script>");
    out.println("alert('No movie found with the given ID!');");
    out.println("</script>");
}
        }
        catch(Exception e){
        
            out.println(e);
        }
        
        
    }



}