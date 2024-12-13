package gihan;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class changeStatusServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String bookingPara = request.getParameter("booking_id");
        int booking_id = Integer.parseInt(bookingPara);
        
        String act = request.getParameter("act");
        String status = request.getParameter("status");
        
        if ("yes".equals(act)) {
        
            try {
                // Update the booking status in the database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                String query = "UPDATE booking SET status = ? WHERE booking_id = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, status); // Set new status
                ps.setInt(2, booking_id); // Set booking ID

                int rowsUpdated = ps.executeUpdate();
                if(rowsUpdated>0){
                    if(status.equals("Return")){
                        
                        
                         String query1 = "SELECT * FROM booking WHERE booking_id = ?";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                ps1.setInt(1, booking_id);
                ResultSet result1 = ps1.executeQuery();
                
                if(result1.next()){
                    int user_id = result1.getInt("user_id");
                    String booking_date = result1.getString("booking_date");
                   int movie_id = result1.getInt("movie_id");
                   int total = result1.getInt("total");
                    int quantity = result1.getInt("quantity");
                    
                    
                     String query5 = "SELECT * FROM users WHERE id = ?";
                     PreparedStatement ps5 = conn.prepareStatement(query5);
                     ps5.setInt(1, user_id);
                     ResultSet result5 = ps5.executeQuery();
                
                if(result5.next()){
                    String email = result5.getString("email");
                    
                    
                    String query2 = "SELECT * FROM movie WHERE movie_id = ?";
                PreparedStatement ps2 = conn.prepareStatement(query2);
                
                ps2.setInt(1, movie_id);
                
                ResultSet result2 = ps2.executeQuery();
                
                if(result2.next()){
                 String movie_name = result2.getString("name");
                 String date = result2.getString("date");
                 String time = result2.getString("time");
                 String location = result2.getString("location");
                 
                 String query3 = "SELECT * FROM booking_item WHERE booking_id = ?";
                 PreparedStatement ps3 = conn.prepareStatement(query3);
               ps3.setInt(1, booking_id);
                ResultSet result3 = ps3.executeQuery();

                  StringBuilder ticketRows = new StringBuilder();
                while (result3.next()) {
                     int tid = result3.getInt("ticket_id");
                      int qty = result3.getInt("quantity");
                      int tprice = result3.getInt("price");
                      int ttotal = result3.getInt("total");
                            
                      
                      String query4 = "SELECT * FROM tickets WHERE id = ?";
                 PreparedStatement ps4 = conn.prepareStatement(query4);
               ps4.setInt(1, tid);
                ResultSet result4 = ps4.executeQuery();

                while (result4.next()) {
                    String type = result4.getString("type");
                    
                     // Add a row to the HTML table
    ticketRows.append("<tr>")
              .append("<td>").append(type).append("</td>")
              .append("<td>").append(qty).append("</td>")
              .append("<td>$").append(ttotal).append("</td>")
              .append("</tr>");
                    
                    
                    
                    
                    
                }
                }
                
                
                // Sender's email credentials
        final String senderEmail = "pawankavishka2003@gmail.com";
        final String senderPassword = "fjsu llva lgvz iuud"; // Replace with the sender's email password or app password

        // Recipient's email
        final String recipientEmail = email;

        // Email properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Email session
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(senderEmail, senderPassword);
                    }
                });

        try {
            // Create the email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail)); // Set the sender's email
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail)); // Set the recipient's email
            message.setSubject("Your Multiflex Booking Confirmation Details"); // Set email subject

            // Email content
            MimeBodyPart htmlPart = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();

           String htmlContent = "<html>" +
    "<body style='font-family: \"Inter\", sans-serif; background-color: #f5f5f7; color: #333333; line-height: 1.6; padding: 20px; margin: 0;'>" +
    "<div style='max-width: 400px; margin: 2rem auto;'>" +
    "<div style='background-color: #ffffff; border-radius: 20px; overflow: hidden; box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); transition: transform 0.3s ease, box-shadow 0.3s ease; border-top:3px solid red;'>" +
    "<div style='overflow: hidden;'>" +
    "<h2 style='padding-left: 20px;'>multi<span style='color:red;'>flex</span></h2>" +
    "</div>" +
    "<div style='padding: 20px;'>" +
    "<h2 style='font-size: 1.5rem; font-weight: 700; margin-bottom: 10px; color: #333333;'>Booking Details</h2>" +
    "<hr style='background-color: red; height: 2px; border: none;'>" +
    "<p style='font-size: 0.9rem; color: #666; margin-bottom: 20px;'>We regret to inform you that your booking has been canceled. Below are the details of your canceled booking along with the refund information.</p>" +
    "<hr style='background-color: red; height: 2px; border: none;'>" +
    "<h3 style='line-height: 0.5;'>Booking Id :<span style='color: #666;'>" + booking_id + "</span></h3>" +
    "<h3 style='line-height: 0.5;'>Movie Name :<span style='color: #666;'>" + movie_name + "</span></h3>" +
    "<h3 style='line-height: 0.5;'>Movie Date :<span style='color: #666;'>" + date + "</span></h3>" +
    "<h3 style='line-height: 0.5;'>Movie Time :<span style='color: #666;'>" + time + "</span></h3>" +
    "<h3 style='line-height: 0.5;'>Location :<span style='color: #666;'>" + location + "</span></h3>" +
    "<p style='font-size: 1rem; font-weight: bold; color: #333; margin-top: 20px;'>Tickets Type:</p>" +
    "<div style='display: flex; justify-content: center; margin: 20px 0;'>" +
    "<table style='border-collapse: collapse; width: 100%; max-width: 350px; background-color: #fff; box-shadow: 0 5px 10px rgba(0,0,0,0.1);'>" +
    "<thead>" +
    "<tr style='background-color: #D83344; color: #fff;'>" +
    "<th style='padding: 10px; text-align: left; border: 1px solid #ddd;'>Type</th>" +
    "<th style='padding: 10px; text-align: right; border: 1px solid #ddd;'>Quantity</th>" +
    "<th style='padding: 10px; text-align: right; border: 1px solid #ddd;'>Cost</th>" +
    "</tr>" +
    "</thead>" +
    "<tbody>" + ticketRows.toString() + "</tbody>" +
    "</table>" +
    "</div>" +
    "<div style='display: flex; justify-content: space-between; align-items: center;'>" +
    "<div>" +
    "<span style='font-size: 1.25rem; font-weight: 600; color: #D83344;'>Total Price :</span>" +
    "<span style='font-size: 1rem; font-weight: 600; color: black;'>$" + total + "</span>" +
    "</div>" +
    "</div>" +
    "<hr style='background-color: red; height: 2px; border: none;'>" +
    "<p style='font-size: 1rem; font-weight: bold; color: #333;'>Refund Information:</p>" +
    "<p style='font-size: 0.9rem; color: #666;'>A refund of <span style='font-weight: bold;'>$" + total + "</span> has been processed to your original payment method. Please allow 5-7 business days for the amount to reflect in your account.</p>" +
    "<p style='font-size: 0.9rem; color: #666;'>If you have any questions, feel free to contact our support team at <span style='color: red;'>support@multiflex.com</span>.</p>" +
    "</div>" +
    "</div>" +
    "</div>" +
    "</body>" +
    "</html>";



            htmlPart.setContent(htmlContent, "text/html");
            multipart.addBodyPart(htmlPart);

            message.setContent(multipart);

            // Send the email
            Transport.send(message);

            out.println("<script>");
    out.println("alert('Email Sent Successfully.!');");
    out.println("window.location.href = 'booking_dashboard.jsp';");
    out.println("</script>");
        } catch (Exception e) {
            // Handle exceptions and display errors
            out.println("<center><h2 style='color:red;'>Error in sending email.</h2>");
            out.println("Error Details: " + e.getMessage() + "</center>");
        }
                
                
                }
                }
                }       
                        
                    }
                    
                    
                    else{
                        out.println("<script>");
                out.println("alert('Status updated successfully!');");
                out.println("window.location.href = 'booking_dashboard.jsp';"); 
                out.println("</script>");
                    }
                
                
                
                }
        
            
            
            
            
            
            
            }
            
            
            
            catch(Exception e){
                out.println(e);
            }
        
        
        }
        
        
        else{
        response.sendRedirect("booking_dashboard.jsp");
        }
 }
}