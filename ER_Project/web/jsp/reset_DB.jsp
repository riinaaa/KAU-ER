<%-- 
    Document   : reset_DB
    Created on : Apr 3, 2021, 3:56:52 AM
    Author     : myonl
--%>

<%@page import="Java.DB.Admin_DB"%>
<%@page import="Java.DB.Doctor_DB"%>
<%@page import="Java.DB.Nurse_DB"%>
<%@page import="Java.DB.DB_Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String phoneNumber = request.getParameter("phoneNumber");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");

            DB_Connection conn = new DB_Connection();
            Nurse_DB nurseDB = new Nurse_DB(conn.getConnection());
            boolean isNurse = nurseDB.resetPassword(phoneNumber, password, repassword);

            if(password.equals(repassword)){
            if (isNurse) {

                out.print("password is updated ");

            } else {

                Doctor_DB doctorDB = new Doctor_DB(conn.getConnection());
                boolean isDoctor = doctorDB.resetPassword(phoneNumber, password, repassword);

                if (isDoctor) {

                    out.print("password is updated ");

                } else {

                    Admin_DB adminDB = new Admin_DB(conn.getConnection());
                    boolean isAdmin = adminDB.resetPassword(phoneNumber, password, repassword);

                    if (isAdmin) {

                        out.print("password is updated ");

                    }else{
                    
                     out.print("password is not updated ");
                    
                    }

                }
                
            }
            
            }else{
            
            out.print("the two password is not the same please try again");
            
            }


        %>
    </body>
</html>
