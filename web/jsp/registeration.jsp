<%-- 
    Document   : registeration
    Created on : Apr 3, 2021, 12:38:02 AM
    Author     : myonl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Regestier </title>

    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/register.css">

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

            <li> <a href="login.jsp"> Admins</a></li>
            <li> <a href="login.jsp"> Doctors</a></li>
            <li> <a href="login.jsp"> Nurses </a></li>
            <li> <a href="#"> Support </a></li>

        </ul>

    </div> <!-- end of nav -->

    <div class="main">

        <div class="icon-format">
            <img src="../images/userIcon.png" alt="" width="80" height="80">
        </div>

        <div class="page-title">

            <h1> Sign Up</h1>

        </div>

        <form action="register_DB.jsp" method="POST" >
            <div class="register-form">

                <div class="input-icons">
                    <i class="fa fa-user icon"></i>
                    <input class="input-field" type="text" placeholder="First name and last name" name="FLname">
                    <i class="fa fa-id-badge icon"></i>
                    <input class="input-field" type="text" placeholder="ID" name="ID">
                    <i class="fa fa-mobile icon"></i>
                    <input class="input-field" type="text" placeholder="Phone Number" name="PhoneNumber">
                    <i class="fa fa-envelope icon"></i>
                    <input class="input-field" type="text" placeholder="Email" name="Email">
                    <i class="fa fa-key icon"></i>
                    <input class="input-field" type="text" placeholder="Password" name="password">

                </div>

                <div class="role-div" style="width:200px;">
                    <select class="role-option" name="role">
                        <option value="0">Select your role </option>
                        <option value="Nurse">Nurse</option>
                        <option value="Doctor">Doctor</option>
                        <option value="Admin">Admin</option>
                    </select>
                </div>

                <button class="my-button" name="cancel"><a href="login.jsp"> Cancel </a></button>
                <button class="my-button1" type="submit" name="submit-register"> Regestier </button>
                
            </div>

        </form>




    </div>

</body>


</html>
