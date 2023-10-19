/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.dto;

import java.io.InputStream;

/**
 *
 * @author HP
 */
public class CandidateDTO {
    private String candidateId;
    private String party;
    private String city;
    private String userid;
    private InputStream symbol;

    public CandidateDTO(String candidateId, String party, String city, String userid, InputStream symbol) {
        this.candidateId = candidateId;
        this.party = party;
        this.city = city;
        this.userid = userid;
        this.symbol = symbol;
    }

    public CandidateDTO() {
    }

    public String getCandidateId() {
        return candidateId;
    }

    public String getParty() {
        return party;
    }

    public String getCity() {
        return city;
    }

    public String getUserid() {
        return userid;
    }

    public InputStream getSymbol() {
        return symbol;
    }

    public void setCandidateId(String candidateId) {
        this.candidateId = candidateId;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setSymbol(InputStream symbol) {
        this.symbol = symbol;
    }
    
    
}
