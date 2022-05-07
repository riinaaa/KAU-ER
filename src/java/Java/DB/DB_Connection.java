package Java.DB;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DB_Connection {

    String URL = "jdbc:mysql://localhost:3306/er_project?useSSL=false";
    String USERNAME = "root"; // use your username of Mysql server
    String PASSWORD = "rootbeer"; // use your password of Mysql server
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
 public ResultSet getRoomsall() {
        sqlQuery = "SELECT * FROM rooms";
        try{
            if(connection!=null){
            preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
            }  
        }catch(SQLException e){}
        return resultSet;
    }
    public ResultSet getRoom(int room) {
        sqlQuery = "SELECT * FROM rooms WHERE roomNumber= "+room;
        try{
            if(connection!=null){
            preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
            }  
        }catch(SQLException e){}
        return resultSet;
    }
    
    public boolean addRoom(int room,int bed,String name) {
        boolean s =true;
        String state="available";
        sqlQuery = "INSERT INTO rooms (roomNumber, numberOfbeds, state,roomName)values(' " + room + " ' , ' "  + bed
                + " ',' " + state + " ',' " + name+" ');";
        try{
            Statement stmt = (Statement) connection.createStatement();
            int i=stmt.executeUpdate(sqlQuery);
            if(i==0&&i==1){
                s =false;
            }

        }
        catch(Exception e){
            //System.out.print(e);
            e.printStackTrace();
        }
        return s;
    }
    public int checkstate(int room){
       
        int bed=0;
       
        String name="";
        int i=0;
        try{
            String state="";
       resultSet= getRoom(room);
         while(resultSet.next()) { 
                 int R=  resultSet.getInt("roomNumber");
                   bed  = resultSet.getInt("numberOfbeds");
                         state=resultSet.getString("state");
                         name =resultSet.getString("roomName");
            }
         if("busy".equals(state) ){
            resultSet= getbeds(room);
         System.out.println("bbbbb");
            while(resultSet.next()) { 
                 int R=  resultSet.getInt("bedID");
                     int num   = resultSet.getInt("paitentID");
                        String g =resultSet.getString("roomNumber");
                       String  a =resultSet.getString("state");
                       System.out.println(a);
                         if(a.equals("available")){
                              System.out.println("aaaa");
                           i=  updatebed(room, bed, "available",name);
                            return i; 
                         }
         }
        }

         if("available".equals(state)){
             resultSet= getbeds(room);
         System.out.println("bbbbb");
            while(resultSet.next()) { 
                 int R=  resultSet.getInt("bedID");
                     int num   = resultSet.getInt("paitentID");
                        String g =resultSet.getString("roomNumber");
                       String  a =resultSet.getString("state");
                       System.out.println(a);
                         if(a.equals("available")){
                              System.out.println("aaaa");
                           i=  updatebed(room, bed, "available",name);
                            return i; 
                         }
         } 
             i=  updatebed(room, bed, "busy",name);
         }
        }
         catch(SQLException e){
             e.printStackTrace();
             }
        return i;
    }
public int updatebed(int room, int bed, String state,String name)  {
   sqlQuery = "Update rooms set numberOfbeds=? ,state=?, roomName=? WHERE roomNumber = "+room;
   int i=0;
   try{
    preparedStmt = connection.prepareStatement(sqlQuery);
            preparedStmt.setInt(1, bed);
            preparedStmt.setString(2, state);
            preparedStmt.setString(3, name);
     i=preparedStmt.executeUpdate();
}
     catch(SQLException e){
             e.printStackTrace();
             }
   return  i;
}

public boolean updatebedQ(int room, int bed, String state,String name)  {
      int num =0;
        int i=0;
        boolean s = true;
    try{
          
    sqlQuery = "SELECT * FROM rooms WHERE roomNumber= "+room;
              preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
            while(resultSet.next()) { 
                 int R=  resultSet.getInt("roomNumber");
                 System.out.println(".ll;jjjjjjjjjjjjjjjjjj");
                     num   = resultSet.getInt("numberOfbeds");
                         String b=resultSet.getString("state");
                         String g =resultSet.getString("roomName");
            }
            if(num<bed){
                 System.out.println("nnnnnnnnnnnnn");
                num = bed-num;
                 for ( i = num; i < bed; i++) {
                    addBed(i , room ,"1806231" );
                } 
           if(num>bed){
               
           }
            }

            i =updatebed(room,bed,state,name);
      if(i==0&&i==1){
                s =false;
            }
      
}
     catch(SQLException e){
             e.printStackTrace();
             }
       
   return s;
}

       
   public void close(){
       try{
       connection.close();
       }
       catch(SQLException ex){
           Logger.getLogger(DB_Connection.class.getName()).log(Level.SEVERE, null , ex);
       }
       
   }
   public boolean addBed(int bedID,int room,String patient) {
        boolean s =true;
        String state;
      
        if(patient!=null){
            state = "busy";
        }
         state="available";
        sqlQuery = "INSERT INTO beds (bedID, roomNumber, state)values(' " + bedID  
                + " ',' " + room + " ','" +state+"');";
        try{
            Statement stmt =  connection.createStatement();
            int i=stmt.executeUpdate(sqlQuery);
            if(i==0&&i==1){
                s =false;
            }

        }
        catch(Exception e){
            //System.out.print(e);
            e.printStackTrace();
        }
        return s;
    }
   public ResultSet getbeds(int room) {
        sqlQuery = "SELECT * FROM beds WHERE roomNumber= "+room;
        try{
            if(connection!=null){
            preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
            }  
        }catch(SQLException e){}
        return resultSet;
    }
    public ResultSet getBedssall() {
        sqlQuery = "SELECT * FROM beds";
        try{
            if(connection!=null){
            preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
            }  
        }catch(SQLException e){}
        return resultSet;
    }
    
    public ResultSet getbed(int room,int bed) {
        sqlQuery = "SELECT * FROM beds WHERE roomNumber= "+room+" AND bedID="+bed;
        try{
            if(connection!=null){
            preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
            }  
        }catch(SQLException e){}
        return resultSet;
    }
    public int updatebed(int bed, String patient, int room,String state)  {
   sqlQuery = "Update beds set bedID=? ,paitentID=?, roomNumber=? , state=? WHERE roomNumber = "+room+" AND bedID="+bed;
   int i=0;
   try{
    preparedStmt = connection.prepareStatement(sqlQuery);
            preparedStmt.setInt(1, bed);
            preparedStmt.setString(2, patient);
            preparedStmt.setInt(3, room);
            preparedStmt.setString(4, state);
     i=preparedStmt.executeUpdate();
}
     catch(SQLException e){
             e.printStackTrace();
             }
   return  i;
}
public void deleteBed(int room,int bed) {
        sqlQuery = "Delete FROM beds WHERE roomNumber= "+room+" AND bedID="+bed;
        try{
          
            preparedStmt = connection.prepareStatement(sqlQuery);
          int  x= preparedStmt.executeUpdate();
            System.out.println(x);
           int i = getbedsQ( room);
                System.out.println(i+"lll");
           updatebedQ(room,bed, i-1);
            
            
        }catch(SQLException e){ e.printStackTrace();}
       
    }
public void updatebedQ(int room, int bed, int num)  {
    System.out.println(num+"hhh");
   sqlQuery = "Update rooms set numberOfbeds=? WHERE roomNumber = "+room;
  
   try{
       System.out.println("qq");
    preparedStmt = connection.prepareStatement(sqlQuery);
            preparedStmt.setInt(1, num);
           
     preparedStmt.executeUpdate();
        System.out.println("bv");
}
     catch(SQLException e){
             e.printStackTrace();
             }

}
 public int getbedsQ(int room) {
     int num=0;
      sqlQuery = "SELECT * FROM rooms WHERE roomNumber= "+room;
         try{     preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
            while(resultSet.next()) { 
                 int R=  resultSet.getInt("roomNumber");
                 System.out.println(".ll;jjjjjjjjjjjjjjjjjj");
                     num   = resultSet.getInt("numberOfbeds");
                         String b=resultSet.getString("state");
                         String g =resultSet.getString("roomName");
                         return num;
            }
        /*sqlQuery = "SELECT numberOfbeds FROM room WHERE roomNumber= "+room;
        int i=0;
        try{
                System.out.println("334");
            preparedStmt = connection.prepareStatement(sqlQuery);
            resultSet = preparedStmt.executeQuery();
          i =resultSet.getInt("numberOfbeds");
          System.out.println(i+"current");
           */
        }catch(SQLException e){
         e.printStackTrace();}
        return num;
    }
}