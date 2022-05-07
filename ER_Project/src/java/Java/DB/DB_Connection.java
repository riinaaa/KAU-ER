package Java.DB;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DB_Connection {

    String URL = "jdbc:mysql://localhost:3306/er_project?useSSL=false";
    String USERNAME = "root"; // use your username of Mysql server
    String PASSWORD = "Amaali0707"; // use your password of Mysql server
    Connection connection = null;
    PreparedStatement preparedStmt = null;
    ResultSet resultSet = null;
    String sqlQuery = "";

    public Connection getConnection() {
        return connection;
    }

    public DB_Connection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");

            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

        } catch (SQLException e) {
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DB_Connection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   

   

}
