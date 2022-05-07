
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Updated Patient</title>
    </head>
    <body>

        <%
            String fName = request.getParameter("fName");
            String middleName = request.getParameter("middleName");
            String lName = request.getParameter("lName");
            String fNameA = request.getParameter("fNameA");
            String middleNameA = request.getParameter("middleNameA");
            String lNameA = request.getParameter("lNameA");
            String phoneNumber = request.getParameter("phoneNumber");
            String ID = request.getParameter("ID");
            String Address = request.getParameter("Address");
            String Maritalstatus = request.getParameter("Maritalstatus");
            String Gender = request.getParameter("Gender");
            String DateOfBirth = request.getParameter("DateOfBirth");
            String Nationality = request.getParameter("Nationality");
            String Religion = request.getParameter("Religion");
            String Language = request.getParameter("Language");
            String Telephone = request.getParameter("Telephone");
            String urgency = request.getParameter("urgency");
            Java.DB.DataBaseConnection conn = new Java.DB.DataBaseConnection();
            int isAdded = conn.updatePatient(fName, middleName, lName, phoneNumber, ID, Address, Maritalstatus, Gender, DateOfBirth, Nationality, Religion, Language, fNameA, middleNameA, lNameA, Telephone,urgency);
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