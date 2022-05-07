package Java.DB;

import Java.DB.Classes.Admin;
import Java.DB.Classes.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author myonl
 */
public class Admin_DB {

    Admin admin;
    Connection conn;

    public Admin_DB(Connection conn) {
        this.conn = conn;
    }

    public Admin loginAdmin(String phoneNumber, String Password) {

        String query = "select * from administration where phoneNumber='" + phoneNumber + "' "
                + "and password='" + Password + "'";

        try {
            Statement stmt = conn.createStatement();
            ResultSet set = stmt.executeQuery(query);

            if (set.next()) {

                admin = new Admin(set.getString("fName"), set.getString("lName"), set.getString("phoneNumber"),
                        set.getString("ID"), set.getString("password"), set.getString("Email"), "admin");

                return admin;
            }

        } catch (Exception e) {
            //System.out.print(e);
            e.printStackTrace();
        }

        return null;

    }

    public Admin registerAdmin(String fName, String lName, String phoneNumber, String ID, String password, String Email) {

        String query = " select ID from administration where ID='" + ID + "'";
        String phoneQ = " select ID from administration where phoneNumber='" + phoneNumber + "'";
        String insertQ = "insert into administration values('" + fName + "','" + lName + "','" + phoneNumber + "','" + ID + "','" + password + "','" + Email + "')";
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

                    return new Admin(fName, lName, phoneNumber, ID, password, Email, "admin");
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(Admin_DB.class.getName()).log(Level.SEVERE, null, ex);
        }

        return admin;

    }

     public boolean updateAdmin(User user) {
        try {
            //        fName, lName, phoneNumber, ID, password, Email
            String query = "update administration set fName='" + user.getfName() + "',"
                    + "lName='" + user.getlName() + "',"
                    + "phoneNumber='" + user.getPhoneNumber() + "',"
                    + "password='" + user.getPassword() + "',"
                    + "Email='" + user.getEmail() + "'"
                    + " where ID ='" + user.getID() + "'";
            
            Statement stmt = conn.createStatement();
            int number = stmt.executeUpdate(query);
            
            return number > 0;
        } catch (SQLException ex) {
            Logger.getLogger(Admin_DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    public boolean resetPassword(String phoneNumber, String password, String repassword) {

        String phoneQ = " select ID from administration where phoneNumber='" + phoneNumber + "'";
        Statement stmt;
        try {
            stmt = conn.createStatement();
            ResultSet set = stmt.executeQuery(phoneQ);

            if (set.next()) {

                String rePassQ = "update administration set password = '" + password + "' where phoneNumber = '"
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
