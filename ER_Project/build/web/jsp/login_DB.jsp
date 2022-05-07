<%-- 
    Document   : login_DB
    Created on : Mar 26, 2021, 8:47:33 PM
    Author     : myonl
--%>

<%@page import="Java.DB.Admin_DB"%>
<%@page import="Java.DB.Doctor_DB"%>
<%@page import="Java.DB.Classes.User"%>
<%@page import="Java.DB.Classes.Nurse"%>
<%@page import="Java.DB.Nurse_DB"%>
<%@page import="Java.DB.DB_Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login page </title>
    </head>
    <body>
        <%
            String phoneNumber = request.getParameter("phoneNumber").trim();
            String password = request.getParameter("password").trim();

            // login
            User user = login(phoneNumber, password);

            // if not null == user found
            if (user != null) {
                // save to session
                request.getSession().setAttribute("user",user);
                
                // redirect to profile page
                response.sendRedirect("profile.jsp");
            } else {
        %>
        <script>
            window.location = "login.jsp";
            window.alert("wrong phone number or passwrod");
        </script>
        <% }%>



        <%!
            public static User login(String phoneNumber, String password) {
                User user;
                // open connection
                DB_Connection conn = new DB_Connection();

                // to handle the nurse operation with database
                Nurse_DB nurseDB = new Nurse_DB(conn.getConnection());
                user = nurseDB.loginNurse(phoneNumber, password);
                if (user != null) {
                    return user;
                }

                // to handle the Doctor operation with database
                Doctor_DB doctorDB = new Doctor_DB(conn.getConnection());
                user = doctorDB.loginDoctor(phoneNumber, password);
                if (user != null) {
                    return user;
                }

                // to handle the admin operation with database
                Admin_DB adminDB = new Admin_DB(conn.getConnection());
                user = adminDB.loginAdmin(phoneNumber, password);
                if (user != null) {
                    return user;
                }

                return null;
            }
        %>
    </body>
</html>
