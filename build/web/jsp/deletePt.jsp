<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Discharge Patient</title>
    </head>
    <body>

        <%
            String ID = request.getParameter("ID");
            String State="Discharged";
            Java.DB.DataBaseConnection conn = new Java.DB.DataBaseConnection();
            int isAdded = conn.discharge(State,ID);
            if(isAdded>0){
               response.sendRedirect("HomePage.jsp");
            } else {
        %>
        <script>
            window.location = "HomePage.jsp";
            window.alert("smthn went wrong");
        </script>
        <% }%>

    </body>
</html>