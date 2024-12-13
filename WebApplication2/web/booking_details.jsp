<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>multiflex</title>
    <link rel="stylesheet" href="customer.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');


        * {
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
        }

        body {
            font-family: 'poppins', sans-serif;
            width: 98%;
            margin: 0 auto;
            background-color: rgb(54, 53, 53);
        }


        .login_wrapper {

            width: 100vw;
            position: fixed;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            
            z-index: 2;
            font-size: 15px;

        }

        .login_wrapper form {
            width: 550px;
            margin-top: 50px;
            min-height: 600px;
            color: rgb(255, 255, 255);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding-left: 20px;
            background-color: rgb(0, 0, 0);
            padding-bottom: 0px;
            border-radius: 10px;
            box-shadow:0 0rem 0.5rem #ff0000;
            padding-bottom: 20px;
        }

        .login_wrapper form h1 {
            padding: 8px;
            text-align: center;

        }

        .login_wrapper form table td {
            padding: 3px;
        }

        .login_wrapper form label {
            padding-top: 10px;
        }

        .login_wrapper form p {
            padding-top: 15px;
            padding-left: 80%;

        }

        #close {
            cursor: pointer;
        }

        .login_wrapper form input[type="text"],input[type="password"],input[type="email"]{
            width: 300px;
            height: 30px;
            border: 1px solid #fac031;
        }

        .login_wrapper form button {
            font-size: 12px;
            width: 100px;
            margin-top: 10px;
            margin-bottom: 15px;
            padding-top: 12px;
            padding-bottom: 12px;
            border: none;
            background-color: #ff0000;
            color: white;
            border-radius: 15px;
            cursor: pointer;
        }


        h1 span{
            color: #ff0000;
           
            font-family: mv boli;
        }
        @media screen and (max-width:580px){
            .login_wrapper form {
                width: 450px;
            }
        }
        @media screen and (max-width:480px){
            .login_wrapper form {
                width: 350px;
            }
        }
        .second tr th{
            text-align: left;
        }
    </style>
</head>

<body>
<%
 try{
                // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String bookingPara = request.getParameter("booking_id");
                int booking_id = Integer.parseInt(bookingPara);
                
                String query = "SELECT * FROM booking WHERE booking_id = ? ";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, booking_id);
                
                ResultSet rs = ps.executeQuery();
                
                if(rs.next()){
                
                int user_id = rs.getInt("user_id");
                int movie_ID = rs.getInt("movie_id");
                int full_qty = rs.getInt("quantity");
                int total = rs.getInt("total");
                String transaction_date = rs.getString("booking_date");
                String status = rs.getString("status");


                      String query1 = "SELECT * FROM movie WHERE movie_id = ? ";
                      PreparedStatement ps1 = conn.prepareStatement(query1);
                      ps1.setInt(1, movie_ID);
         
                      ResultSet rs1 = ps1.executeQuery();
                      if(rs1.next()){
                
                           String movie_date = rs1.getString("date");
                           String movie_time = rs1.getString("time");
                           String movie_name = rs1.getString("name");
                           String image = rs1.getString("image");
                           

                             String query0 = "SELECT * FROM users WHERE id = ? ";
                             PreparedStatement ps0 = conn.prepareStatement(query0);
                             ps0.setInt(1, user_id);
         
                      ResultSet rs0 = ps0.executeQuery();
                      if(rs0.next()){
                
                           String first_name = rs0.getString("first_name");
                           String last_name = rs0.getString("last_name");
                           String email = rs0.getString("email");
                           int contact = rs0.getInt("contact");
                
%>
   
    <div class="login_wrapper" id="login_wrapper">
        <form action="booking_dashboard.jsp" method="post">
            
            <h1>Booking <span>Details</span></h1>
                
            <table>
                <tr>
                    <td><h3>Booking no :</h3></td>
                    <td><label ><%= booking_id%></label></td>
                </tr>
                <tr>
                    <td><h3>Full Name :</h3></td>
                    <td><label ><%= first_name%>  <%= last_name%></label></td>
                </tr>
                <tr>
                    <td><h3>Email :</h3></td>
                    <td><label ><%= email%></label></td>
                </tr>
                <tr>
                    <td><h3>Movie name :</h3></td>
                    <td><label ><%= movie_name%></label></td>
                </tr>
                <tr>
                    <td><h3>Movie Date :</h3></td>
                    <td><label ><%= movie_date%> / <%= movie_time%></label></td>
                </tr>
                <tr>
                    <td ><h3>Ticket Count:</h3></td>
                    <td><label ><%= full_qty%></label></td>
                </tr>
                <tr>
                    <td><h3>Total :</h3></td>
                    <td><label ><%= total %></label></td>
                </tr>
                <tr>
                    <td><h3>Booking status :</h3></td>
                    <td><label ><%= status %></label></td>
                </tr>
                <tr>
                    <td><h3>Payment method :</h3></td>
                    <td><label >card</label></td>
                </tr>
                <tr>
                    <td><h3>Contact:</h3></td>
                    <td><label ><%= full_qty%></label></td>
                </tr>
                <tr>
                    <td><h3>transaction_date</h3></td>
                    <td><label ><%= transaction_date %></label></td>
                </tr>
            </table>

            <table class="second" border="2">
                
                
                <tr>
                    <th>Ticket Type</th>
                    <th>Count</th>
                </tr>
                <%
                        
                        
                           String query2 = "SELECT * FROM booking_item WHERE booking_id = ? ";
                           PreparedStatement ps2 = conn.prepareStatement(query2);
                           ps2.setInt(1, booking_id);
         
                             ResultSet rs2 = ps2.executeQuery();
                             while(rs2.next()){
                
                
                              int ticket_id = rs2.getInt("ticket_id");
                              int ticket_count = rs2.getInt("quantity");
                              int booking_item_id = rs2.getInt("booking_id");
                
                              String query3 = "SELECT * FROM tickets WHERE id = ? ";
                              PreparedStatement ps3 = conn.prepareStatement(query3);
                              ps3.setInt(1, ticket_id);
         
                              ResultSet rs3 = ps3.executeQuery();
                              if(rs3.next()){
                                   String ticket_name = rs3.getString("type");
                    
                    %>
                    <tr>
                        <td><h3><%= ticket_name %></h3></td>
                        <td><label ><%= ticket_count %></label></td>
                    </tr>
                    <%
                        }
    
                          }
                    %>
            </table>
            <button type='submit' name='ok'>OK</button>
        </form>
    </div>
            <%
                }
    }
    }

    
    }
    catch(Exception e){
      out.println(e);
    
    }

%>
</body>

</html>