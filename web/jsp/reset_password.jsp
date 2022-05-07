<%-- 
    Document   : reset_password
    Created on : Apr 3, 2021, 2:56:19 AM
    Author     : myonl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Reset Password</title>

        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/reset_password.css">

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
                <img src="../images/reset_logo.png" alt="" width="120" height="90">
            </div>

            <div class="page-title">

                <h1> Reset Password</h1>

            </div>

            <form action=”mailto:contact@yourdomain.com”


                  method=”POST”


                  enctype=”multipart/form-data”


                  name=”EmailForm”>


                Name:<br>


                <input type=”text” size=”19″ name=”ContactName”><br><br>


                Message:<br> <textarea name=”ContactCommentt” rows=”6″ cols=”20″>


                </textarea><br><br> <input type=”submit” value=”Submit”> </form>
            <!--        <form action="reset_DB.jsp" method="POST">
                        
                        <div class="login-form">
            
                            <div class="input-icons">
                                
                                phone number field
                                <i class="fa fa-user icon"></i>
                                <input class="input-field" type="text" placeholder="Enter your phone number" name="phoneNumber">
                                
                                password field
                                <i class="fa fa-key icon"></i>
                                <input class="input-field" type="password" placeholder=" Enter your new password " name="password">
                                
                                <i class="fa fa-key icon"></i>
                                <input class="input-field" type="password" placeholder=" Re-enter your new password " name="repassword">
            
                            </div>
            
                            <input class="my-button" type="submit" name="submit-login">
             
                    </form>
            
            
            
                </div>-->

    </body>


</html>