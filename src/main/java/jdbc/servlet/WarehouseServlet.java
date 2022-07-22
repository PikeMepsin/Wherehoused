package jdbc.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.DAO.MySQLWareDAO;
import jdbc.DAO.WarehouseDAO;
import jdbc.models.Warehouse;

public class WarehouseServlet extends HttpServlet {

  private static final long serialVersionUID = -5963721952084691303L;
  
  private WarehouseDAO wareService;
  
  /**
   * Servlet lifecycle
   */
  
  @Override
  public void init() throws ServletException {
    super.init();
    wareService = new MySQLWareDAO();
  }
  
  @Override
  public void destroy() {
    super.destroy();
  }
  
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    List<Warehouse> wList = wareService.findAll();
    PrintWriter out = resp.getWriter();
    if (wList.size() > 0) {
      out.print(wList);
    }
    resp.setContentType("application/json");
  }
}
