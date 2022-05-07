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

public class DB_ConnectionM {

    String URL = "jdbc:mysql://localhost:3306/er_project?useSSL=false";
    String USERNAME= "root"; // use your username of Mysql server
    String PASSWORD ="rootbeer"; // use your password of Mysql server
    Connection connection = null;
    PreparedStatement preparedStmt = null;
    ResultSet resultSet = null;
    String sqlQuery = "";

    public DB_ConnectionM(){
        try{
            Class.forName("com.mysql.jdbc.Driver");

            connection = DriverManager.getConnection(URL,USERNAME,PASSWORD);

        }catch(SQLException e){
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DB_Connection.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 
    
    public ResultSet getMydatabase() {
        sqlQuery = "SELECT * FROM maintriage;";
        
        try{
            preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
        }catch(SQLException e){}
        return resultSet;
    }
    
    

    public int addmaintriage(String PatientIDm, int BloodPressure, int OxygenSaturation, int Heartrate, int Respiratoryrate, String ECG, int Glucose, int PH, int CO2, int HCO3, int pO2, int SO2, int Baseexcess, String Chiefcomplain, int CTASscore, int Temperature) {
        sqlQuery = "insert into maintriage(MainPatientID,BloodPressure,Oxygensaturation,Heartrate,Respiratoryrate,ECG,Glucose,PH,CO2,HCO2,pO2,SO2,Baseexcess,Chiefcomplain,CTASscore,Temperature)values('" + PatientIDm + "','" + BloodPressure
                + "','" + OxygenSaturation + "','" + Heartrate + "','" + Respiratoryrate + "','" + ECG + "','" + Glucose + "','" + PH + "','" + CO2 + "','" + HCO3 + "','" + pO2 + "','" + SO2 + "','" + Baseexcess + "','" + Chiefcomplain + "','" + CTASscore + "','" + Temperature +"');";
Boolean s=false;
int i=0;
        try{
            Statement stmt = connection.createStatement();
             i=stmt.executeUpdate(sqlQuery);
                if(i==0){
                s=false;
                }
        }
        catch(Exception e){
            //System.out.print(e);
            e.printStackTrace();
        }
        return i;
    }
        public void close(){
            try{
                connection.close();
            }catch(SQLException ex){
                Logger.getLogger(URL);
            }
        }
    }
    