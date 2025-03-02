package test;

import java.io.Serializable;
@SuppressWarnings("serial")
public class CustomerBean implements Serializable{
	private String  custNm, custCt, custMid ,custId;
	private long custPhno;
	public CustomerBean() {}
	
	public String getCustNm() {
		return custNm;
	}
	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}
	public String getCustCt() {
		return custCt;
	}
	public void setCustCt(String custCt) {
		this.custCt = custCt;
	}
	public String getCustMid() {
		return custMid;
	}
	public void setCustMid(String custMid) {
		this.custMid = custMid;
	}
	public long getCustPhno() {
		return custPhno;
	}
	public void setCustPhno(long custPhno) {
		this.custPhno = custPhno;
	}
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
		
}