package jdbc.models;

public class Warehouse {
  // ID auto-increments
  private int whID;
  private String designation;
  private String address;
  private int numShelves;
  
  public Warehouse() {
    
  }
  
  public Warehouse(String d, String a, int nS) {
    this.designation = d;
    this.address = a;
    this.numShelves = nS;
  }
  
  public int getWHiD() {
    return whID;
  }
    
  public String getDesignation() {
    return designation;
  }

  public void setDesignation(String designation) {
    this.designation = designation;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public int getNumShelves() {
    return numShelves;
  }

  public void setNumShelves(int numShelves) {
    this.numShelves = numShelves;
  }

  public String toString() {
    return designation;
    
  }
}
