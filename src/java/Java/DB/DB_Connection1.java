/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java.DB;

/**
 *
 * @author dell
 */
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DB_Connection1 {

    String URL = "jdbc:mysql://localhost:3306/er_project?useSSL=false";
    String USERNAME = "root"; // use your username of Mysql server
    String PASSWORD = "rootbeer"; // use your password of Mysql server
    Connection connection = null;
    PreparedStatement preparedStmt = null;
    ResultSet resultSet = null;
    String sqlQuery = "";

    public DB_Connection1() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

        } catch (SQLException e) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DB_Connection1.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
        public ResultSet getResult(String ID) {
        sqlQuery = "SELECT * FROM covidpatient Where CoviedpatientID= "+ID;
        try {
            preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
        } catch (SQLException e) {
        }
        return resultSet;
    }
            

    public ResultSet getMydatabase() {
        sqlQuery = "SELECT * FROM covidpatient;";

        try {
            preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
        } catch (SQLException e) {
        }
        return resultSet;
    }

    /*  public int addcovidpatient(String CovidpatientID, int directContact, int Fever, int Cough, int shortnessOfBreath, int Respiratory, int gastrointestinalSymptoms, int ESRD, int IH, int REOP, String Result) {
        sqlQuery = "INSERT INTO covidpatient(CovidpatientID,directContact,Fever,Cough,shortnessOfBreath,Respiratory,gastrointestinalSymptoms,ESRD,IH,REOP,Result)values('" + CovidpatientID + "','" + directContact
                + "','" + Fever +  "','" + Cough  + "','" + shortnessOfBreath +  "','" + Respiratory  + "','" + gastrointestinalSymptoms +  "','" + ESRD + "','" + IH +  "','" + REOP + "','"+ Result +"');";*/
        public int addcovidpatient(String CovidpatientID, String total) {
    int i=0;
    String query = "INSERT INTO coviedpatient(CoviedpatientID,Result) "+"values(?,?)";
      try {
    PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, CovidpatientID);
            pst.setString(2, total);
            i = pst.executeUpdate();
}
      catch (SQLException e) {
            System.out.print(e);
            e.printStackTrace();
        }
        return i;
    }
//    public int addcovidpatient(String coviedpatient, String total) {
//        sqlQuery = "INSERT INTO coviedpatient(coviedpatient,Result)values('" + coviedpatient + "','" + total + "');";
//        boolean s = false;
//        int i = 0;
//        try {
//            //old
//            Statement stmt = connection.createStatement();
//            i = stmt.executeUpdate(sqlQuery);
//            if (i == 0) {
//                s = false;
//            }
//        } catch (Exception e) {
//            //System.out.print(e);
//            e.printStackTrace();
//        }
//        return i;
//    }

    public void close() {
        try {
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(URL);
        }
    }

}
