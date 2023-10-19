/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package evoting.dto;

import java.util.Objects;

/**
 *
 * @author HP
 */
public class CandidateDetails {

    private String candidateId;
    private String userid;
    private String candidateName;
    private String symbol;
    private String party;
    private String city;

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + Objects.hashCode(this.candidateId);
        hash = 29 * hash + Objects.hashCode(this.userid);
        hash = 29 * hash + Objects.hashCode(this.candidateName);
        hash = 29 * hash + Objects.hashCode(this.symbol);
        hash = 29 * hash + Objects.hashCode(this.party);
        hash = 29 * hash + Objects.hashCode(this.city);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final CandidateDetails other = (CandidateDetails) obj;
        if (!Objects.equals(this.candidateId, other.candidateId)) {
            return false;
        }
        if (!Objects.equals(this.userid, other.userid)) {
            return false;
        }
        if (!Objects.equals(this.candidateName, other.candidateName)) {
            return false;
        }
        if (!Objects.equals(this.symbol, other.symbol)) {
            return false;
        }
        if (!Objects.equals(this.party, other.party)) {
            return false;
        }
        if (!Objects.equals(this.city, other.city)) {
            return false;
        }
        return true;
    }
    
    

    public CandidateDetails(String candidateId, String userid, String candidateName, String symbol, String party, String city) {
        this.candidateId = candidateId;
        this.userid = userid;
        this.candidateName = candidateName;
        this.symbol = symbol;
        this.party = party;
        this.city = city;
    }

    public String getCandidateId() {
        return candidateId;
    }

    public String getUserid() {
        return userid;
    }

    public String getCandidateName() {
        return candidateName;
    }

    public String getSymbol() {
        return symbol;
    }

    public String getParty() {
        return party;
    }

    public String getCity() {
        return city;
    }

    public void setCandidateId(String candidateId) {
        this.candidateId = candidateId;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setCandidateName(String candidateName) {
        this.candidateName = candidateName;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return "CandidateDetails{" + "candidateId=" + candidateId + ", userid=" + userid + ", candidateName=" + candidateName + ", symbol=" + symbol + ", party=" + party + ", city=" + city + '}';
    }

    public CandidateDetails() {
    }

}
