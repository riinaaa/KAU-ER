<%-- 
    Document   : login
    Created on : Mar 26, 2021, 7:41:04 PM
    Author     : myonl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> LOGIN </title>

        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/login.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>

    <body>

        <div class="home-header">

            <div class="logo">
                <img src="../images/logo.png" alt="">

            </div>

            <div class="sub-logo">
                <span> KAUH</span>

            </div>
            <ul class="nav-area">

                <li> <a href="#"> Admins</a></li>
                <li> <a href="#"> Doctors</a></li>
                <li> <a href="#"> Nurses </a></li>
                <li> <a href="#"> Support </a></li>

            </ul>

        </div> <!-- end of nav -->

    <div class="main">

        <div class="icon-format">
            <img src="../images/userIcon.png" alt="" width="100" height="100">
        </div>

        <div class="page-title">

            <h1> Log in</h1>

        </div>

        <form action="login_DB.jsp" method="POST">
            
            <div class="login-form">

                <div class="input-icons">
                    
                    <!--phone number field-->
                    <i class="fa fa-user icon"></i>
                    <input class="input-field" type="text" placeholder="Enter your phone number" name="phoneNumber">
                    
                    <!--password field-->
                    <i class="fa fa-key icon"></i>
                    <input class="input-field" type="password" placeholder=" Enter your password " name="password">

                </div>

                <input class="my-button" type="submit" name="submit-login">

                <p id="p-format"> Forget your password ? <a href="reset_password.jsp"> Click here</a></p>
                <p id="p2-format"> Don't have an account yet ?  <a href="registeration.jsp"> Click here </a></p>
        </form>

    </div>

</body>


</html>