<%-- 
    Document   : nurseHomePage
    Created on : Apr 12, 2021, 5:42:33 PM
    Author     : Razer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Java.DB.Classes.User"%>
<%@page import="Java.DB.Classes.WatingTime"%>
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
        <script src="../js/webflow.js" type="text/javascript"></script>
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
                    <li> <i class="fas fa-columns"></i> <a href="HomePageDoc.jsp"> Dashboard</a></li>
                    <li><i class="fas fa-id-card"></i> <a href="profile.jsp"> Profile</a></li>
                    <li> <i class="fas fa-plus-circle"></i><a href="visualTriage.jsp"> New patient </a></li>
                    <li> <i class="fas fa-sign-out-alt"></i><a href="../index.jsp"> log out </a></li>
                </ul>

            </div>


            <%  
            String ID = request.getParameter("ID");
            String urgency = request.getParameter("urgency");
            User userToHP = (User) request.getSession().getAttribute("user");
            System.out.println(user.getFullName() + " hi");
            %>
            <%             
            WatingTime wt = (WatingTime)request.getSession().getAttribute("watingTime"); %>
            <%--<% String ID=(String)request.getSession().getAttribute("EID");%> --%>
            <%int Idd= Integer.parseInt(ID);%>
            <%--<% String urgency=  (String) request.getSession().getAttribute("Eurgency");%> --%>
            <%  String estimated=wt.addPatient(Idd,urgency);%>


            <form action ="HomePageDoc.jsp" method="POST"> 
                <div class="form-block w-form">
                    <h1 class="heading">Estimated Time</h1>
                    <table>
                        <tbody>
                            <tr> 
                        <div><label for="ID" class="field-label">ID</label>
                            <output value="<%=ID%>" type="text" class="text-field w-input" maxlength="256" name="ID" data-name="ID" placeholder="ID" id="fName2"/> <%out.print(ID);%> </div>
                        <div><label for="urgency" class="field-label">urgency</label> 
                            <output value="<%=urgency%>" type="text" class="text-field w-input" maxlength="256" name="urgency" data-name="urgency" placeholder="urgency" id="fName2"/> <%out.print(urgency);%></div>
                        <div><label for="estimated" class="field-label">Waiting Time</label> 
                            <output value="<%=estimated%>" type="text" class="text-field w-input" maxlength="256" name="estimated" data-name="estimated" placeholder="estimated" id="fName2"/> <%out.print(estimated);%></div>
                        </tr>
                        <div><input type="submit" value="Send" name="Send" /></div>
                        </tbody>
                    </table>
                </div>
            </form>
            <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=606729d15837e87029637bf6" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
            <script src="../js/webflow.js" type="text/javascript"></script>
    </body>
</html>