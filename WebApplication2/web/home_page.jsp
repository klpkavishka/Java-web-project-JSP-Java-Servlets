<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>multiflex</title>
        <style>

*{
  margin:0;
  padding:0;
  box-sizing:border-box;
  transition:all .2s;
}


body{
  font-family: 'Roboto', sans-serif;
  overflow:hidden;
  overflow-y:scroll;
  background:rgba(0,0,0,.75);
}

               <%
                try {
                // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String card_id_para = request.getParameter("card_id");
                String query1;
                PreparedStatement ps1;
                 if(card_id_para == null){
                    query1 = "SELECT * FROM movie LIMIT 1";
                    ps1 = conn.prepareStatement(query1);
                   }
                   else{
                   int card_id = Integer.parseInt(card_id_para);
                    query1 = "SELECT * FROM movie WHERE movie_id = ?";
                    ps1 = conn.prepareStatement(query1);
                    ps1.setInt(1, card_id);
                   }
                    ResultSet result = ps1.executeQuery();
                
                    while(result.next()){
                    String image = result.getString("bgimage"); 
%>
header{
  background:url(<%= request.getContextPath() + "/"+image %>);
  background-size:cover;
  background-position:center;
  width:100%;
  height:550px;
  position:relative;
  padding-top:80px;
}


<%
    }}        
 
            
            catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
            %>   
       
header:before{
  content:"";
  position:absolute;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0,0,0,.75);
  box-shadow:inset 0 0 80px #000;
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


header .popular-movie-slider{
  color:#fff;
  display:flex;
  justify-content:center;
  align-items:start;
  gap:35px;
  padding:10px 100px;
  position:relative;
}

header .popular-movie-slider .poster{
  width:300px;
  height:400px;
  object-fit:cover;
  border-radius:10px;
}


header .popular-movie-slider .popular-movie-slider-content{
  line-height:25px;
}

header .popular-movie-slider .popular-movie-slider-content .movie-name{
  font-size:1.8em;
}


header .popular-movie-slider .popular-movie-slider-content .category{
  display:flex;
  gap:30px;
  text-transform:capitalize;
  margin:10px 0;
}

header .popular-movie-slider .popular-movie-slider-content .desc{
  font-size:.90em;
}

header .popular-movie-slider .popular-movie-slider-content .movie-info{
  display:flex;
  gap:30px;
  margin:25px 0;
}

header .popular-movie-slider .popular-movie-slider-content .movie-info .fa-circle{
  color:#DB0000; 
  font-size:.85em;
}

header .popular-movie-slider .popular-movie-slider-content .movie-info .fa span{
  font-family: 'Roboto', sans-serif;
  color:#fff;
  font-size:15px;
}


header .popular-movie-slider .popular-movie-slider-content .movie-btns{
  display:flex;
  gap:10px;
}


header .popular-movie-slider .popular-movie-slider-content .movie-btns button{
  width:200px;
  border:none;
  outline:none;
  padding:15px 0;
  border-radius:100px;
  font-size:1em;
  background:#DB0000;
  color:#fff;
  cursor:pointer;
  display:flex;
  justify-content:center;
  align-items:center;
  gap:2px;
}

header .popular-movie-slider .popular-movie-slider-content .movie-btns button .fa{
  font-size:.65em;
  color:#fff;
}


header .popular-movie-slider .popular-movie-slider-content .movie-btns .read-more{
  background:none;
}

header .popular-movie-slider .popular-movie-slider-content .movie-btns .read-more:hover{
  background:#000;
}

header .popular-movie-slider .popular-movie-slider-content .movie-btns button:hover{
  background:#000;
}


section .movie-ticket-book{
  background:#222;
  color:#fff;
  display:grid;
  grid-template-columns: auto auto auto;
  justify-content:space-between;
  align-items:center;
  padding:30px 100px;
}


section .movie-ticket-book .choose-date ,
section .movie-ticket-book .choose-time {
  position:relative
}

section .movie-ticket-book .choose-date .heading,
section .movie-ticket-book .choose-time .heading{
  text-transform:uppercase;
  font-weight:400;
}

section .movie-ticket-book .choose-date .wrapper,
section .movie-ticket-book .choose-time .wrapper{
  width: 300px;
}
section .movie-ticket-book .choose-date .carousel,
section .movie-ticket-book .choose-time .carousel{
  margin-top:15px;
  display:flex;
  justify-content:center;
  align-item:center;
  padding:10px 0;
}

section .movie-ticket-book .choose-date .carousel .owl-nav,
section .movie-ticket-book .choose-time .carousel
.owl-nav{
  color:#DB0000;
  position:absolute;
  width:99%;
  top:50%;
  left:-15px;
  transform:translate(0,-50%);
  font-size:1.5em;
  display:flex;
  justify-content:space-between;
}


section .movie-ticket-book .choose-date .carousel .card p:nth-child(1),
section .movie-ticket-book .choose-time .carousel .card p:nth-child(1){
  color:#888;
  font-size:.75em;
}


section .movie-ticket-book .choose-date .carousel .card p:nth-child(2),
section .movie-ticket-book .choose-time .carousel .card p:nth-child(2){
  color:#fff;
  font-size:1.2em;
  text-transform:uppercase;
}


section .movie-ticket-book .choose-date .wrapper .marker,
section .movie-ticket-book .choose-time .wrapper .marker{
  width:60px;
  height:2px;
  background:#DB0000;
  position:absolute;
  left:45%;
  transform:translate(-50%,0);
}



section .movie-ticket-book button{
  border:none;
  outline:none;
  height:50px;
  background:#DB0000;
  color:#fff;
  border-radius:50px;
  padding:10px 50px;
  cursor:pointer;
}

section .movie-ticket-book button:hover{
  background:#000;
}




section .filter-search-box{
  background:#111;
  display:flex;
  justify-content:space-between;
  align-items:center;
  padding:20px 100px;
  padding-top:50px;
  position:relative;
}


section .filter-search-box .filters-box{
  display:flex;
  gap:50px;
  color:#fff;
}



section .filter-search-box .filters-box .filters{
  cursor:pointer;
}


section .filter-search-box .search-bar{
  position:absolute;
  bottom:0;
  left:100px;
  width:83%;
  height:2px;
  background:#fff;
  border-radius:50px;
  overflow:hidden;
}

section .filter-search-box .search-bar .bar{
  width:10%;
  height:inherit;
  background:#DB0000;
}


section .filter-search-box .search-filters{
  color:#fff;
}

section .filter-search-box .search-filters input{
  border:none;
  outline:none;
  width:200px;
  padding:5px 10px;
  background:none;
  color:#fff;
  font-family: 'Roboto', sans-serif;
  font-size:1em;

}




section .movie-card-section{
  background:#111;
  padding:20px 100px;
  width:100%;
  display: grid;
  grid-template-columns:auto auto auto auto;
  gap:18px;
  padding-top:50px;
}


section .movie-card-section .card{
  margin-bottom:20px;
  color:#fff;
  text-transform:uppercase;
}

section .movie-card-section .card img{
  width:100%;
  height:350px;
  object-fit:cover;
  border-radius:10px;
  box-shadow:0 0 30px #000;
}


section .movie-card-section .card .card-content .movie-name{
  font-weight:700;
  margin-top:10px;
}

section .movie-card-section .card .card-content .movie-info{
  font-size:.95em;
  margin-top:10px;
}


section .movie-card-section .card .card-content .movie-info span{
  color:#666;
}

section .movie-card-section .card .card-content .movie-info .d3{
  background:#DB0000;
  border-radius:50%;
  font-size:.50em;
  color:#fff;
  padding:3px;
  margin-left:3px;
}


section .show{
  display:flex;
  justify-content:space-between;
  align-items:center;
  gap:20px;
  width:100%;
  background:#111;
  padding:10px 100px;
  padding-bottom:40px;
}


section .show .show-bar{
  background:#fff;
  width:100%;
  height:3px;
  border-radius:50px;
  overflow:hidden;
}

section .show .show-bar .bar{
  width:10%;
  height:inherit;
  background:#DB0000;
  border-radius:50px;
}


section  .show button{
  border:none;
  outline:none;
  width:250px;
  padding:15px 0;
  font-size:1em;
  border-radius:50px;
  background:#DB0000;
  color:#fff;
  cursor:pointer;
}


section  .show button:hover{
  background:#000;
}


footer{
  background:#222;
  color:#fff;
  padding:40px 100px;
  display: grid;
  grid-template-columns:auto auto auto;
  align-items:center;
}


footer .logo-box{
  font-size:.85em;
}


footer .logo-box .logo{
  font-size:1.8em;
  font-weight:700;
}

footer .logo-box .logo span{
    color:#DB0000;
}



footer ul {
  text-transform:uppercase;
  list-style:none;
  display:flex;
  justify-content:center;
  gap:20px;
}


footer ul li{
  cursor:pointer;
  color:#888;
}


footer ul li:nth-child(1){
  color:#fff;
}

footer ul li:hover{
  color:#fff;
}


footer .socail-box{
  display:flex;
  gap:10px;
  justify-content:end;
}

footer .socail-box .fa{
  border:2px solid #fff;
  border-radius:50%;
  width:40px;
  height:40px;
  display:flex;
  justify-content:center;
  align-items:center;
  cursor:pointer;
}

footer .socail-box .fa:hover{
  background:#fff;
  color:#DB0000;
}





@media (min-width: 1024px) and (max-width: 1080px) {
  
  section .movie-card-section{
  grid-template-columns:auto auto auto;
  gap:15px;
}
  
  
}





@media (min-width: 720px) and (max-width: 1023px) {
  
  header nav ul{
    display:none;
    position:absolute;
    right:0;
    top:40px;
    color:#fff;
    background:#000;
    width:100%;
    height:100vh;
    padding:20px 30px;
  }
  
  header nav .fa{
  cursor:pointer;
  display:block;
}
  
  
header .popular-movie-slider{
  padding:10px 50px;
}

header .popular-movie-slider .poster{
  width:250px;
  height:300px;
}
  


section .movie-ticket-book{
  grid-template-columns: auto;
  justify-content:center;
  align-items:center;
  padding:30px 50px;
}
  
  

  
  
section .movie-ticket-book .choose-date .wrapper,
section .movie-ticket-book .choose-time .wrapper{
  width: 30%;
  position:relative;
  left:50%;
  transform:translate(-50%,0);
}
section .movie-ticket-book .choose-date .carousel,
section .movie-ticket-book .choose-time .carousel{
  margin-top:15px;
  display:flex;
  justify-content:center;
  align-item:center;
  padding:10px 0;
}

section .movie-ticket-book .choose-date .carousel .owl-nav,
section .movie-ticket-book .choose-time .carousel
.owl-nav{
  color:#DB0000;
  position:absolute;
  width:110%;
  top:50%;
  left:-50%;
  transform:translate(0%,-50%);
  font-size:1.5em;
  display:flex;
  justify-content:space-between;
}



section .movie-ticket-book .choose-date .wrapper .marker,
section .movie-ticket-book .choose-time .wrapper .marker{
  width:60px;
  height:2px;
  background:#DB0000;
  position:absolute;
  left:45%;
  transform:translate(-50%,0);
}



section .movie-ticket-book button{
  width:20%;
  margin-top:20px;
  position:relative;
  left:50%;
  transform:translate(-50%,0);
}

  
 section .filter-search-box{
  padding:20px 50px;
}


section .filter-search-box .filters-box{
  gap:10px;
}
  
  
  
 
section .filter-search-box .search-bar{
  left:50px;
  width:85%;
}

 
section .movie-card-section{
  padding:20px 50px;
  grid-template-columns:auto auto auto;
}
  

section .movie-card-section .card img{
  width:100%;
  height:300px;
}


 
section .show{
  padding:10px 50px;
  padding-bottom:40px;
}
  
  
  
footer{
  padding:40px 50px;
  grid-template-columns:auto;
  justify-content:center;
  align-items:center;
  gap:30px;
}
  
  
}



@media (min-width: 0px) and (max-width: 719px) {
  
  
  header {
    height:auto;
    padding-bottom:30px;
  }
  header nav{
    padding:10px 20px;  
  }
  
  
  header nav ul{
    display:none;
    position:absolute;
    right:0;
    top:40px;
    color:#fff;
    background:#000;
    width:100%;
    height:100vh;
    padding:20px 30px;
  }
  
  header nav .fa{
  cursor:pointer;
  display:block;
}
  
  
header .popular-movie-slider{
  padding:10px 20px;
  display:block;
}

header .popular-movie-slider .poster{
  width:100%;
  height:300px;
  margin-bottom:20px;
}
  


section .movie-ticket-book{
  grid-template-columns: auto;
  justify-content:center;
  align-items:center;
  padding:30px 20px;
}
  
  

  

  
 section .filter-search-box{
  padding:20px 20px;
}


section .filter-search-box .filters-box{
  gap:10px;
}
  
  
  
 
section .filter-search-box .search-bar{
  left:20px;
  width:90%;
}

 
section .movie-card-section{
  padding:20px 20px;
  grid-template-columns:auto auto;
}
  

section .movie-card-section .card img{
  width:100%;
  height:300px;
}


 
section .show{
  padding:10px 20px;
  padding-bottom:40px;
}
  
  
  
footer{
  padding:40px 20px;
  grid-template-columns:auto;
  justify-content:center;
  align-items:center;
  gap:30px;
  font-size:.85em;
}
  
  
 section .filter-search-box{
  gap:20px;
  overflow-x:scroll;
}
  
  
 section .filter-search-box::-webkit-scrollbar {
  display: none;
}
  
  
section .filter-search-box .search-filters input{
  width:50px;
  padding:5px 10px;
}

  
  section .movie-ticket-book{
    padding:30px 0px;
  }
  
section .movie-ticket-book button{
 margin-top:10px;
}
  
}
        </style>
    </head>
    <body>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


 <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">


<header>
    <nav>
    <p class="logo" id="logo">
        <span style="color: black;"> multi<span><span>flex</span>
    </p>
      
      <i class="fa fa-bars" id="menu"></i>
      
    <ul id="menu-box">
      <div class="marker"></div>
      <li><a href="home_page.jsp">Main</a></li>
      
     <%
       HttpSession session1 = request.getSession(false);
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
               <%
                try {
                // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String card_id_para = request.getParameter("card_id");
                
                String query1;
                PreparedStatement ps1;
                 if(card_id_para == null){
                    query1 = "SELECT * FROM movie LIMIT 1";
                    ps1 = conn.prepareStatement(query1);
                   }
                   else{
                    int card_id = Integer.parseInt(card_id_para);
                    query1 = "SELECT * FROM movie WHERE movie_id = ?";
                    ps1 = conn.prepareStatement(query1);
                    ps1.setInt(1, card_id);
                   }
                    ResultSet result = ps1.executeQuery();
                
                
                while(result.next()){
                String image = result.getString("image");
                String trailer = result.getString("trailer");
                String name = result.getString("name");
                String title = result.getString("title");
                String date = result.getString("date");
                String release = result.getString("release_date");
                String description = result.getString("description");
                String duration = result.getString("duration");
                String imdb = result.getString("imdb");
                String movie_id = result.getString("movie_id");
                String time = result.getString("time");

%>  
    <div class="popular-movie-slider">
      
      <img src=<%= request.getContextPath() + "/"+image %> class="poster">
      
      <div class="popular-movie-slider-content">
        <p class="release"><%= release %></p>
        <h2 class="movie-name"><%= name %></h2>
        <ul class="category">
          <p><%= title %></p>
        </ul>
        <p class="desc"><%= description %></p>
        
        <div class="movie-info">
          <i class="fa fa-clock-o"> &nbsp;&nbsp;&nbsp;<span><%= duration %> min.</span></i> 
          <i class="fa fa-circle"> &nbsp;&nbsp;&nbsp;<span>Imdb: <b><%= imdb %>/10</b></span></i>
        </div>
        
        <div class="movie-btns">
            <a href="<%= trailer %>" style="text-decoration: none;"> <button><i class="fa fa-play"></i>&nbsp; Watch trailer</button></a>
          </div>
        
      </div>
      
    </div>
   
    
</header>

<section>
  
  <div class="movie-ticket-book">
    <div class="choose-date">
      <p class="heading">
        Date And Time :<%= date %> / <%= time %>
      </p>
       <div class="wrapper">
      </div>
    </div>
      <a href="booking.jsp?movie_id=<%= movie_id %>"><button>Buy ticket</button></a>
  </div>
 
  
 <%
                   }
 
            }
            catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
            %>  
  <div class="filter-search-box">
    
    <div class="filters-box">
      
      <div class="all-filters filters">
        All formats <i class="fa fa-angle-down"></i>
      </div> 
      
      <div class="date-filters filters">
       By Date <i class="fa fa-angle-down"></i>
      </div> 
      
      <div class="category-filters filters">
        By category <i class="fa fa-angle-down"></i>
      </div> 
      
      <div class="category-filters filters">
        Coming soon
      </div> 
      
    </div>
    
    <div class="search-filters">
        <input type="text" placeholder="Search by name...">
        <i class="fa fa-search"></i>
      </div> 
    
    <div class="search-bar">
      <div class="bar"></div>
    </div>
    
  </div>

  
  
  <div class="movie-card-section">
    
 <%
                try {
                // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                String card_id = request.getParameter("card_id");
                String query1;
                PreparedStatement ps1;
                 
                    query1 = "SELECT * FROM movie";
                    ps1 = conn.prepareStatement(query1);

                    ResultSet result = ps1.executeQuery();
                
                
                while(result.next()){
                String image = result.getString("image");
                String name = result.getString("name");
                String date = result.getString("date");
                String time = result.getString("time");
                String id = result.getString("movie_id");
    
  %>
  <a href="home_page.jsp?card_id=<%=id%>" style="text-decoration: none;">   
  <div class="card">
      <img src=<%= request.getContextPath() + "/"+image %>>
      
      <div class="card-content">
        <p class="movie-name">
          <%= name %>
        </p>
        
        <div class="movie-info">
          <p class="time"><span class="d3"></span> <span><%= date %><span class="d3"></span></span> <%= time %></p>
        </div>
      </div>
    </div>
 </a>     
    
 <%
                   }
 
            }
            catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
  %>   
    
   
    
  </div>
  
  
  <div class="show">
    <div class="show-bar">
      <div class="bar"></div>
    </div>
     <button>Show more</button>
  </div>
    
  
  
</section>
<div style="margin: 20px; max-width: 500px;display: block;">
        <h1 style="font-family: Arial, sans-serif;color: #ccc;">Add a Comment</h1>
        <%
        Integer userId = (Integer) session1.getAttribute("user_id");
        %>
        <form action="submitCommentServlet?user_id=<%= userId %>" method="post">
            <input 
                name="comment" 
                rows="5" 
                style="width: 100%; padding: 10px; font-size: 16px; border: 1px solid #fe0000; border-radius: 5px;background-color: #000;color: #ccc;" 
                placeholder="Write your comment here..." 
                required>
            <button 
                type="submit" 
                style="margin-top: 10px; padding: 10px 20px; font-size: 16px; color: #fff; background-color: #ff000d; border: none; border-radius: 5px; cursor: pointer;">
                Submit
            </button>
        </form>
    </div>
<footer>
  
  <div class="logo-box">
    <p class="logo">
      multi<span>flex</span>
    </p>
    <p><i class="fa fa-copyright"></i> 2001-2017, SIA Multiflex</p>
  </div>
  
  <ul>
      <li><a href="#logo" style="color: gray; text-decoration: none;">main</a></li>
    <li>schedlues</li>
    <li>tickets</li>
    <li>news</li>
    <li>contact</li>
  </ul>


<div class="socail-box">
  <i class="fa fa-facebook-f"></i>
  <i class="fa fa-twitter"></i>
  <i class="fa fa-instagram"></i>
</div>
  
</footer>

<script>
   


let marker = document.querySelector('.marker');
let items = document.querySelectorAll('nav ul li');


function indicator(e){
  marker.style.left = e.offsetLeft + "px";
  marker.style.width = e.offsetWidth + "px";
}

items.forEach(link =>{
  link.addEventListener("click",(e)=>{
    indicator(e.target);
  });
});



let nav = document.querySelector('nav');
let ul = document.querySelector('nav ul');
let link = document.querySelectorAll('nav ul li a');

window.addEventListener("scroll",()=>{
  if(window.pageYOffset >= 20){
    //nav.classList.add('navBlack');
    
  }else{
    //nav.classList.remove('nav');
    //link.classList.remove('nav');
  }
  
    if(window.pageYOffset >= 700){
    //nav.classList.add('navBlack');
  }else{
    //nav.classList.remove('navBlack');
  }
});



//menu
let menu = document.querySelector('#menu');
let menuBx = document.querySelector('#menu-box');
let a = true;

menu.addEventListener("click",()=>{
  
  if(a == true){
    menuBx.style.display = "block";
    menu.classList.replace("fa-bars","fa-remove");
    a = false;
  }else{
    menuBx.style.display = "none";
    menu.classList.replace("fa-remove","fa-bars");
    a = true;
  }
  
});



</script>

    </body>
</html>