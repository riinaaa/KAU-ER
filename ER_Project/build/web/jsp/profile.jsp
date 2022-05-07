<%-- 
    Document   : profile
    Created on : Apr 11, 2021, 11:45:57 AM
    Author     : myonl
--%>

<%@page import="Java.DB.Classes.User"%>
<%@page import="Java.DB.Classes.Nurse"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <link rel="stylesheet" href="../css/profile.css">
        <script src="https://kit.fontawesome.com/20bde7c627.js" crossorigin="anonymous"></script>
    </head>

    <body>

        <div class="wrapper">
            <%
                User user = (User) request.getSession().getAttribute("user");
                System.out.println(user.getFullName() + " hi");
            %>

            <div class="sidebar">

                <div class="logo">
                    <img src="../images/logo.png" alt="">

                </div>

                <div class="sub-logo">
                    <span> KAUH </span>
                </div>

                <div class="user-icon">                    
                    <%
                        out.print("<img src=\"../images/userIcon.png\" >");
                        out.println("<br> <span class=\"name-title\">" + user.getFullName() + "</span>");
                    %>
                </div>

                <ul>
                    <li> <i class="fas fa-columns"></i> <a href="#"> Dashboard</a></li>
                    <li><i class="fas fa-id-card"></i> <a href="#"> Profile</a></li>
                    <li> <i class="fas fa-plus-circle"></i><a href="#"> New patient </a></li>
                    <li> <i class="fas fa-sign-out-alt"></i><a href="../index.jsp"> log out </a></li>
                </ul>

            </div>

            <div class="main-content">

                <div class="header"> My Profile</div>

                <div class="profile-form">
                    <form action="validate_profile.jsp" method="post">
                        <!-- name -->
                        <label> name <br></label>
                            <%
                                out.println("<input disabled id=\"name\" name='userName' class=\"input-field\" type=\"text\" value=\"" + user.getFullName()+ "\">");
                            %>

                        <br>

                        <!-- id -->
                        <label> ID <br></label>
                            <%
                                out.println("<input disabled id=\"id\" name=\"userID\" class=\"input-field\" type=\"text\" value=" + user.getID() + ">");
                            %>

                        <br>

                        <!-- phone -->
                        <label> Phone Nmber <br></label>
                            <%
                                out.println("<input disabled id=\"phone\" name=\"phone\" class=\"input-field\" type=\"text\" value=" + user.getPhoneNumber() + ">");
                            %>

                        <br>

                        <!-- email -->
                        <label> E-mail <br></label>
                            <%
                                out.println("<input disabled id=\"email\" name=\"email\" class=\"input-field\" type=\"text\" value=" + user.getEmail() + ">");
                            %>


                        <br>

                        <!-- password -->
                        <label> Password <br></label>
                            <%
                                out.println("<input disabled name=\"password\" id=\"password\" class=\"input-field\" type=\"password\" value=" + user.getPassword() + ">");
                            %>

                        <br>

                        <!-- role -->
                        <label> Role <br></label>
                            <%
                                out.println("<input disabled id=\"role\" name=\"role\" class=\"input-field\" type=\"text\" value=" + user.getRole() + ">");
                            %>

                        <!-- btns -->
                        <br>
                        <br>
                        <div class="buttons"> 
                            
                        <input style="display:none;" type="button" class="my-button" id="cancel" value="Cancel">
                        <input style="display:none;" class="my-button2" id="save"  value="Submit" type="submit">
                        <input type="button" class="my-button1" id="edit" value="Edit">
                        
                        
                        </div>
                     </form>
                </div>

            </div>

        </div>


        <script>
            // varibles
            var editBtn = document.getElementById('edit');
            var saveBtn = document.getElementById('save');
            var cancelBtn = document.getElementById('cancel');

            // from varible
            var nameField = document.getElementById('name');
            var idField = document.getElementById('id');
            var phoneField = document.getElementById('phone');
            var passwordField = document.getElementById('password');
            var emailField = document.getElementById('email');
            var roleField = document.getElementById('role');
            // --------------------------------------------------------


            // edit button event
            editBtn.addEventListener('click', function () {

                editBtn.style.display = "none";
                saveBtn.style.display = "";
                cancelBtn.style.display = "";

                enableFeilds(false);
            });

            // cancel button event
            cancelBtn.addEventListener('click', function () {

                editBtn.style.display = "";
                saveBtn.style.display = "none";
                cancelBtn.style.display = "none";

                enableFeilds(true);
            });

            function enableFeilds(isEnabled) {
                nameField.disabled = isEnabled;
                phoneField.disabled = isEnabled;
                passwordField.disabled = isEnabled;
                emailField.disabled = isEnabled;
                roleField.disabled = isEnabled;
            }

        </script>

    </body>

</html>
