<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
     <%
       HttpSession session1 = request.getSession(false);
    
    
      if (session1 == null || session1.getAttribute("user_id") == null) {
       
        response.sendRedirect("admin_login.jsp");
    }
    
            
 %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>multiflex</title>
    <!-- MATERIAL CDN  -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp"
      rel="stylesheet">

      <style>
         @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');

/* ROOT VARIABLES  */
:root{
    --color-primary: #eb2b38;
    --color-danger: #ff7782;
    --color-success: #fb0000;
    --color-warning: #ffbb55;
    
    --color-info-dark: #7d8da1;
    --color-info-light: #2a2a2b;
    --color-dark: #363949;
    --color-light: rgba(132, 139, 200, 0.18);
    --color-primary-variant:#235e53;
    --color-dark-varient: #677483;


    --card-border-radious: 2rem;
    --border-radious-1: 0.4rem;
    --border-radious-2: 0.8rem;
    --border-radious-3: 1.2rem;

    --card-padding: 1.8rem;
    --padding-1: 1.2rem;

    --box-shadow: 0 2rem 3rem var(--color-light);

    --color-background:#181a1e;
    --color-white:#202528;
    --color-dark:#edeffd;
    --color-dark-varient:#a3bdcc;
    --color-light:rgba(0, 0, 0, 0.4);
    --box-shadow:0 2rem 3rem var(--color-light);

}

/* ---------dark theme variables--------- */
.dark-theme-variables{
    --color-background:#181a1e;
    --color-white:#202528;
    --color-dark:#edeffd;
    --color-dark-varient:#a3bdcc;
    --color-light:rgba(0, 0, 0, 0.4);
    --box-shadow:0 2rem 3rem var(--color-light);
}

*{
    margin: 0;
    padding: 0;
    outline: 0;
    appearance: none;
    border: 0;
    text-decoration: none;
    list-style: none;
    box-sizing: border-box;
}

html{
    font-size: 14px;
}

body{
    width: 100vw;
    height: 100vh;
    font-family: poppins,sans-serif;
    font-size: 0.88rem;
    background: var(--color-background);
    /* user-select: none; */
    overflow-x: hidden;
    color: var(--color-dark);
}

.container{
    display: grid;
    width: 96%;
    margin: 0 auto;
    gap: 1.8rem;
    grid-template-columns: 14rem auto 23rem;
}

a{
    color: var(--color-dark);
}

img{
    display: block;
    width: 100%;
}

h1{
    font-weight: 800;
    font-size: 1.8rem;
}

h2{
    font-size: 1.4rem;
}

h3{
    font-size: 0.87rem;
}

h4{
    font-size: 0.8rem;
}

h5{
    font-size: 0.77rem;
}

small{
    font-size: 0.75rem;
}

.profile-photo{
    width: 2.8rem;
    height: 2.8rem;
    border-radius: 50%;
    overflow: hidden;
}

.txt-center{
    text-align: center;
}

.text-muted{
    color: var(--color-info-dark);
}

p{
    color: var(--color-dark-varient);
}

b{
    color: var(--color-dark);
}

.primary{
    color: var(--color-primary);
}

.danger{
    color: var(--color-danger);
}

.success{
    color: var(--color-success);
}

.warning{
    color: var(--color-warning);
}

/* button  */
.submit{
    padding: 10px 20px;
    font-size: 15px;
    border-radius: var(--border-radious-1);
    font-weight: 600;
    color: #fff;
    background-color: var(--color-primary);
    cursor: pointer;
    transition: 300ms ease;
}

.submit:hover{
    background-color: #5a6aff;
}


/* ============ SIDE BAR ============= */
aside{
    height: 100vh;
}

aside .top{
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 1.4rem;

}

aside .close{
    display: none;
}

aside .sidebar{
    display: flex;
    flex-direction: column;
    height: 86vh;
    position: relative;
    top: 3rem;
}

aside h3{
    font-weight: 500;
}

aside .sidebar a{
    display: flex;
    color: var(--color-info-dark);
    margin-left: 2rem;
    gap: 1rem;
    align-items: center;
    position: relative;
    height: 3.7rem;
    transition: all 300ms ease;
}

aside .sidebar a span{
    font-size: 1.6rem;
    transition: all 300ms ease;
}

aside .sidebar a:last-child{
    position: absolute;
    bottom: 2rem;
    width: 100%;
}

aside .sidebar a.active{
    background: var(--color-light);
    color: var(--color-primary);
    margin-left: 0;
}

aside .sidebar a.active::before{
    content: "";
    width: 6px;
    height: 100%;
    background: var(--color-primary);
}

aside .sidebar a.active span{
    color: var(--color-primary);
    margin-left: calc(1rem - 3px);
}


aside .sidebar a:hover span{
    margin-left: 1rem;
}

aside .sidebar .message-count{
    background: var(--color-danger);
    color: var(--color-white);
    padding: 2px 10px;
    font-size: 11px;
    border-radius: var(--border-radious-1);
}


/* ============ MAIN ============= */

main{
    margin: 1.4rem;
}

main .insights{
   display: grid;
   grid-template-columns: repeat(3, 1fr);
   gap: 1.6rem;
}

main .insights > div{
    background: var(--color-white);
    padding: var(--card-padding);
    border-radius: var(--card-border-radious);
    margin-top: 1rem;
    box-shadow: var(--box-shadow);
    transition: all 300ms ease;
    user-select: none;
}

main .insights > div:hover{
    box-shadow: none;
}

main .insights > div span{
    background: var(--color-primary);
    padding: 0.5rem;
    border-radius: 50%;
    color: var(--color-white);
    font-size: 2rem;
}

main .insights > div.category span{
    background: var(--color-danger);
}

main .insights > div.income span{
    background: var(--color-success);
}

main .insights > div .middle {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

main .insights .progress{
    position: relative;
    width: 92px;
    height: 92px;
    border-radius: 50%;
}

main .insights svg{
    width: 7rem;
    height: 7rem;
}

main .insights svg circle{
    fill: none;
    stroke: var(--color-primary);
    stroke-width: 14px;
    stroke-linecap: round;
    transform: translate(5px, 5px);
    stroke-dasharray: 110;
    stroke-dashoffset: 92;
}

main .insights .product svg circle,
main .insights .category svg circle{
    stroke-dashoffset:0 ;
    stroke-dasharray: 250;
}

main .insights .progress .number{
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.income{
    min-width: 230px;
}

.income-card .left{
    margin: 0 auto;
    margin-top: 20px;
}

.income-card .left h2{
    color: var(--color-primary);
}


.number h3{
    font-size: 15px;
}

main .insights small{
    margin-top: 1.3rem;
    display: block;
}


main .recent-orders{
    margin-top: 1.6rem;
}

main .recent-orders h2{
    margin-bottom: 0.8rem;
}

/* table style for all pages  */
table{
    background: var(--color-white);
    width: 100%;
    border-radius: var(--card-border-radious);
    text-align: center;
}

td{
    transition: 200ms ease;
}

.recent-orders table{
    box-shadow: var(--box-shadow);
    padding: var(--card-padding);
}

table:hover{
    box-shadow: none;
}

table tbody td{
    text-align: center;
    height: 2.8rem;
    border-bottom: 1px solid var(--color-light);
}

table thead th{
    text-align: center;
}

table tbody tr:last-child td{
    border: none;
}

main .recent-orders a{
    text-align: center;
    display: block;
    margin: 1rem auto;
    color: var(--color-primary);
}


/* ============ RIGHT ============= */
.right{
    margin-top: 1.4rem;
}

.right .top{
    display: flex;
    justify-content: center;
    gap: 2rem;
}

.right .top button{
    display: none;
}

.right .theme-toggler{
    background: var(--color-light);
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 1.6rem;
    width: 4.2rem;
    cursor: pointer;
    border-radius: var(--border-radious-1);
}

.right .theme-toggler span{
    font-size: 1.2rem;
    width: 50%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.right .theme-toggler span.active{
    background: var(--color-primary);
    color: white;
    border-radius: var(--border-radious-1);
}

.right .top .profile{
    display: flex;
    gap: 2rem;
    text-align: right;
}

/* -----recent updates------- */
.right .recent-updates{
    margin-top: 1rem;
}

.right .recent-updates h2{
    margin-bottom: 0.8rem;
}

.right .recent-updates .updates{
    background: var(--color-white);
    padding: var(--card-padding);
    border-radius: var(--card-border-radious);
    box-shadow: var(--box-shadow);
    transition: all 300ms ease;
}

.right .recent-updates .updates:hover{
    box-shadow: none;
}

.right .recent-updates .updates .update{
    display: grid;
    grid-template-columns: 2.6rem auto;
    gap: 1rem;
    margin-bottom: 1rem;
}


/* -----sales analytics------- */
.right .sales-analytics{
    margin-top: 2rem;
}

.right .sales-analytics h2{
    margin-bottom: 0.8rem;
}

.right .sales-analytics .item{
    background: var(--color-white);
    display: flex;
    align-items: center;
    gap: 1rem;
    margin-bottom: 0.7rem;
    padding: 1.4rem var(--card-padding);
    border-radius: var(--border-radious-3);
    box-shadow: var(--box-shadow);
    transition: all 300ms ease;
}

.right .sales-analytics .item:hover{
    box-shadow: none;
}

.right .sales-analytics .item .right{
    display: flex;
    justify-content: space-between;
    align-items: start;
    margin: 0;
    width: 100%;
}

.right .sales-analytics .item .icon{
    padding: 0.6rem;
    color: var(--color-white);
    border-radius: 50%;
    display: flex;
}

.right .sales-analytics .item.online .icon{
    background: var(--color-primary);
}

.right .sales-analytics .item.offline .icon{
    background: var(--color-danger);
}

.right .sales-analytics .item.customers .icon{
    background: var(--color-success);
}

.right .sales-analytics .add-product{
    background-color: transparent;
    border: 2px dashed var(--color-primary);
    color: var(--color-primary);
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: none;
    transition: all 300ms ease;
}

.right .sales-analytics .add-product:hover{
    gap: 2rem;
    /* background: var(--color-primary);
    color: white; */
}



/* ========== MEDIA QUERY ========== */

/* for tablets */
@media screen and (max-width:1200px) {
    .container{
        width: 94%;
        grid-template-columns: 7rem auto 23rem;
    }
    
    aside .sidebar h3{
        display: none;
    }
    aside .sidebar a{
        width: 5.6rem;
    }
    aside .sidebar a:last-child{
        position: relative;
        margin-top: 1.8rem;
    }
    main .insights{
        grid-template-columns: 1fr;
        gap: 0;
    }
    main .recent-orders{
        width: 94%;
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        margin: 2rem 0 0 8.8rem;
    }

    main .recent-orders table{
        width: 80vw;
    }
    main table thead tr th:nth-child(2){
        display: none;
    }
    main table tbody tr td:nth-child(2){
        display: none;
    }
}

/* Define the hide-menu-animation */



/* for mobile phones */
@media screen and (max-width:768px){
    .container{
        width: 100%;
        grid-template-columns: 1fr;
    }
    aside{
        position: fixed;
        left: -100%;
        background: var(--color-white);
        width: 18rem;
        z-index: 3;
        box-shadow: 1rem 3rem 4rem var(--color-light);
        height: 100vh;
        padding-right: var(--card-padding);
        display: none;
        animation: showMenu 400ms ease forwards;
    }
    @keyframes showMenu {
        to{
            left: 0;
        }
    }


    aside .sidebar h3{
        display: inline;
    }
    aside .sidebar a{
        width: 100%;
        height: 3.4rem;
    }
    aside .sidebar a:last-child{
        position: absolute;
        bottom: 5rem;
    }
    aside .close{
        display: inline-block;
        cursor: pointer;
        position: absolute;
        right: 25px;
    }

    main{
        margin-top: 8rem;
        padding: 0 1rem;
    }
    main .recent-orders{
        position: relative;
        margin: 3rem 0 0 0;
        width: 100%;
    }
    main .recent-orders table{
        width: 100%;
        margin: 0;
    }
    .right{
        width: 94%;
        margin: 0 auto 4rem;
    }
    .right .top{
        position: fixed;
        top: 0;
        left: 0;
        align-items: center;
        justify-content: right;
        padding: 0 0.8rem;
        height: 4.6rem;
        background: var(--color-white);
        width: 100%;
        margin: 0;
        z-index: 2;
        box-shadow: 0 1rem 1rem var(--color-light);
    }
    .right .top .theme-toggler{
        width: 4.4rem;
        position: absolute;
        left: 66%;
    }
    .right .profile .info{
        display: none;
    }
    .right .top button{
        display: inline-block;
        background: transparent;
        cursor: pointer;
        color: var(--color-dark);
        position: absolute;
        left: 1rem;
    }
    .right .top button span{
        font-size: 2rem;
    }



    main table thead tr th:nth-child(2),
    main table thead tr th:nth-child(3),
    main table thead tr th:nth-child(4){
        display: none;
    }

    main table tbody tr td:nth-child(2),
    main table tbody tr td:nth-child(3),
    main table tbody tr td:nth-child(4){
        display: none;
    }

    main .recent-orders table{
        text-align: left;
    }
   
}






/* ADD PRODUCT PAGE DESIGN STARTS HERE  */
/* Input Fields */
input[type="text"],
input[type="email"],
input[type="password"],
input[type="number"],
textarea,
select {
  display: block;
  width: 100%;
  padding: 0.5rem;
  margin-bottom: 1rem;
  border: 1px solid var(--color-primary); /* Border color */
  border-radius: 4px;
  box-sizing: border-box;
  font-family: inherit;
  font-size: inherit;
  font-weight: 500; /* Font weight for the entered text */
  background-color: var(--color-background); /* Background color */
  color: var(--color-dark);
  caret-color: var(--color-primary); /* Color of the caret */
}
  
  /* Apply a different font weight to the placeholder text */
  input::placeholder {
    font-weight: 300; /* Font weight for the placeholder text */
  }
  

input[type="radio"] {
    appearance: auto;
  }  

/* Style for radio buttons */
input[type="radio"] {
    appearance: none; /* Hide the default radio button */
    width: 15px; /* Set the width of the custom radio button */
    height: 15px; /* Set the height of the custom radio button */
    border-radius: 50%; /* Make the custom radio button round */
    border: 2px solid var(--color-primary); /* Border color of the custom radio button */
    background-color: var(--color-background); /* Background color of the custom radio button */
  }
  
  /* Style for checked radio buttons */
  input[type="radio"]:checked {
    background-color: var(--color-primary); /* Background color of the checked radio button */
  }
  

input[type="radio"],
input[type="checkbox"] {
  display: inline-block;
  margin-right: 0.5rem;
}

textarea {
    resize: none; /* Disable resizing */
  }
  

/* Style for select element */
select {
    color:var(--color-dark); /* Font color for selected option */
  }

  
/* Style for labels if needed */
label {
  display: block;
  margin-bottom: 0.5rem;
  font-weight: bold;
}



.container2{
    display: grid;
    width: 96%;
    margin: 0 auto;
    gap: 1.8rem;
    grid-template-columns: 14rem auto;
}

.main-container .top{
    display: flex;
    justify-content: flex-end;
    margin-right: 50px;
}

.form-container{
    background: var(--color-white);
    margin-top: 30px;
    width: 95%;
    min-width: 400px;
    padding: 35px 5%;
    transform: translate(-50% -50%);
    left: 50%;
    top: 50%;
    border-radius: var(--card-border-radious);
    box-shadow: var(--box-shadow);
    margin-bottom: 30px;
}

.form-container h2{
    text-align: center;
}

.form-container p{
    position: relative;
    margin: auto;
    width: 100%;
    text-align: center;
}

.form-container form{
    width: 100%;
    position: relative;
    margin: 30px auto 0 auto;
}

.form-container .row{
    width: 100%;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px,1fr));
    grid-gap: 20px 30px;
    margin-bottom: 20px;
}



/* mobile responsiveness container2 */
@media screen and (max-width:768px){
    .form-container{
        margin-top: 100px;
        min-width: 90vw;
        margin-left: 8%;
        padding: 35px 20%;
    }
}

@media screen and (max-width:1200px){
    .container2 {
        grid-template-columns: 7rem auto;
    }
}

/* imge upload  */
.form-element {
    position: relative;
    width:150px;
    height:150px;
    box-shadow:var(--box-shadow);
    background-color: var(--color-background);
    border: 1px solid var(--color-primary);
  }
.form-element input {
    display:none;
  }
.form-element img {
    width:150px;
    height:150px;
    object-fit:cover;
    top: 0; /* Position from top */
    left: 0; /* Position from left */
    cursor: pointer;
  }
 .form-element div {
    position:absolute;
    height:40px;
    margin-top:-40px;
    background-color: rgba(115, 128, 236, 0.5);
    text-align:center;
    line-height:40px;
    font-size:13px;
    color:#fff;
    font-weight:600;
    width: 100%;
    overflow: hidden;
    bottom: 0;
    cursor: pointer;
}
 .form-element div span {
    font-size:40px;
  }

.img-row{
    display: flex;
    justify-content: space-between;
  }

.img-column{
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
}

.row .submit{
    margin-top: 20px;
}




/* MANAGE PRODUCTS PAGE DESIGN STARTS HERE  */
.table-header,
.table-pagination{
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    background-color: var(--color-background);
    border-radius: var(--border-radious-2);
}

.table-pagination{
    justify-content: center;
}

.table-pagination a{
    background-color: var(--color-primary);
    color: #fff;
    font-weight: 600;
    font-size: 13px;
    padding: 10px;
    border-radius: var(--border-radious-1);
    margin: 0 5px;
}

.table-pagination .arrow{
    padding: 8px 20px 3px 20px;
}

.table-pagination .muted{
    color: var(--color-dark-varient);
    border: 1px solid var(--color-primary);
    background: var(--color-background);
}

.table h3{
    font-size: 15px;
}

.table-section{
    padding: 20px 0;
    overflow-x: auto;
}

.table-section table{
    border-collapse: collapse;
}

.table-section .edit{
    color: var(--color-success);
    margin-right: 5px;
}

.table-section .delete{
    color: var(--color-danger);
}

table img{
    display: block;
    margin: 10px auto;
    width: 50px;
    height: 50px;
    border-radius: 10px;
    background-color: transparent;
   
}

.table-section td{
padding:5px 22px;
}

.order-table td{
    padding: 10px 10px;
}

.table-section td:last-child {
    white-space: nowrap; /* Keeps content of the last td in a single line */
    padding-right: 0;
}

.table-section td:first-child{
    padding-left: 10px;
}


.table-section tr:hover td{
    background-color: var(--color-background);
}

/* manage order select option  */
.order-filter {
    background-color: var(--color-primary);
    color: #fff;
    font-size: 15px;
    padding-left: 15px;
    margin-bottom: 0;
}

.order-filter option{
    background-color: var(--color-primary);
    color: #fff;
    padding:10px;
}





/* =======login form style========  */

.login-container {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    height: 100vh;
    background-color: #2d2d2d;
    padding: 0 20px; /* Added padding for spacing */
  }
  
  .login-info {
    flex: 1; /* Occupy remaining space */
    text-align: center;
  }
  
  .login-form {
    flex: 1; /* Occupy remaining space */
    background-color: #181818;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 0 10px  var(--color-success);;
    width: 100%; /* Initially take full width */
    max-width: 400px; /* Limiting the max-width */
    margin: 0 auto; /* Center the form horizontally */
  }
  
  .form-group {
    margin-bottom: 20px;
  }
  
  .form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
  }
  
  .form-group input {
    width: calc(100% - 20px); /* Subtract padding from width */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
  }
  

  @media screen and (max-width: 450px) {
    .login-form {
      max-width: 100%; /* Set back to full width on smaller screens */
    }
  }
  


  /* ========== update order page============ */

.update-order-tbl td{
    text-align: start;
}  

.update-order-tbl td:nth-child(1){
    width: 200px;
    font-weight: 600;
}


  .update-order-btn{
    margin-top: 30px;
  }

  .status-select{
    margin: 0;
    width: 150px;
  }

      </style>
</head>
<body>
    <%
try {

             Integer userId = (Integer) session1.getAttribute("user_id");
             String user_name = (String) session1.getAttribute("user_name");
                // Load MySQL Driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
               // Connect to Database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test1login", "root", "");
                
                
                String query1 = "SELECT * FROM users WHERE id = ?";
                PreparedStatement ps1 = conn.prepareStatement(query1);
                ps1.setInt(1,userId);
                
                ResultSet result = ps1.executeQuery();
                
                while(result.next()){
                   String first_name = result.getString("first_name");
                   String last_name = result.getString("last_name");
                   String email = result.getString("email");
                   int contact = result.getInt("contact");
        
  %>      <div class="login-container">
          <form action="user_updateServlet" method="POST" id="loginForm" class="login-form">
          <div class="login-info">
            <h2>Account</h2><br>

          </div>
          <br>
            <div class="form-group">
              <label for="username">First Name:</label>
              <input type="text" id="username" name="fname" placeholder="Enter first name" required value="<%= first_name %>">
            </div>
          <div class="form-group">
              <label for="username">Last Name:</label>
              <input type="text" id="username" name="lname" placeholder="Enter last name" required value="<%= last_name %>">
            </div>
          <div class="form-group">
              <label for="username">E Mail:</label>
              <input type="email" id="username" name="mail" placeholder="Enter email" required value="<%= email %>">
            </div>
            <div class="form-group">
              <label for="password">Password:</label>
              <input type="password" id="password" name="password" placeholder="Enter Password" required>
            </div>
          <div class="form-group">
              <label for="password">Contact Info:</label>
              <input type="number" id="password" name="info" placeholder="Enter phone number" required value="<%= contact %>">
            </div>
            <div class="login-info">
                
                <a href="home_page.jsp"class="submit"style="background-color: blue;">OK</a>
                <button type="submit" name="submit" class="submit">Update</button>
                
            </div>
          </form>
        </div>
<%       
                   
 
    }
}
            catch (Exception e) {
                out.println(e);
            }
%>            
        </body>
        </html>