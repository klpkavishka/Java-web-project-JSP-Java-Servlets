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
import javax.servlet.http.HttpSession;

public class user_updateServlet extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("mail");
        String pwd = request.getParameter("password");
        String info_para = request.getParameter("info");
        out.println(email);
        
        
        try{
        
            
             HttpSession session1 = request.getSession(false);
    
    
      if (session1 == null || session1.getAttribute("user_id") == null) {
       
        response.sendRedirect("user_login.jsp");
    }  
      
      Integer userId = (Integer) session1.getAttribute("user_id");
             String user_name = (String) session1.getAttribute("user_name");
             
             
            int info = Integer.parseInt(info_para);
            // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                //email validation from server
               String query1 = "SELECT * FROM users WHERE email = ? AND id != ?";
            PreparedStatement ps1 = conn.prepareStatement(query1);
            ps1.setString(1, email);
            ps1.setInt(2, userId);
                
                
                ResultSet result1 = ps1.executeQuery();
                
                if(result1.next()){
                
                    out.println("<script>");
                    out.println("alert('Email Already Taken!');");
                    out.println("window.location.href = 'user_account.jsp';"); 
                    out.println("</script>");
                }
                
                else{
                
                    
                String query2 = "UPDATE users SET first_name = ?, last_name = ?, email = ?, password = ?, contact = ? WHERE id = ?";

                PreparedStatement ps = conn.prepareStatement(query2);
                
                // Insert Query
               
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, email);
                ps.setString(4, pwd);
                ps.setInt(5, info);
                ps.setInt(6, userId);

                // Execute Update
                int x = ps.executeUpdate();

                // Output Result
                if (x > 0) {
                    out.println("<script>");
                out.println("alert('Updated Successfully!');");
                out.println("window.location.href = 'home_page.jsp';"); 
                out.println("</script>");
                } else {
                    out.println("Error");
                }
                }

        }
        catch(Exception e){
        
            out.println(e);
        }
    }

}