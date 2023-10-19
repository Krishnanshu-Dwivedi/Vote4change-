/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.dao;

import evoting.dbutil.DBConnection;
import evoting.dto.CandidateDTO;
import evoting.dto.CandidateDetails;
import evoting.dto.CandidateInfo;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;

/**
 *
 * @author HP
 */
public class CandidateDAO {
    private static PreparedStatement ps , ps1 , ps2 ,ps3 , ps4 , ps5 , ps6,ps7,ps8;
    private static Statement st;
    static
    {
        try
        {
            st = DBConnection.getConnection().createStatement();
            ps = DBConnection.getConnection().prepareStatement("select max(candidate_id) from candidate");
            ps1 = DBConnection.getConnection().prepareStatement("select username from user_details where adhar_no=?");
            ps2 = DBConnection.getConnection().prepareStatement("select distinct city from user_details");
            ps3 = DBConnection.getConnection().prepareStatement("insert into candidate values(?,?,?,?,?)");
            ps4 = DBConnection.getConnection().prepareStatement("select * from candidate where candidate_id=?");
            ps5 = DBConnection.getConnection().prepareStatement("select candidate_id,username,party,symbol from"
                    + " candidate,user_details where candidate.user_id = user_details.adhar_no ");
                    //+ " and candidate.city = (select city from user_details where adhar_no = ?)");
            ps6 = DBConnection.getConnection().prepareStatement("delete from candidate where candidate_id = ?");
            ps7 = DBConnection.getConnection().prepareStatement("update candidate set party = ? , city = ? where candidate_id = ?");
            ps8 = DBConnection.getConnection().prepareStatement("update user_details set username = ? where adhar_no=?");
        }
        catch(SQLException sqlex)
        {
            sqlex.printStackTrace();
        }
    }
    public static String getNewId() throws SQLException{
        ResultSet rs = ps.executeQuery();
        if(rs.next()){
            String s = rs.getString(1);
            int a = Integer.parseInt(""+s.charAt(3));
            return "C"+(100+a+1);
        }else{
            return "C101";
        }
    }
    public static String getUserNameById(String uid)throws  SQLException{
        ps1.setString(1, uid);
        ResultSet rs = ps1.executeQuery();
        if(rs.next())
        {
            return rs.getString(1);
        }
        return null;
    }
    public static ArrayList<String> getCity() throws SQLException
    {
        ArrayList <String> city = new ArrayList<>();
        ResultSet rs = ps2.executeQuery();
        while(rs.next())
        {
            city.add(rs.getString(1));
        }
        return city;
        
    }
    
    public static boolean addCandidate(CandidateDTO obj)throws SQLException
    {
        ps3.setString(1, obj.getCandidateId());
        ps3.setString(2, obj.getParty());
        ps3.setString(3, obj.getUserid());
        ps3.setBinaryStream(4, obj.getSymbol());
        ps3.setString(5, obj.getCity());
        int x = ps3.executeUpdate();
       
        return ( x != 0);
    }
    
    public static boolean removeCandidate(String cid) throws SQLException{
        try{
        ps6.setString(1, cid);
        int x = ps6.executeUpdate();
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
    
    public static ArrayList<String> getCandidateId() throws SQLException{
        ArrayList <String> candidateIdList = new ArrayList<>();
        ResultSet rs = st.executeQuery("select candidate_id from candidate");
        while(rs.next())
        {
            candidateIdList.add(rs.getString(1));
        }
        return candidateIdList;
    }
    
    public static CandidateDetails getDetailsbyId(String cid) throws Exception
    {
        ps4.setString(1, cid);
        ResultSet rs = ps4.executeQuery();
        CandidateDetails cd = new CandidateDetails();
        Blob blob;
        InputStream inputStream;
        byte[] buffer;
        byte[] imageBytes;
        int bytesRead;
        String base64Image;
        ByteArrayOutputStream outputStream;
        
        if(rs.next()){
            blob = rs.getBlob(4);
            inputStream = blob.getBinaryStream();
            outputStream = new ByteArrayOutputStream();
            buffer = new byte[4096];
            bytesRead = -1;
            while((bytesRead = inputStream.read(buffer)) != -1){
                outputStream.write(buffer , 0 , bytesRead);
            }
            imageBytes = outputStream.toByteArray();
            Base64.Encoder en = Base64.getEncoder();
            base64Image = en.encodeToString(imageBytes);
            cd.setSymbol(base64Image);
            cd.setCandidateId(cid);
            cd.setCandidateName(getUserNameById(rs.getString(3)));
            cd.setParty(rs.getString(2));
            cd.setCity(rs.getString(5));
            cd.setUserid(rs.getString(3));
            return cd;
        }
        return cd;
    }
    
    public static ArrayList<CandidateInfo> viewCandidate(String adhar_no) throws Exception
    {
        ArrayList<CandidateInfo>candidateList = new ArrayList<>();
        //ps5.setString(1, adhar_no);
        ResultSet rs = ps5.executeQuery();
        
        Blob blob;
        InputStream inputStream;
        byte[] buffer;
        byte[] imageBytes;
        int bytesRead;
        String base64Image;
        ByteArrayOutputStream outputStream;
        
        while(rs.next()){
            blob = rs.getBlob(4);
            inputStream = blob.getBinaryStream();
            outputStream = new ByteArrayOutputStream();
            buffer = new byte[4096];
            bytesRead = -1;
            while((bytesRead = inputStream.read(buffer)) != -1){
                outputStream.write(buffer , 0 , bytesRead);
            }
            imageBytes = outputStream.toByteArray();
            Base64.Encoder en = Base64.getEncoder();
            base64Image = en.encodeToString(imageBytes);
            CandidateInfo cd = new CandidateInfo();
            cd.setSymbol(base64Image);
            cd.setCandidateId(rs.getString(1));
            cd.setCandidateName(rs.getString(2));
            cd.setParty(rs.getString(3));
            System.err.println(cd.toString());
            candidateList.add(cd);
            
        }
        System.out.println("***************"+adhar_no +" "+candidateList+"*************");
        return candidateList;
    }

    public static boolean updateCandidate(String cid, String name, String party, String city , String uid)throws SQLException {
        try {
            ps7.setString(1, party);
            ps7.setString(2, city);
            ps7.setString(3, cid);
            ps8.setString(1, name);
            ps8.setString(2, uid);
            int a = ps7.executeUpdate();
            int b = ps8.executeUpdate();
            System.out.println(a + " "+ b);
            return (a != 0 && b != 0);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return false;
    }
    
    
}
