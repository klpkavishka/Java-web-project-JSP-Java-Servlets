<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
       HttpSession session1 = request.getSession(false);
    
    
      if (session1 == null || session1.getAttribute("user_id") == null) {
       
        response.sendRedirect("user_login.jsp");
    }
 %>
 
 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>multiflex</title>
    <style>
        * {
            margin: 0px;
            padding: 0px;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            margin: 0 auto;
            overflow-y:scroll;
            background:#222;
        }
        :root {
            --primary-color: white;
            --secondary-color: black;
            --third-color: #fac031;
            --fourth-color: rgba(255, 255, 255, 0.795);
            --bg-image: url("images/light_mode.png");
            --box-shadow: 0 0 10px rgb(112, 112, 112);
            --gradient1: white;
            --gradient2: white;
            --gradient3: white;
            --gradient4: white;
            --gradient5: white;
            --filter: white;
        }

        .order_container{
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            gap:20px;
            justify-content: center;
            padding-top: 20px;
            position:relative;
            top:80px;
        }
        .order_item{
            width: 650px;
            background-color:black;
            min-height: 370px;
            box-shadow: 0 0 0.5rem red;
            display: flex;
            flex-direction: row;
            border-radius: 10px;
            color: aliceblue;
        }
        .order_img{
            width:250px;
            height: 370px;
            display: flex;
            align-items: center;
            padding-left: 7px;
        }
        .order_img img{
            width: 100%;
        }
        .order_info{
            padding: 7px;
            display: flex;
            flex-direction: column;
        }
        .order_info table{
            width: 100%;
        }
        .order_info table td:nth-of-type(1){
            font-size: 12px;
            padding: 5px;
        }
        .order_info table td:nth-of-type(2){
            font-size: 12px;
            padding: 5px;
        }
        .order_info table tr:nth-of-type(6) td:nth-of-type(2){
            color: #02ff5b;
            font-weight: bold;
        }
        .order_info h2{}
        .order_info h2 span{
            color: var(--third-color);
            font-family: mv boli;
        }

       


@media (max-width: 1340px) {
    .footer-container{
        grid-template-columns: 1fr 1fr 1fr;
    }
    .qiuck-links{
        margin-left: 0;
    }
    .qiuck-links,
    .download-our-app{
        margin-top: 20px;
    }
    .download-app-images-container{
        display: flex;
        flex-direction: column;
    }
    .app_store{
        margin-bottom: 20px;
    }
}

@media (max-width: 928px) {
    .footer-container{
        grid-template-columns: 1fr 1fr;
    }
    .our-services{
        margin-top: 20px;
    }
    .qiuck-links{
        margin-left: 20px;
    }
    .our-services,
    .download-our-app{
        margin-left: 0;
    }
}

@media (max-width: 610px){
    .footer-container{
        grid-template-columns: 1fr;
    }
    .our-locations{
        margin-top: 20px;
    }
    .our-locations,
    .qiuck-links{
        margin-left: 0;
    }
    .footer-container-main{
        text-wrap: wrap;
    }
}

@media (max-width: 344px){
    .footer-container-main{
        padding: 10px;
    }
}

        /* responsive */
        @media  screen and (max-width:680px){
            .order_item{
            width: 450px;
            height: 570px;
            display: flex;
            flex-direction:column;
            align-items: center;
          }
           .order_info{
            align-items: center;
          }
                      .home {
                width: 100%;
                height: 320px;
            }
            /* navbar */
            .menu_list {
                display: none;
            }

            .login_section {
                display: none;
            }

            .hh {
                width: 0px;
            }

            nav .menu_list {
                display: none;
            }


            .login_section {
                display: none;
            }

            .first {
                width: 0px;
            }

            .second #cart {
                display: none;
            }

            .second #menu_btn {
                display: block;
            }
        }
        

        @media  screen and (max-width:480px){
            .order_item{
            width: 275px;
            height: 670px;
        }
        }

        .second tr th{
            text-align: left;
        }
 header:before{
  content:"";
  position:absolute;
  top:0;
  left:0;
  width:100%;
  height:100%;
}


header nav{
  color:#fff;
  display:flex;
  justify-content:space-between;
  align-items:center;
  padding:10px 100px;
  position:fixed;
  top:0;
  left:0;
  z-index:99;
  width:100%;
  background-color:white;
  
}


header nav .fa{
  cursor:pointer;
  display:none;
}


header nav .fa:hover{
  color:#DB0000;
}

.nav{
  background:#fff;
  color:#000;
  transition:background .5s;
  
}

.navBlack{
  background:#000;
  color:#fff;
  transition:background .5s;
  
}
nav ul li a{
    text-decoration:none;
    color:red;
    font-weight:bold;
}

header nav .logo{
  font-weight:700;
  font-size:1.5em;
}

header nav .logo span{
  color:#DB0000;
}

header nav ul .marker{
  background:#DB0000;
  width:40px;
  height:2px;
  position:absolute;
  bottom:-5px;
  left:0;
  border-radius:20px;
}


header nav ul{
  display:flex;
  justify-content:center;
  align-items:center;
  gap:20px;
  text-transform:uppercase;
  list-style:none;
  position:relative;
}


header nav ul li{
  cursor:pointer;
}


header nav ul li span{
  display:flex;
  gap:8px;
  align-items:center;
}

header nav ul li img{
  width:35px;
  height:35px;
  border-radius:50%;
  object-fit:cover;
}
/* Responsive Menu Icon */
#menu {
    display: none;
    font-size: 24px;
    color: white;
    cursor: pointer;
}

/* Responsive Styling */
@media screen and (max-width: 680px) {
    nav ul {
        display: none;
        flex-direction: column;
        background-color: #00000000;
        position: absolute;
        top: 60px;
        right: 0;
        width: 100%;
        border-top: 1px solid white;
    }

    nav ul.active {
        display: flex;
    }

    nav ul li {
        margin: 10px 0;
        text-align: center;
    }

    #menu {
        display: block;
    }
}

footer {
  background: #222;
  color: #fff;
  padding: 40px 100px;
  display: grid;
  grid-template-columns: auto auto auto;
  align-items: center;
}

footer .logo-box {
  font-size: 0.85em;
}

footer .logo-box .logo {
  font-size: 1.8em;
  font-weight: 700;
}

footer .logo-box .logo span {
  color: #DB0000;
}

footer ul {
  text-transform: uppercase;
  list-style: none;
  display: flex;
  justify-content: center;
  gap: 20px;
}

footer ul li {
  cursor: pointer;
  color: #888;
}

footer ul li:nth-child(1) {
  color: #fff;
}

footer ul li:hover {
  color: #fff;
}

footer .socail-box {
  display: flex;
  gap: 10px;
  justify-content: end;
}

footer .socail-box .fa {
  border: 2px solid #fff;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
}

footer .socail-box .fa:hover {
  background: #fff;
  color: #DB0000;
}

/* Footer Responsive Styles */
@media (min-width: 720px) and (max-width: 1023px) {
  footer {
    padding: 40px 50px;
    grid-template-columns: auto;
    justify-content: center;
    align-items: center;
    gap: 30px;
  }
}

@media (min-width: 0px) and (max-width: 719px) {
  footer {
    padding: 40px 20px;
    grid-template-columns: auto;
    justify-content: center;
    align-items: center;
    gap: 30px;
    font-size: 0.85em;
  }
}

    </style>
</head>

<body>
    <header>
    <nav>
    <p class="logo" id="logo">
        <span style="color: black;"> <span style="color:black;">multi</span><span>flex</span>
    </p>
      
      <i class="fa fa-bars" id="menu"></i>
      
    <ul id="menu-box">
      <div class="marker"></div>
      <li><a href="home_page.jsp">Main</a></li>
      
     <%
       
    String x;
    String link;
    String link1;
    String u_name;
    String account_link;
    String account_link1;
    
      if (session1 == null || session1.getAttribute("user_id") == null) {
        x = "Login"; 
        link = "user_login.jsp";
        account_link = "user_login.jsp";
        link1 = "user_login.jsp";
        u_name = "";
    }
    else{
          
    Integer userId = (Integer) session1.getAttribute("user_id");
    String user_name = (String) session1.getAttribute("user_name");
     x = "Logout"; 
     link = "userLogout";
     link1 = "order.jsp";
     account_link = "user_account.jsp";
     u_name = "Account";
          }
    
    %>
    
       <li><b><a href="<%= link1 %>">Bookings</b></a></li>
<li><a href="<%= account_link %>">Account</a></li>
      <li><b><a href="<%= link %>"><%= x %></b></a></li>
    </ul>
      
  </nav>
    </header>
<%
 try{
          
             Integer userId = (Integer) session1.getAttribute("user_id");
             String user_name = (String) session1.getAttribute("user_name");
         

                // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String query = "SELECT * FROM booking WHERE user_id = ? ";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setInt(1, userId);
                
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){
                
                int booking_ID = rs.getInt("booking_id");
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
                      
                
                          
                
                
%>
                



    <div class="order_container" id="order_container">

 
        <div class='order_item'>
            <div class='order_img'>
                <img src=<%= request.getContextPath() + "/"+image %> >
            </div>
            <div class='order_info'>
                <h2>Booking <span>Details</span></h2>
                <table>
                    <tr>
                        <td><h3>Booking no :</h3></td>
                        <td><label ><%= booking_ID%></label></td>
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
                        <td><label >0769754966</label></td>
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
                           ps2.setInt(1, booking_ID);
         
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
                    <a href="bookingCancelServlet?booking_id=<%= booking_ID%>" style="text-decoration: none; color: white; background-color: red;width: 80px;text-align: center;border-radius: 25px;padding: 10px;">Cancel</a>
            
            </div>
        </div>


    </div>
<%
   
    }
    }

    
    }
    catch(Exception e){
      out.println(e);
    
    }

%>

</body>
</html>