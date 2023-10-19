
package evoting.dbutil;

import java.sql.*;

public class DBConnection {
    private static Connection conn = null;
    static{
        try
        {
            Class.forName("oracle.jdbc.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@//Krishnanshu-Dwivedi:1521/xe" , "vote4change" , "java");
            System.out.println("Driver loaded and conn opened");
        }
        catch(ClassNotFoundException cnf)
        {
            cnf.printStackTrace();
        }catch(SQLException s){
            s.printStackTrace();
        }
    }
    public static Connection getConnection(){
        return conn;
    }
    public static void closeConnection(){
        try{
            if(conn != null){
                conn.close();
            }
        }
        catch(SQLException sqlex){
            sqlex.printStackTrace();
        }
    }
    

}
