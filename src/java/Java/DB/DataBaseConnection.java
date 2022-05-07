package Java.DB;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DataBaseConnection {

    String URL = "jdbc:mysql://localhost:3306/er_project?useSSL=false";
    String USERNAME = "root";
    String PASSWORD = "rootbeer";
    Connection connection = null;
    PreparedStatement preparedStmt = null;
    ResultSet resultSet = null;
    String sqlQuery = "";

    public DataBaseConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException e) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DataBaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getPatient() {
        sqlQuery = "SELECT * FROM patient;";
        try {
            preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
        } catch (SQLException e) {
        }
        return resultSet;
    }
    
    
        public ResultSet getPatient(String ID) {
        sqlQuery = "SELECT * FROM patient Where ID= "+ID;
        try {
            preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
        } catch (SQLException e) {
        }
        return resultSet;
    }
        
        
    public int discharge(String State, String ID) {
    int i=0;
    String query = "update patient set State=? where ID=?;";
      try {
    PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, State);
            pst.setString(2, ID);
            i = pst.executeUpdate();
}
      catch (SQLException e) {
            System.out.print(e);
            e.printStackTrace();
        }
        return i;
    }

    public int updatePatient(String fName, String middleName, String lName, String phoneNumber, String ID, String Address, String Maritalstatus, String Gender, String DateOfBirth, String Nationality, String Religion, String Language, String fNameA, String middleNameA, String lNameA, String Telephone,String urgency) throws SQLException {

        String query = "update patient set fName=?,middleName=?,lName=?,phoneNumber=?,ID=?,Address=?,Maritalstatus=?,Gender=?,DateOfBirth=?,Nationality=?,Religion=?,Language=?,fNameA=?,middleNameA=?,lNameA=?,Telephone=?,urgency=? where ID=?";
        int i = 0;
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, fName);
            pst.setString(2, middleName);
            pst.setString(3, lName);
            pst.setString(4, phoneNumber);
            pst.setString(5, ID);
            pst.setString(6, Address);
            pst.setString(7, Maritalstatus);
            pst.setString(8, Gender);
            pst.setString(9, DateOfBirth);
            pst.setString(10, Nationality);
            pst.setString(11, Religion);
            pst.setString(12, Language);
            pst.setString(13, fNameA);
            pst.setString(14, middleNameA);
            pst.setString(15, lNameA);
            pst.setString(16, Telephone);
            pst.setString(17, urgency);
            pst.setString(18, ID);
            i = pst.executeUpdate();
        } catch (SQLException e) {
            System.out.print(e);
            e.printStackTrace();
        }
        return i;
    }

    public boolean addPatient(String fName, String middleName, String lName, String phoneNumber, String ID, String Address, String Maritalstatus, String Gender, String password, String DateOfBirth, String Nationality, String Religion, String Language, String fNameA, String middleNameA, String lNameA, String Telephone, String State, String enterdDate, String estimatedTime, String urgency) throws SQLException {

        String query = "insert into patient(fName,middleName,lName,phoneNumber,ID,Address,Maritalstatus,Gender,password,DateOfBirth,Nationality,Religion,Language,fNameA,middleNameA,lNameA,Telephone,State,enterdDate,estimatedTime,urgency)" + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
        try {
            PreparedStatement pst = connection.prepareStatement(query);
            pst.setString(1, fName);
            pst.setString(2, middleName);
            pst.setString(3, lName);
            pst.setString(4, phoneNumber);
            pst.setString(5, ID);
            pst.setString(6, Address);
            pst.setString(7, Maritalstatus);
            pst.setString(8, Gender);
            pst.setString(9, password);
            pst.setString(10, DateOfBirth);
            pst.setString(11, Nationality);
            pst.setString(12, Religion);
            pst.setString(13, Language);
            pst.setString(14, fNameA);
            pst.setString(15, middleNameA);
            pst.setString(16, lNameA);
            pst.setString(17, Telephone);
            pst.setString(18, State);
            pst.setString(19, enterdDate);
            pst.setString(20, estimatedTime);
            pst.setString(21, urgency);
            pst.executeUpdate();
        } catch (SQLException e) {
            System.out.print(e);
            e.printStackTrace();
        }
        return true;
    }

//        sqlQuery = "insert into patient(fName,middleName,lName,phoneNumber,ID,Address,Maritalstatus,Gender,password,DateOfBirth,Nationality,Religion,Language,fNameA,middleNameA,lNameA,Telephone,State,enteredDate,estimatedTime) values('" + fName + "','" + middleName + "','" + lName
//                + "','" + phoneNumber + "','" + ID
//                + "','" + Address + "','" + Maritalstatus + "','" + Gender
//                + "','" + password + "','" + DateOfBirth
//                + "','" + Nationality + "','" + Religion + "','" + Language
//                + "','" + fNameA + "','" + middleNameA + "','" + lNameA
//                + "','" + Telephone + "','" + State + "','" + enteredDate
//                + "','" + estimatedTime + "');";
//        
//        try {
//            Statement stmt = connection.createStatement();
//            int i = stmt.executeUpdate(sqlQuery);
//            connection.commit();
//             stmt.close();
//            connection.close();
//            
//
//        } catch (Exception e) {
//            System.out.print(e);
//            e.printStackTrace();
//        }
//        return true;
}
