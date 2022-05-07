<%-- 
    Document   : validate_profile.jsp
    Created on : Apr 12, 2021, 4:56:49 AM
    Author     : myonl

--%>

<%@page import="Java.DB.Admin_DB"%>
<%@page import="Java.DB.Doctor_DB"%>
<%@page import="Java.DB.Nurse_DB"%>
<%@page import="Java.DB.DB_Connection"%>
<%@page import="Java.DB.Classes.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                String[] name = request.getParameter("userName").trim().split(" ");
                String phoneNumber = request.getParameter("phone").trim();
                String email = request.getParameter("email").trim();
                String password = request.getParameter("password").trim();
                String role = request.getParameter("role").trim();

                User user = (User) request.getSession().getAttribute("user");

                user.setfName(name[0]);
                user.setlName(name[1]);
                user.setEmail(email);
                user.setPhoneNumber(phoneNumber);
                user.setRole(role);
                user.setPassword(password);

                DB_Connection conn = new DB_Connection();

                if (role.equalsIgnoreCase("nurse")) {
                    Nurse_DB nurseDB = new Nurse_DB(conn.getConnection());
                    nurseDB.updateNurse(user);
                } else if (role.equalsIgnoreCase("doctor")) {
                    Doctor_DB doctorDB = new Doctor_DB(conn.getConnection());
                    doctorDB.updateDoctor(user);
                } else {
                    Admin_DB adminDB = new Admin_DB(conn.getConnection());
                    adminDB.updateAdmin(user);
                }
                                
                request.getSession().setAttribute("user", user);
                response.sendRedirect("profile.jsp");
                
            } catch (Exception e) {
                System.out.println("h");
                System.out.println(e.getStackTrace()[0].getLineNumber());
                System.out.println(e.getStackTrace()[0].getFileName());
            }
        %>
    </body>
</html>
