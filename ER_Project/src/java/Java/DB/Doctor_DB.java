package Java.DB;

import Java.DB.Classes.Doctor;
import Java.DB.Classes.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Doctor_DB {

    Connection conn;
    Doctor doctor;

    public Doctor_DB(Connection conn) {
        this.conn = conn;
    }

    public Doctor loginDoctor(String phoneNumber, String Password) {

        String query = "select * from Doctor where phoneNumber='" + phoneNumber + "' "
                + "and password='" + Password + "'";

        try {
            Statement stmt = conn.createStatement();
            ResultSet set = stmt.executeQuery(query);

            if (set.next()) {

                doctor = new Doctor(set.getString("fName"), set.getString("lName"), set.getString("phoneNumber"),
                        set.getString("ID"), set.getString("password"), set.getString("Email"), "doctor");

                return doctor;
            }

        } catch (Exception e) {
            //System.out.print(e);
            e.printStackTrace();
        }

        return null;
    }

    public Doctor registerDoctor(String fName, String lName, String phoneNumber, String ID, String password, String Email) {

        String query = " select ID from Doctor where ID='" + ID + "'";
        String phoneQ = " select ID from Doctor where phoneNumber='" + phoneNumber + "'";
        String insertQ = "insert into Doctor values('" + fName + "','" + lName + "','" + phoneNumber + "','" + ID + "','" + password + "','" + Email + "')";
        Statement stmt;
        try {
            stmt = conn.createStatement();
            ResultSet set = stmt.executeQuery(query);
            if (set.next()) {
                return null;
            } else {

                stmt = conn.createStatement();
                set = stmt.executeQuery(phoneQ);
                if (set.next()) {
                    return null;

                } else {
                    stmt = conn.createStatement();
                    int number = stmt.executeUpdate(insertQ);

                    return new Doctor(fName, lName, phoneNumber, ID, password, Email, "doctor");
                }

            }
        } catch (SQLException ex) {
        }

        return doctor;

    }
    
    public boolean updateDoctor(User user) {
        try {
            //        fName, lName, phoneNumber, ID, password, Email
            String query = "update doctor set fName='" + user.getfName() + "',"
                    + "lName='" + user.getlName() + "',"
                    + "phoneNumber='" + user.getPhoneNumber() + "',"
                    + "password='" + user.getPassword() + "',"
                    + "Email='" + user.getEmail() + "'"
                    + " where ID ='" + user.getID() + "'";
            
            Statement stmt = conn.createStatement();
            int number = stmt.executeUpdate(query);
            
            return number > 0;
        } catch (SQLException ex) {
            Logger.getLogger(Doctor_DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    public boolean resetPassword(String phoneNumber, String password, String repassword) {

        String phoneQ = " select ID from Doctor where phoneNumber='" + phoneNumber + "'";
        Statement stmt;
        try {
            stmt = conn.createStatement();
            ResultSet set = stmt.executeQuery(phoneQ);

            if (set.next()) {

                String rePassQ = "update Doctor set password = '" + password + "' where phoneNumber = '"
                        + phoneNumber + "'";
                int i = stmt.executeUpdate(rePassQ);

                return i > 0;
            }

        } catch (SQLException ex) {
            Logger.getLogger(Nurse_DB.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;

    }
}
