<%-- 
    Document   : nurseHomePage
    Created on : Apr 12, 2021, 5:42:33 PM
    Author     : Razer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Java.DB.Classes.User"%>
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
        <title>Visual Triage</title>
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
        
           <script>

       
          function func() 
                {
                    var y1 = document.getElementById("yes_1");
                    var y2 = document.getElementById("yes_2");
                    var y3 = document.getElementById("yes_3");
                    var y4 = document.getElementById("yes_4");
                    var y5 = document.getElementById("yes_5");
                    var y6 = document.getElementById("yes_6");
                    var y7 = document.getElementById("yes_7");
                    var y8 = document.getElementById("yes_8");                  
                    var y9 = document.getElementById("yes_9");
                    var yc = document.getElementById("yes_c");
                    var r  = document.getElementById("rrr").value;
                    
                    var res=0;
                     var Re="";
                    
                   
                    if(y1.checked==true){
                          res += 3;
                     }if(y2.checked==true){
                          res += 2;
                    }if(y3.checked==true){
                          res += 2;
                    }if(y4.checked==true){
                          res += 2;
                    } if(y5.checked==true){
                          res += 2;
                    } if(y6.checked==true){
                          res += 1;
                    } if(y7.checked==true){
                          res += 1;
                    } if(y8.checked==true){
                          res += 1; 
                    } if(y9.checked==true){
                          res += 4;
                    }if(res>=4)
                        Re = "Covid Patient";
                    else
                        Re = "Normal Patient";
                    
                    if(yc.checked==true){
               window.location = "mainTriage.jsp";
               window.alert("The result is: " + Re); }
                    if(r === true){
                     document.write("result is: " + Re);
                    } 
                     document.getElementById("total").value= Re;
                }
   
        </script>
        
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
                    <li> <i class="fas fa-columns"></i> <a href="HomePage.jsp"> Dashboard</a></li>
                    <li><i class="fas fa-id-card"></i> <a href="profile.jsp"> Profile</a></li>
                    <li> <i class="fas fa-plus-circle"></i><a href="visualTriage.jsp"> New patient </a></li>
                    <li> <i class="fas fa-sign-out-alt"></i><a href="../index.jsp"> log out </a></li>
                </ul>

            </div>

            <%
                User userToHP = (User) request.getSession().getAttribute("user");
                System.out.println(user.getFullName() + " hi");
            %>

           <div class="content">
    <h1 class="heading add">Visual Triage Form</h1>
    <div class="form-block w-form">
      <form id="wf-form-patientAdded" name="Add" data-name="Insert" action="Insert.jsp" method="POST" >
        <div><label for="CovidpatientID" class="field-label">Patient ID</label><input type="text" class="text-field w-input" maxlength="256" name="CovidpatientID" data-name="CovidpatientID" placeholder="" id="CovidpatientID"></div>
        <div><label for="directContact" class="field-label">Direct Contact</label><input type="radio" name="yes_no" id="yes_1" value="3" onclick="func()">Yes</input>  <input type="radio" id="no_1" name="yes_no" value="0" >No</input></div>
        <div><label for="Fever" class="field-label">Fever</label><input type="radio" name="yes_no2" id="yes_2" onclick="func()">Yes</input>  <input type="radio" name="yes_no2">No</input></div> 
        <div><label for="Cough" class="field-label">Cough</label><input type="radio" name="yes_no3" id="yes_3"onclick="func()">Yes</input>    <input type="radio" name="yes_no3">No</input></div>
        <div><label for="shortnessOfBreath" class="field-label">Shortness of Breath</label><input type="radio" name="yes_no4" id="yes_4"onclick="func()">Yes</input>    <input type="radio" name="yes_no4">No</input></div>
        <div><label for="Respiratory" class="field-label">Respiratory</label><input type="radio" name="yes_no5" id="yes_5"onclick="func()">Yes</input>    <input type="radio" name="yes_no5">No</input></div>
        <div><label for="gastrointestinalSymptoms" class="field-label">Gastrointestinal Symptoms</label><input type="radio" name="yes_no6" id="yes_6"onclick="func()">Yes</input>    <input type="radio" name="yes_no6">No</input></div>
        <div><label for="ESRD" class="field-label">ESRD</label><input type="radio" name="yes_no7" id="yes_7"onclick="func()">Yes</input>    <input type="radio" name="yes_no7">No</input></div>
        <div><label for="IH" class="field-label">IH</label><input type="radio" name="yes_no8" id="yes_8"onclick="func()">Yes</input>    <input type="radio" name="yes_no8">No</input></div>
        <div><label for="REOP" class="field-label">REOP</label><input type="radio" name="yes_no9" id="yes_9"onclick="func()">Yes</input>    <input type="radio" name="yes_no9">No</input></div>
        <div><label for="Result" class="field-label">Calculate Result</label> <input type="radio" name="yes_noC" id="yes_c"onclick="func()">Yes</input>  <input type="radio" name="yes_noC">No</input> <button type="button" id="rrr" name="rr" onclick="func()" value=""></button></div>
        <div><input type="hidden" name="total" id="total" value=""/></input></div>
        <input type="submit" value="Next" data-wait="Please wait..." class="submit-button w-button">
       
      </form>
        
    </div>
  </div>
            <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=606729d15837e87029637bf6" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
            <script src="js/webflow.js" type="text/javascript"></script>

    </body>
</html>
