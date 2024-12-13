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
import java.sql.*;
import javax.servlet.http.HttpSession;


public class admin_loginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        try{
        
             //build connection
             // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                //validation
                String query1 = "SELECT * FROM users WHERE email = ? AND password = ? ";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                
                ps1.setString(1, email);
                ps1.setString(2, password);
                
                ResultSet rs = ps1.executeQuery();
                
                if(rs.next()){
                    
                    int id = rs.getInt("id");
                    String first_name=rs.getString("first_name");
                    
                    //session create
                HttpSession session1 = request.getSession();
                session1.setAttribute("user_id", id);
                session1.setAttribute("user_name", first_name);
                session1.setMaxInactiveInterval(30 * 60);
                
                    response.sendRedirect("dashboard_home.jsp");
                }
                else{
                
                    response.sendRedirect("admin_login.jsp?error=Invalid user name and password");
                }
        }
        catch(Exception e){
        
            out.println(e);
        }
    }


}