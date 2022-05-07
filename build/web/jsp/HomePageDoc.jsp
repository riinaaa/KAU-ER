<%-- 
    Document   : HomePageDoc
    Created on : Apr 14, 2021, 11:08:39 PM
    Author     : Razer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="Java.DB.Classes.User"%>

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
                Java.DB.DataBaseConnection userr = new Java.DB.DataBaseConnection();
                ResultSet result = userr.getPatient();
                User userToHP = (User) request.getSession().getAttribute("user");
                System.out.println(user.getFullName() + " hi");
            %>

            <div class="content">
                <h1 class="heading">ER Patients</h1>
                <div data-duration-in="300" data-duration-out="100" class="tabs w-tabs">
                    <div class="tabs-menu w-tab-menu">
                        <a data-w-tab="Tab 1" class="tab-link-tab-1 w-inline-block w-tab-link w--current">
                            <div class="text-block-3">All Patients</div>
                        </a>

                        <a data-w-tab="Tab 2" class="tab-link-tab-2 w-inline-block w-tab-link">
                            <div class="text-block-3">Non-Covid Patients</div>
                        </a>
                        <a data-w-tab="Tab 3" class="tab-link-tab-3 w-inline-block w-tab-link">
                            <div class="text-block-3">Covid Patients</div>
                        </a>
                    </div>
                    <div class="tabs-content w-tab-content">
                        <div data-w-tab="Tab 1" class="tab-pane-tab-1 w-tab-pane w--tab-active">
                            <table>
                                <tbody>

                                    <tr>
                                        <td>ID</td>
                                        <td>Name</td>
                                        <td>Date</td>
                                        <td>Urgency</td>
                                        <td>Status</td>
                                    </tr>

                                    <% while (result.next()) {
                                    
                                    %>
                                    <tr>
                                        <td><%= result.getString("ID")%> </td>
                                        <td><%= result.getString("fName") + " " + result.getString("lName")%> </td>
                                        <td><%= result.getString("enterdDate")%> </td>
                                        <td><%= result.getString("urgency")%> </td>
                                        <td><%= result.getString("State")%> </td>
                                        <td><a href="updatePatient.jsp?ID=<%= result.getString("ID")%>"> Update </a></td> 
                                        <td><a href="ETime.jsp?ID=<%= result.getString("ID") %>&urgency=<%=result.getString("urgency")%>"> Estimate Time</a></td>                                         
                                        <td><a href="deletePt.jsp?ID=<%= result.getString("ID")%>"> Discharge </a></td>
                                         <td><a href="bedState1.jsp?ID=<%= result.getString("ID")%>"> Assign Bed </a></td>
                                    </tr>
                                    <% } %>

                                </tbody>
                            </table>


                        </div>

                        <div data-w-tab="Tab 2" class="w-tab-pane">

                            <table>
                                <tbody>

                                    <tr>
                                        <td>ID</td>
                                        <td>Name</td>
                                        <td>Date</td>
                                        <td>Result</td>
                                        <td>Urgency</td>
                                        <td>Status</td>
                                    </tr>

                                    <% while (result.next()) {%>
                                    <tr>
                                        <td><%= result.getString("ID")%> </td>
                                        <td><%= result.getString("fName") + " " + result.getString("lName")%> </td>
                                        <td><%= result.getString("enterdDate")%> </td>
                                        <td><%= result.getString("urgency")%> </td>
                                        <td><%= result.getString("State")%> </td>
                                        <td><a href="updatePatient.jsp?ID=<%= result.getString("ID")%>"> Update </a></td> 
                                        <td><a href="#.jsp?ID=<%= result.getString("ID")%>"> Estimate Time</a></td>                                         
                                        <td><a href="deletePt.jsp?ID=<%= result.getString("ID")%>"> Discharge </a></td>
                                         <td><a href="bedState1.jsp?ID=<%= result.getString("ID")%>"> Discharge </a></td>

                                    </tr>
                                    <% } %>

                                </tbody>
                            </table>




                        </div>
                        <div data-w-tab="Tab 3" class="w-tab-pane">
                            <table>
                                <tbody>
                                    <tr>
                                        <td>ID</td>
                                        <td>Name</td>
                                        <td>Date</td>
                                        <td>Result</td>
                                        <td>Urgency</td>
                                        <td>Status</td>
                                    </tr>

                                    <% while (result.next()&& result.getString("urgency").equals("Emergent")) {%>
                                    <tr>
                                        <td><%= result.getString("ID")%> </td>
                                        <td><%= result.getString("fName") + " " + result.getString("lName")%> </td>
                                        <td><%= result.getString("enterdDate")%> </td>
                                        <td><%= result.getString("urgency")%> </td>
                                        <td><%= result.getString("State")%> </td>
                                        <td><a href="updatePatient.jsp?ID=<%= result.getString("ID")%>"> Update </a></td> 
                                        <td><a href="ETime.jsp?ID=<%= result.getString("ID")%>"> Estimate Time</a></td>                                         
                                        <td><a href="deletePt.jsp?ID=<%= result.getString("ID")%>"> Discharge </a></td>
                                         <td><a href="bedState1.jsp?ID=<%= result.getString("ID")%>"> Discharge </a></td>

                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
            <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=606729d15837e87029637bf6" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
            <script src="../js/webflow.js" type="text/javascript"></script>
    </body>
</html>