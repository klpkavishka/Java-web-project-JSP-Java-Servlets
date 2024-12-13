package gihan;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LoginServlet extends HttpServlet {



   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
            String fname = request.getParameter("fname");
            String pwd = request.getParameter("pwd");
            
             try {
                // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String query2 = "SELECT * FROM users WHERE first_Name = ? AND password = ?";
                PreparedStatement ps = conn.prepareStatement(query2);
                ps.setString(1, fname);
                ps.setString(2, pwd);
                ResultSet result = ps.executeQuery();

                if (result.next()) {
                        // If user exists
                        out.println("<h3>Login successful! Welcome, " + fname + ".</h3>");
                    } else {
                        // If user doesn't exist
                        out.println("<h3 style='color: red;'>Invalid username or password. Please try again.</h3>");
                    }
             }
            catch(Exception e){
            out.println(e);
            }
    }

   
}