package CometPark;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import CometPark.models.ParkingLot;

public class ParkingLotController extends ControllerBase {


	
	public ArrayList<ParkingLot> getList() throws Exception
	{
		try
		{
			OpenConnection();
			
			String sql = "SELECT * FROM parkinglot";
			ResultSet rs = getStatement().executeQuery(sql);
			ArrayList<ParkingLot> list = createListByResultSet(rs);
			rs.close();
			  
			return list;
		}
		finally
		{
	      CloseConnection();
		}
	}
		


	private ArrayList<ParkingLot> createListByResultSet(ResultSet rs)
			throws SQLException {
		ArrayList<ParkingLot> list = new ArrayList<ParkingLot>();
	      
	      while(rs.next()){
	         //Retrieve by column name
	    	 ParkingLot item = new ParkingLot();
	    	 item.setParkingLotId(rs.getInt("ParkingLotId"));
	    	 item.setParkingLotName(rs.getString("ParkingLotName"));
	    	 item.setCenterLat(rs.getDouble("CenterLat"));
	    	 item.setCenterLng(rs.getDouble("CenterLng"));
	    	 
	    	 list.add(item);
	      }
		return list;
	}
	
}
