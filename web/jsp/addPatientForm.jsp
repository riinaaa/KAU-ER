<%-- 
    Document   : nurseHomePage
    Created on : Apr 12, 2021, 5:42:33 PM
    Author     : Razer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Java.DB.Classes.User"%>
<%@page import="Java.DB.Classes.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/profile.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/20bde7c627.js" crossorigin="anonymous"></script>
        <meta charset="utf-8">
        <title>Home Page</title>
        <meta content="Incredible is a template, that combines a minimal modern design with the right amount of features to help you create an outstanding web for your business in no time." name="description">
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <meta content="Webflow" name="generator">
        <link href="../css/normalize.css" rel="stylesheet" type="text/css">
        <link href="../css/webflow.css" rel="stylesheet" type="text/css">
        <link href="../css/rinas-groovy-project.webflow.css" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
        <script type="text/javascript">WebFont.load({google: {families: ["Oswald:200,300,400,500,600,700", "Droid Sans:400,700", "Roboto:300,regular,500"]}});</script>
        <script type="text/javascript">!function (o, c) {
                var n = c.documentElement, t = " w-mod-";
                n.className += t + "js", ("ontouchstart"in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch")
            }(window, document);</script>
        <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
        <link href="images/webclip.png" rel="apple-touch-icon">
    </head>
    <body>
        <div class="wrapper">
            <%
                User user = (User) request.getSession().getAttribute("user");
                System.out.println(user.getFullName() + " hi");
                Patient pt = (Patient) request.getSession().getAttribute("patient");
                String ID = pt.getID();
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
                    <li> <i class="fas fa-columns"></i> <a href="HomePage.jsp"> Dashboard</a></li>
                    <li><i class="fas fa-id-card"></i> <a href="profile.jsp"> Profile</a></li>
                    <li> <i class="fas fa-plus-circle"></i><a href="addPatientForm.jsp"> New patient </a></li>
                    <li> <i class="fas fa-sign-out-alt"></i><a href="../index.jsp"> log out </a></li>
                </ul>

            </div>

            <%
                Java.DB.DataBaseConnection userr = new Java.DB.DataBaseConnection();
                ResultSet result = userr.getPatient();
                User userToHP = (User) request.getSession().getAttribute("user");
                System.out.println(user.getFullName() + " hi");
            %>

            <div class="content">

                
                <h1 class="heading add">New Patient</h1>
    <div class="form-block w-form">
      <form id="wf-form-patientAdded" name="Add New Patient" data-name="patientAdded" action="patientAdded.jsp" method="POST" >
        <div><label for="fName" class="field-label">First Name</label><input type="text" class="text-field w-input" maxlength="256" name="fName" data-name="fName" placeholder="first name in english" id="fName"/></div>
        <div><label for="middleName" class="field-label">Middle Name</label><input type="text" class="text-field w-input" maxlength="256" name="middleName" data-name="middleName" placeholder="middle name in english" id="middleName"/></div>
        <div><label for="lName" class="field-label">Last Name</label><input type="text" class="text-field w-input" maxlength="256" name="lName" data-name="lName" placeholder="last name in english" id="lName"/></div>
        <div><label for="fNameA" class="field-label">First Name (Arabic)</label><input type="text" class="text-field w-input" maxlength="256" name="fNameA" data-name="fNameA" placeholder="first name in arabic" id="fNameA"/></div>
        <div><label for="middleNameA" class="field-label">Middle Name (Arabic)</label><input type="text" class="text-field w-input" maxlength="256" name="middleNameA" data-name="middleNameA" placeholder="middle name in arabic" id="middleNameA"/></div>
        <div><label for="lNameA" class="field-label">Last Name (Arabic)</label><input type="text" class="text-field w-input" maxlength="256" name="lNameA" data-name="lNameA" placeholder="last name in arabic" id="lNameA"/></div>
        <div><label for="phoneNumber" class="field-label">Phone Number</label><input type="text" class="text-field w-input" maxlength="256" name="phoneNumber" data-name="phoneNumber" placeholder="05xxxxxxxx" id="phoneNumber"/></div>
        <div><label for="ID" class="field-label">ID/Iqama</label><input type="text" class="text-field w-input" maxlength="256" name="ID" data-name="ID" placeholder="enter either id or iqama" id="ID"value="<%=ID%>"/></div>
        <div><label for="Address" class="field-label">Address</label><input type="text" class="text-field w-input" maxlength="256" name="Address" data-name="Address" placeholder="e.g. jeddah" id="Address"/></div>
        <div><label for="MaritalStatus" class="field-label">Marital Status</label><input type="text" class="text-field w-input" maxlength="256" name="Maritalstatus" data-name="MaritalStatus" placeholder="e.g. single/married" id="MaritalStatus"/></div>
        <div><label for="Gender" class="field-label">Gender</label><input type="text" class="text-field w-input" maxlength="256" name="Gender" data-name="Gender" placeholder="e.g. female" id="Gender"/></div>
        <div><label for="DateOfBirth" class="field-label">Date Of Birth</label><input type="text" class="text-field w-input" maxlength="256" name="DateOfBirth" data-name="DateOfBirth" placeholder="e.g. 25/06/1999" id="DateOfBirth"/></div>
        <div><label for="Nationality" class="field-label">Nationality</label><input type="text" class="text-field w-input" maxlength="256" name="Nationality" data-name="Nationality" placeholder="e.g. saudi" id="Nationality"/></div>
        <div><label for="Religion" class="field-label">Religion</label><input type="text" class="text-field w-input" maxlength="256" name="Religion" data-name="Religion" placeholder="e.g. islam" id="Religion"/></div>
        <div><label for="Language" class="field-label">Language</label><input type="text" class="text-field w-input" maxlength="256" name="Language" data-name="Language" placeholder="e.g. arabic" id="Language"/></div>
        <div><label for="Telephone" class="field-label">Telephone</label><input type="text" class="text-field w-input" maxlength="256" name="Telephone" data-name="Telephone" placeholder="01xxxxxxxxx" id="Telephone"/>
        <div><label for="urgency" class="field-label">Urgency</label>
            <div class="role-div" style="width:200px;">
         <select class="urgency-option" name="urgency">
          <option value="0">Select patient's urgency </option>
           <option value="Resuscitation">Resuscitation</option>
           <option value="Emergent">Emergent</option>
           <option value="Urgent">Urgent</option>
            <option value="less-Urgent">Less-Urgent</option>
            <option value="Non-Urgent">Non-Urgent</option>
                   </select>                
                </div>
        </div><input type="submit" value="Add" data-wait="Please wait..." class="submit-button w-button"/>
      </form>
        
    </div>
            </div>
            <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=606729d15837e87029637bf6" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
            <script src="js/webflow.js" type="text/javascript"></script>

    </body>
</html>
