package jdbc.DAO;

import java.util.List;
import jdbc.models.Shelf;

// Shelf queries
public interface ShelfDAO {
  
  public List<Shelf> findAll();
  public List<Shelf> findByWid(int id); // all shelves of a particular warehouse
  
  // all shelves of a particular warehouse with capacity >= cap
  public List<Shelf> findByCap(int id, int cap);
  public Shelf findById(int id);
  
  // potentially "void" operation should probably come back
  // with whID (impossible to know with auto-increment)
  // or (more is more approach) return the Shelf itself
  public Shelf addNew(Shelf shelf);
  public void updateShelf(Shelf shelf); // contains the ID and updates entry
  public void updateShelf(int id);
  public void delShelf(Shelf shelf);
  public void delShelf(int id); // overloaded for completeness but we probably only need this one
}
