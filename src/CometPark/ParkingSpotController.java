package CometPark;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import CometPark.models.ParkingLot;
import CometPark.models.ParkingSpot;

public class ParkingSpotController extends ControllerBase {
	
	
	
	public String findFreeParkingSpacesJson() throws Exception {
		ArrayList<ParkingSpot> list = getFreeSpacesList();
		return convertArrayListParkingSpaceToJson(list);
	}
	
	

	
	public ArrayList<ParkingSpot> getFreeSpacesList() throws Exception
	{
		try
		{
			OpenConnection();
			
			String sql = "SELECT * FROM ParkingSpot Where IsVacant = 1"; // TODO: Add LastUpdate > now() - one hour
			ResultSet rs = getStatement().executeQuery(sql);
			ArrayList<ParkingSpot> list = createListByResultSet(rs);
			rs.close();
			  
			return list;
		}
		finally
		{
	      CloseConnection();
		}
	}
	
	
	
	public ArrayList<ParkingSpot> getList() throws Exception
	{
		try
		{
			OpenConnection();
			
			String sql = "SELECT * FROM ParkingSpot";
			ResultSet rs = getStatement().executeQuery(sql);
			ArrayList<ParkingSpot> list = createListByResultSet(rs);
			rs.close();
			  
			return list;
		}
		finally
		{
	      CloseConnection();
		}
	}
	
	
	public ParkingSpot getById(int parkingSpotId) throws Exception
	{
		try
		{
			OpenConnection();
			
			String sql = "SELECT * FROM ParkingSpot Where ParkingSpotId = " + parkingSpotId;
			ResultSet rs = getStatement().executeQuery(sql);
			ArrayList<ParkingSpot> list = createListByResultSet(rs);
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


	private ArrayList<ParkingSpot> createListByResultSet(ResultSet rs)
			throws SQLException {
		ArrayList<ParkingSpot> list = new ArrayList<ParkingSpot>();
	      
	      while(rs.next()){
	         //Retrieve by column name
	    	 ParkingSpot item = new ParkingSpot();
	    	 item.setParkingSpotId(rs.getInt("ParkingSpotId"));
	    	 item.setParkingLotId(rs.getInt("ParkingLotId"));
	    	 item.setSpotNumber(rs.getInt("SpotNumber"));
	    	 item.setPermitLevelId(rs.getInt("PermitLevelId"));
	    	 item.setLat(rs.getDouble("Lat"));
	    	 item.setLng(rs.getDouble("Lng"));
	    	 item.setIsVacant(rs.getBoolean("IsVacant"));
	    	 item.setLastUpdate(rs.getTimestamp("LastUpdate"));
	    	 
	    	 list.add(item);
	      }
		return list;
	}
	
	
	

	
	public void setIsVacant(int spotId, boolean isVacant) throws Exception
	{
		try	
		{
			String sql = "Update parkingspot set isVacant = ?, LastUpdate = ? Where ParkingSpotId = ?";
			//String sql = "Update parkingspot set isVacant = ? Where ParkingSpotId = ?";
			
			byte isVacantInt = 0;
			if (isVacant == true)
				isVacantInt = 1;
			
			//Date sqlNow = new Date(new java.util.Date().getTime());
			PreparedStatement updateStatement = getConnection().prepareStatement(sql);
			updateStatement.setBoolean(1, isVacant);
			//updateStatement.setDate(2, sqlNow);
			updateStatement.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
			updateStatement.setInt(3, spotId);
			int count = updateStatement.executeUpdate();
			if (count == 0)
				throw new Exception("ParkingSpotId " + spotId + " is not inserted in the database.");
		}
		finally
		{
	      CloseConnection();
		}
		
	}
	
	
//	
//   //Old Test Return	
//
//
//	private ArrayList<ParkingSpot> getFreeSpacesList() {
//		
//		ArrayList<ParkingSpot> list = new ArrayList<ParkingSpot>();
//		
//		// Lot H
//		list.add(createNewParkingSpace(1, 32.98709,-96.752503));
//		
//		// Lot H
//		list.add(createNewParkingSpace(2, 32.987092,-96.752556));
//		
//		// Lot B
//		list.add(createNewParkingSpace(3, 32.988759, -96.744825));
//
//		// Lot B
//		list.add(createNewParkingSpace(4, 32.988716,-96.744769));
//		
//		return list;
//	}
//	
//	
//	private ParkingSpot createNewParkingSpace(int id, double lat, double lng)
//	{
//		ParkingSpot ps = new ParkingSpot();
//		ps.setParkingLotId(id);
//		ps.setSpotNumber(id);
//		ps.setLat(lat);
//		ps.setLng(lng);
//		return ps;
//	}
	
	private String convertArrayListParkingSpaceToJson(ArrayList<ParkingSpot> list) {
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("{\"markers\":");
		sb.append("[");
		
		int count = list.size();
		
		for(int i = 0; i < list.size(); i++)
		{
			ParkingSpot item = list.get(i);
			sb.append("{");
			
			sb.append("\"lat\":").append(item.getLat());
			sb.append(",");
			sb.append("\"lng\":").append(item.getLng());
			sb.append(",");
			sb.append("\"spotNumber\":").append(item.getSpotNumber());
			
			sb.append("}");
			
			if (i != count - 1)
			{
				sb.append(",");
			}
		}
		
		sb.append("]");
		sb.append("}");
		
		return sb.toString();
	}
}
