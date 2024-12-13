<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
       HttpSession session1 = request.getSession(false);
    
    
      if (session1 == null || session1.getAttribute("user_id") == null) {
       
        response.sendRedirect("user_login.jsp");
    }
 %>
 
<!DOCTYPE html>
<html>
<head>
    <title>PayPal Payment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #0070ba;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #005bb5;
        }
    </style>
</head>
<body>
    <%
                  String total_para = request.getParameter("total");
                
                
                    int total = Integer.parseInt(total_para);
    %>
    <div class="container">
        <h2>Pay with PayPal</h2>
        <form action="PaymentServlet" method="get">
            <div class="form-group">
                <label for="amount">Amount (USD):</label>
                <input type="text" id="amount" name="total" required readoly value="<%= total %>">
            </div>
            <button type="submit" class="btn">Pay Now</button>
        </form>
    </div>
</body>
</html>