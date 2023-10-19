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
public class UserDTO {
    private String userid;
    private String password;
    
    public UserDTO(String user, String password) {
        this.userid = user;
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "user=" + userid + ", password=" + password + '}';
    }

    public String getUserid() {
        return userid;
    }

    public String getPassword() {
        return password;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
}
