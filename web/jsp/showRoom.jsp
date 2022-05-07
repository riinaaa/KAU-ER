<%-- 
    Document   : showRoom
    Created on : Apr 3, 2021, 6:23:19 AM
    Author     : amani
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html data-wf-page="606742758fc6074e25108ff0" data-wf-site="606729d15837e87029637bf6">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                       <link rel="stylesheet" href="../webflow.css">
                        <link rel="stylesheet" href="../rinas-groovy-project.webflow.css">
                         <link rel="stylesheet" href="../normalize.css">
        <form action ="HomePageAdmin.jsp" method="POST">

        <title>show Room</title>
          <meta content="Incredible is a template, that combines a minimal modern design with the right amount of features to help you create an outstanding web for your business in no time." name="description">
  <meta content="Profile" property="og:title">
  <meta content="Profile" property="twitter:title">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="../css/normalize.css" rel="stylesheet" type="text/css">
  <link href="../css/webflow.css" rel="stylesheet" type="text/css">
  <link href="../css/rinas-groovy-project.webflow.css" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
  <script type="text/javascript">WebFont.load({  google: {    families: ["Oswald:200,300,400,500,600,700","Droid Sans:400,700","Roboto:300,regular,500"]  }});</script>
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="images/favicon.ico" rel="shortcut icon" type="image/x-icon">
  <link href="images/webclip.png" rel="apple-touch-icon">
    </head>
     <body>
        <div data-collapse="medium" data-animation="default" data-duration="400" data-no-scroll="1" role="banner" class="left-navigation w-nav">
    <a href="#" class="logo-link w-nav-brand">
      <h1 class="brand-text">KAUH</h1><img src="../images/Icon-awesome-hospital-symbol.png" loading="lazy" width="50" height="50" alt="" class="image-5">
    </a>
       <nav role="navigation" class="nav-menu w-nav-menu">
      <a href="HomePageDoc.jsp" class="nav-link w-nav-link w--current">Dashboard</a>
      <img src="../images/Icon-material-dashboard.png" width="17" alt="" class="image">
      <img src="../images/Icon-metro-profile.png" width="17" alt="" class="image-2">
      <img src="../images/Icon-open-account-logout.png" width="17" alt="" class="image-3">
      <a href="profile.jsp" class="nav-link w-nav-link">profile</a>
      <a href="HomePageAdmin.jsp" class="nav-link w-nav-link">Home page</a>
      <a href="../index.jsp" class="nav-link w-nav-link">log out</a>
    </nav>
             </div>
          <%
                Java.DB.DB_Connection user = new Java.DB.DB_Connection();
                ResultSet result = user.getRoomsall();
                if(result==null){
                    out.print("error");         
                }
              %>
        <div class="content">
    <h1 class="heading">Show Rooms</h1>
    <div data-duration-in="300" data-duration-out="100" class="tabs w-tabs">
      <div class="tabs-menu w-tab-menu">
           
       
      </div>
      <div class="tabs-content w-tab-content">
          <div data-w-tab="Tab 1" class="tab-pane-tab-1 w-tab-pane w--tab-active">
              <table>
            <tbody>
                <tr>
                   <td>roomID</td>
                          <td>bedQ</td>
                          <td>state</td>
                          <td>name</td>

                </tr>
               <% while(result.next()) { %>
                <tr>
                      <td><%= result.getInt("roomNumber")%></td>
                         <td><%= result.getInt("numberOfbeds")%></td>
                          <td><%= result.getString("state")%></td>
                          <td><%= result.getString("roomName")%></td>
                </tr>
                
                                <% } %>
                
                

          </div>
        <div data-w-tab="Tab 2" class="w-tab-pane"></div>
        <div data-w-tab="Tab 3" class="w-tab-pane"></div>
      </div>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=606729d15837e87029637bf6" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="js/webflow.js" type="text/javascript"></script>
</body>
 
</html>
