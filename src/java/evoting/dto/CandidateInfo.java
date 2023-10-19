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
public class CandidateInfo {
    private String candidateId;
    private String candidateName;
    private String party;
    private String symbol;

    public CandidateInfo(String candidateId, String candidateName, String party, String symbol) {
        this.candidateId = candidateId;
        this.candidateName = candidateName;
        this.party = party;
        this.symbol = symbol;
    }

    public CandidateInfo() {
    }

    public void setCandidateId(String candidateId) {
        this.candidateId = candidateId;
    }

    public void setCandidateName(String candidateName) {
        this.candidateName = candidateName;
    }

    public void setParty(String party) {
        this.party = party;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    public String getCandidateId() {
        return candidateId;
    }

    public String getCandidateName() {
        return candidateName;
    }

    public String getParty() {
        return party;
    }

    public String getSymbol() {
        return symbol;
    }

    @Override
    public String toString() {
        return "CandidateInfo{" + "candidateId=" + candidateId + ", candidateName=" + candidateName + ", party=" + party + ", symbol=" + symbol + '}';
    }
}