package jdbc.DAO;

import java.util.List;
import jdbc.models.Item;

// Item queries
public interface ItemDAO {
  
  public List<Item> findAll();
  
  public Item findById(int id);
  
  // potentially "void" operation should probably come back
  // with Item (impossible to know with auto-increment)
  // or (more is more approach) return the Item itself
  public Item addNew(Item item);
  public void updateItem(Item item); // contains the ID and updates entry
  public void updateItem(int id);
  public void delItem(Item item);
  public void delItem(int id); // overloaded for completeness but we probably only need this one
}
