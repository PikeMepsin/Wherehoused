package jdbc.models;

public class Item {
  // ID auto-increments
  private String name;
  private int size;
  
  public Item() {
    
  }
  
  public Item(String name, int size) {
    this.name = name;
    this.size = size;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getSize() {
    return size;
  }

  public void setSize(int size) {
    this.size = size;
  }
  
}
