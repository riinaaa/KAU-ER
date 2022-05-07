<%-- 
    Document   : register_DB
    Created on : Apr 3, 2021, 12:49:03 AM
    Author     : myonl
--%>

<%@page import="Java.DB.Admin_DB"%>
<%@page import="Java.DB.Doctor_DB"%>
<%@page import="Java.DB.Classes.Admin"%>
<%@page import="Java.DB.Classes.Doctor"%>
<%@page import="Java.DB.Classes.Nurse"%>
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

            String[] Name = request.getParameter("FLname").split(" ");
            String fName = Name[0].trim();
            String lName = Name[1].trim();

            System.out.println(" after trim ");
            String phoneNumber = request.getParameter("PhoneNumber").trim();
            String password = request.getParameter("password").trim();
            String ID = request.getParameter("ID").trim();
            String email = request.getParameter("Email").trim();
            String role = request.getParameter("role").trim();

            // open connection
            DB_Connection conn = new DB_Connection();
            System.out.println("Before if ");
            // to handle the nurse operation with database
            if (role.equalsIgnoreCase("Nurse")) {
                System.out.println(" inside Nusre ");
                Nurse_DB nurseDB = new Nurse_DB(conn.getConnection());
                Nurse nurse = nurseDB.registerNurse(fName, lName, phoneNumber, ID, password, email);

                if (nurse == null) {
                    out.print(fName + " has an account!");
                } else {
                    out.print(nurse.getfName() + "'s register is confirmed");
                }
            } else if (role.equalsIgnoreCase("Doctor")) {

                System.out.println(" inside Doctor ");
                Doctor_DB DoctorDB = new Doctor_DB(conn.getConnection());
                System.out.println("between");
                Doctor doctor = DoctorDB.registerDoctor(fName, lName, phoneNumber, ID, password, email);
                if (doctor == null) {
                    out.print(fName + " has an account!");
                } else {

                    out.print(doctor.getfName() + "'s register is confirmed");

                }
            } else if (role.equalsIgnoreCase("Admin")) {

                System.out.println(" inside Doctor ");
                Admin_DB AdminDB = new Admin_DB(conn.getConnection());
                Admin admin = AdminDB.registerAdmin(fName, lName, phoneNumber, ID, password, email);

                if (admin == null) {
                    out.print(fName + " has an account!");
                } else {
                    out.print(admin.getfName() + "'s register is confirmed");
                }

            }

        %>
    </body>
</html>
