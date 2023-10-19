/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.dto;

/**
 *
 * @author HP
 */
public class UserDetails {
    private String username;
    private String userid;
    private String email;
    private String address;
    private long mobile;
    private String city;
    private String password;

    public UserDetails(){
        
    }
    public UserDetails(String username, String userid, String email, String address, long mobile, String city, String password) {
        this.username = username;
        this.userid = userid;
        this.email = email;
        this.address = address;
        this.mobile = mobile;
        this.city = city;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getUserid() {
        return userid;
    }

    public String getEmail() {
        return email;
    }

    public String getAddress() {
        return address;
    }

    public long getMobile() {
        return mobile;
    }

    public String getCity() {
        return city;
    }

    public String getPassword() {
        return password;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setMobile(long mobile) {
        this.mobile = mobile;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserDetails{" + "username=" + username + ", userid=" + userid + ", email=" + email + ", address=" + address + ", mobile=" + mobile + ", city=" + city + ", password=" + password + '}';
    }
    
    

}
