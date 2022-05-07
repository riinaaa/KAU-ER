<%-- 
    Document   : Insert
    Created on : Mar 27, 2021, 7:03:42 PM
    Author     : dell
--%>

<%@page import="Java.DB.Classes.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Information</title>


    </head>
    <body>
        <%
            String PatientID = request.getParameter("CovidpatientID").trim();
            String total= request.getParameter("total");
            Patient pt = new Patient(PatientID,total);
            Java.DB.DB_Connection1 conn = new Java.DB.DB_Connection1();

            int isAdded = conn.addcovidpatient(PatientID,total);
            if(isAdded>0){
                request.getSession().setAttribute("patient", pt);
                response.sendRedirect("mainTriage.jsp");
            } else {
        %>
        <script>
            window.location = "visualTriage.jsp";
            window.alert("smthn went wrong");
        </script>
        <% }%>
    </body>
</html>
