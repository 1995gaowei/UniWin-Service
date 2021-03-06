package productManage.model.lhj;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.struts2.json.annotations.JSON;

@Entity
@Table (name="vendor")

public class Vendor implements Serializable{
	
	@Id
	private int vendorId;

	private String vendorName;
	
	private String vendorPhoneNum;
	
	private String vendorMobileNum;
	
	private String vendorAddr;
	
	private String vendorRank;
	
	private String vendorArea;
	
	private String vendorOthername;

    private String vendorTaxnumber;

    private String vendorBankname;

    private String vendorBankaccount;

    private String vendorBankaddr;

	/**
     * 供应（商物料对应）表:LHJ
     */
    @OneToMany(mappedBy="vendor",cascade={CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH},fetch=FetchType.LAZY)    
    private Set<Supply> supplys=new HashSet<Supply>();
	
    public Vendor(){
    	
    }
	public int getVendorId() {
		return vendorId;
	}

	public String getVendorName() {
		return vendorName;
	}

	public String getVendorPhoneNum() {
		return vendorPhoneNum;
	}

	public String getVendorMobileNum() {
		return vendorMobileNum;
	}

	public String getVendorAddr() {
		return vendorAddr;
	}

	public String getVendorRank() {
		return vendorRank;
	}

	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}

	public void setVendorName(String vendorName) {
		this.vendorName = vendorName;
	}

	public void setVendorPhoneNum(String vendorPhoneNum) {
		this.vendorPhoneNum = vendorPhoneNum;
	}

	public void setVendorMobileNum(String vendorMobileNum) {
		this.vendorMobileNum = vendorMobileNum;
	}

	public void setVendorAddr(String vendorAddr) {
		this.vendorAddr = vendorAddr;
	}

	public void setVendorRank(String vendorRank) {
		this.vendorRank = vendorRank;
	}
	
	@JSON(serialize=false)
	public Set<Supply> getSupplys() {
		return supplys;
	}
	public void setSupplys(Set<Supply> supplys) {
		this.supplys = supplys;
	}
	

	public String getVendorArea() {
		return vendorArea;
	}
	public void setVendorArea(String vendorArea) {
		this.vendorArea = vendorArea;
	}
	public String getVendorOthername() {
		return vendorOthername;
	}
	public void setVendorOthername(String vendorOthername) {
		this.vendorOthername = vendorOthername;
	}
	public String getVendorTaxnumber() {
		return vendorTaxnumber;
	}
	public void setVendorTaxnumber(String vendorTaxnumber) {
		this.vendorTaxnumber = vendorTaxnumber;
	}
	public String getVendorBankname() {
		return vendorBankname;
	}
	public void setVendorBankname(String vendorBankname) {
		this.vendorBankname = vendorBankname;
	}
	public String getVendorBankaccount() {
		return vendorBankaccount;
	}
	public void setVendorBankaccount(String vendorBankaccount) {
		this.vendorBankaccount = vendorBankaccount;
	}
	public String getVendorBankaddr() {
		return vendorBankaddr;
	}
	public void setVendorBankaddr(String vendorBankaddr) {
		this.vendorBankaddr = vendorBankaddr;
	}
	
}
