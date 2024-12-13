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
            max-width: 1300px;
            margin: 0 auto;
            background-color: #2a2a2b;
            overflow-x: scroll;
        }


        .login_wrapper {

            width: 100%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            flex-direction: column;
            box-shadow:0 0rem 0.5rem #ff0000;
            color: rgb(255, 255, 255);
            z-index: 2;
            background-color:#2a2a2b;

        }

        .login_wrapper form {
            width: 370px;
            color:white;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding-left: 20px;
            background-color: rgb(0, 0, 0);
            padding-bottom: 0px;
            border-radius: 10px;
            box-shadow:0 0rem 0.5rem #ff0000;
        }

        .login_wrapper form h1 {
            padding: 10px;
            text-align: center;

        }

        .login_wrapper form table td {
            padding: 10px;
            text-align: center;
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

        .login_wrapper form button {
            font-size: 15px;
            width: 150px;
            margin-top: 10px;
            margin-bottom: 15px;
            padding-top: 15px;
            padding-bottom: 15px;
            border: none;
            border-radius: 15px;
            cursor: pointer;
        }

        .yes {
            background-color: greenyellow;
            color: black;
        }

        .no {
            background-color: red;
            color: white;
        }

    </style>
</head>
<%
                String bookingPara = request.getParameter("booking_id");
                int booking_id = Integer.parseInt(bookingPara);
%>
<body>
    <div class="login_wrapper" id="login_wrapper">
        <form action="changeStatusServlet?booking_id=<%= booking_id %>" method="post">
            <h1>Change Order <span style="color: red;">Status</span></h1>
            <table>
                <tr>
                    <td><label for=''>Pending</label></td>
                    <td><input type='radio'name='status'value='pending'></td>
                </tr>
                <tr>
                    <td><label for=''>Confiremed</label></td>
                    <td><input type='radio'name='status' value='confiremed'></td>
                </tr>
                
                <tr>
                    <td><label for=''>Checked In</label></td>
                    <td><input type='radio'name='status' value='Checked In'></td>
                </tr>
                
                <tr>
                    <td><label for=''>Checked Out</label></td>
                    <td><input type='radio'name='status' value='Checked Out'></td>
                </tr>

                <tr>
                <td><label for=''>Cancelled</label></td>
                    <td><input type='radio'name='status' value='cancelled'></td>
                </tr>
                
                <tr>
                <td><label for=''>Return</label></td>
                    <td><input type='radio'name='status' value='Return'></td>
                </tr>
                

                <tr>
                    <td colspan="2"> <label for="">Are you sure?</label></td>
                </tr>


                <tr>
                    <td colspan="4"><button type="submit" name="act" class="yes" value="yes">Yes</button></td>
                    <td colspan="4"><button type="submit" name="act" class="no" value="no">No</button></td>
                </tr>

            </table>

        </form>
    </div>

    

    <script>
        var close_admin_btn = document.getElementById("close");
        close_admin_btn.addEventListener("click", function () {
            history.back();

        }) 
    </script>
</body>

</html>