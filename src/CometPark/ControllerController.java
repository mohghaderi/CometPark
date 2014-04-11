package CometPark;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import CometPark.models.Controller;
import CometPark.models.ParkingSpot;

/* The name is funny! the first Controller means the controller in our system, 
 * and the next Controller is controller as Model-View-Controller!
 */

public class ControllerController extends ControllerBase {

	
	public ArrayList<Controller> getList() throws Exception
	{
		try
		{
			OpenConnection();
			
			String sql = "SELECT * FROM controller";
			ResultSet rs = getStatement().executeQuery(sql);
			ArrayList<Controller> list = createListByResultSet(rs);
			rs.close();
			  
			return list;
		}
		finally
		{
	      CloseConnection();
		}
	}
			

	private ArrayList<Controller> createListByResultSet(ResultSet rs)
			throws SQLException {
		ArrayList<Controller> list = new ArrayList<Controller>();
	      
	      while(rs.next()){
	         //Retrieve by column name
	    	 Controller item = new Controller();
	    	 item.setControllerId(rs.getInt("ControllerId"));
	    	 item.setLastLiveUpdate(rs.getDate("LastLiveUpdate"));
	    	 item.setLat(rs.getDouble("Lat"));
	    	 item.setLng(rs.getDouble("Lng"));
	    	 
	    	 
	    	 list.add(item);
	      }
		return list;
	}
	
	public Controller getById(int controllerId) throws Exception
	{
		try
		{
			OpenConnection();
			
			String sql = "SELECT * FROM controller Where ControllerId = " + controllerId;
			ResultSet rs = getStatement().executeQuery(sql);
			ArrayList<Controller> list = createListByResultSet(rs);
			rs.close();
			
			if (list.size() > 0)
				return list.get(0);
			else
				return null;
		}
		finally
		{
	      CloseConnection();
		}
	}
	
	public void delete(int controllerId) throws Exception
	{
		try
		{
			String sql = "DELETE FROM controller Where ControllerId = ?";
			PreparedStatement updateStatement = getConnection().prepareStatement(sql);
			updateStatement.setInt(1, controllerId);
			int count = updateStatement.executeUpdate();
			if (count == 0)
				throw new Exception("Controller.delete failed for ControllerId:" + controllerId);
		}
		finally
		{
	      CloseConnection();
		}	
	}
	
	
	
	public void insert(Controller model) throws Exception
	{
		try	
		{
			String sql = "INSERT INTO `controller` (`ControllerId`, `LastLiveUpdate`, `Lat`, `Lng`) VALUES (?, ?, ?, ?);";

			PreparedStatement updateStatement = getConnection().prepareStatement(sql);

			updateStatement.setInt(1, model.getControllerId());
			updateStatement.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
			updateStatement.setDouble(3, model.getLat());
			updateStatement.setDouble(4, model.getLng());

			int count = updateStatement.executeUpdate();
			if (count == 0)
				throw new Exception("Controller.insert failed.");
		}
		finally
		{
	      CloseConnection();
		}
		
	}
	
	
	
}
