package jdbc.models;

public class Shelf {
  // ID auto-increments
  private int whID;
  private int capacity;
  
  public Shelf() {
    
  }
  
  public Shelf(int wID) {
    this.whID = wID;
    this.capacity = 1000;
  }

  public int getWhID() {
    return whID;
  }

  public void setWhID(int whID) {
    this.whID = whID;
  }

  public int getCapacity() {
    return capacity;
  }

  public void setCapacity(int capacity) {
    this.capacity = capacity;
  }

}
