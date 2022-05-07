package Java.DB;

import Java.DB.Classes.Nurse;
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
public class Nurse_DB {

    Nurse nurse;
    Connection conn;

    public Nurse_DB(Connection conn) {
        this.conn = conn;
    }

    public Nurse loginNurse(String phoneNumber, String Password) {

        String query = "select * from nurse where phoneNumber='" + phoneNumber + "' "
                + "and password='" + Password + "'";

        try {
            Statement stmt = conn.createStatement();
            ResultSet set = stmt.executeQuery(query);

            if (set.next()) {

                nurse = new Nurse(set.getString("fName"), set.getString("lName"), set.getString("phoneNumber"),
                        set.getString("ID"), set.getString("password"), set.getString("Email"), "nurse");

                return nurse;
            }

        } catch (Exception e) {
            //System.out.print(e);
            e.printStackTrace();
        }

        return null;
    }

    public Nurse registerNurse(String fName, String lName, String phoneNumber, String ID, String password, String Email) {

        String idQuery = " select ID from Nurse where ID='" + ID + "'";
        String phoneQuery = " select ID from Nurse where phoneNumber='" + phoneNumber + "'";
        
        String insertQuery = "insert into Nurse values('" + fName + "','" + lName + "','" + phoneNumber + "','" + ID + "','" + password + "','" + Email + "')";
       
        Statement stmt;
        try {
            // check id first
            stmt = conn.createStatement();
            ResultSet set = stmt.executeQuery(idQuery);

            if (set.next()) {

                return null;

            } else {
                
                // check phone 
                stmt = conn.createStatement();
                set = stmt.executeQuery(phoneQuery);
                if (set.next()) {
                    
                    return null;

                } else {
                    // insert into nurse
                    stmt = conn.createStatement();
                    int number = stmt.executeUpdate(insertQuery);

                    return new Nurse(fName, lName, phoneNumber, ID, password, Email, "nurse");
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(Nurse_DB.class.getName()).log(Level.SEVERE, null, ex);
        }

        return nurse;

    }

    public boolean updateNurse(User user) {
        try {
            //        fName, lName, phoneNumber, ID, password, Email
            String query = "update nurse set fName='" + user.getfName() + "',"
                    + "lName='" + user.getlName() + "',"
                    + "phoneNumber='" + user.getPhoneNumber() + "',"
                    + "password='" + user.getPassword() + "',"
                    + "Email='" + user.getEmail() + "'"
                    + " where ID ='" + user.getID() + "'";
            
            Statement stmt = conn.createStatement();
            int number = stmt.executeUpdate(query);
            
            return number > 0;
            
        } catch (SQLException ex) {
            Logger.getLogger(Nurse_DB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }

    public boolean resetPassword(String phoneNumber, String password, String repassword) {

        String phoneQ = " select ID from Nurse where phoneNumber='" + phoneNumber + "'";
        Statement stmt;
        try {
            stmt = conn.createStatement();
            ResultSet set = stmt.executeQuery(phoneQ);

            if (set.next()) {

                String rePassQ = "update nurse set password = '" + password + "' where phoneNumber = '"
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
