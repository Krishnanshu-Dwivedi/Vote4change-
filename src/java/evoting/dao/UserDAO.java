/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.dao;

import evoting.dto.UserDTO;
import evoting.dto.UserDetails;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import evoting.dbutil.DBConnection;

/**
 *
 * @author HP
 */
public class UserDAO {
      private static PreparedStatement ps,ps1;
      private static Statement st,st1;
    static
    {
        try
        {
            ps = DBConnection.getConnection().prepareStatement("select user_type from user_details where adhar_no = ? and password = ?");
            ps1 = DBConnection.getConnection().prepareStatement("delete from user_details where adhar_no = ? ");
            st1 = DBConnection.getConnection().createStatement();
            st = DBConnection.getConnection().createStatement();
        }
        catch(SQLException sqlex)
        {
            sqlex.printStackTrace();
        }
       
    }
     public static String validateUser( UserDTO user) throws SQLException{
            ps.setString(1, user.getUserid());
            ps.setString(2 , user.getPassword());
            ResultSet rs =  ps.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
            return null;
      }
     public static ArrayList<String> getUsers() throws SQLException{
         ArrayList<String> id = new ArrayList<>();
         ResultSet rs = st.executeQuery("select adhar_no from user_details");
         while(rs.next()){
             id.add(rs.getString(1));
         }
         return id;
     }
      public static boolean removeUser(String uid) throws SQLException{
        try{
        ps1.setString(1, uid);
        int x = ps1.executeUpdate();
        if(x >0){
              return true;
            }
            
        }
        catch(SQLException s){
            s.printStackTrace();
            System.out.println(s.getMessage());
        }
        return false;
    }
      
    public static ArrayList<UserDetails> getDetailsById() throws SQLException{
        ResultSet rs = st1.executeQuery("select * from user_details");
        ArrayList<UserDetails> ls = new ArrayList<>();
        while(rs.next()){
            UserDetails ud = new UserDetails(rs.getString(3), rs.getString(1), rs.getString(6), rs.getString(4), rs.getLong(7), rs.getString(5), rs.getString(2));
            ls.add(ud);
        }
        return ls;
        
    }  
}
