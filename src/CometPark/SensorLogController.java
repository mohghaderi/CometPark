package CometPark;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import CometPark.models.Controller;
import CometPark.models.ParkingSpot;
import CometPark.models.SensorLog;

public class SensorLogController extends ControllerBase {

	
	
	public ArrayList<SensorLog> getList() throws Exception
	{
		try
		{
			OpenConnection();
			
			String sql = "SELECT * FROM sensorlog Order By LogDate DESC LIMIT 1000";
			ResultSet rs = getStatement().executeQuery(sql);
			ArrayList<SensorLog> list = createListByResultSet(rs);
			rs.close();
			  
			return list;
		}
		finally
		{
	      CloseConnection();
		}
	}
		


	private ArrayList<SensorLog> createListByResultSet(ResultSet rs)
			throws SQLException {
		ArrayList<SensorLog> list = new ArrayList<SensorLog>();
	      
	      while(rs.next()){
	         //Retrieve by column name
	    	 SensorLog item = new SensorLog();
	    	 item.setLogId(rs.getLong("LogId"));
	    	 item.setLogDate(rs.getTimestamp("LogDate"));
	    	 item.setSensorId(rs.getInt("SensorId"));
	    	 item.setNewIsVacant(rs.getBoolean("NewIsVacant"));
	    	 
	    	 list.add(item);
	      }
		return list;
	}
	
	
	public String getListJson() throws Exception {
		ArrayList<SensorLog> list = getList();
		return convertArrayListToJson(list);
	}



	private String convertArrayListToJson(ArrayList<SensorLog> list) {
		StringBuilder sb = new StringBuilder();
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd     HH:mm:ss");
		
//		sb.append("{"); // jqGrid settings
//		sb.append("\"page\": \"1\",");
//		sb.append("\"records\": ").append("\"").append(list.size()).append("\",");
//		sb.append("\"rows\": ");


		sb.append("[");
		
		int count = list.size();
		
		for(int i = 0; i < list.size(); i++)
		{
			SensorLog item = list.get(i);
			sb.append("{");
			
			sb.append("\"LogDate\":").append("\"").append(dateFormatter.format(item.getLogDate())).append("\"");
			sb.append(",");
			sb.append("\"SensorId\":").append(item.getSensorId());
			sb.append(",");
			sb.append("\"NewIsVacant\":").append(item.getNewIsVacant());

			
			sb.append("}");
			
			if (i != count - 1)
			{
				sb.append(",");
			}
		}
		
		sb.append("]");
		
//		sb.append("}"); // jqGrid settings
		
		return sb.toString();
	}
	
	
	
	
	
	
	
	
	
	// we only insert it in our ParkingSpotController.setIsVacant
	// because of not having connection pooling, we can't use the method here.
	
	
//	public void insert(SensorLog model) throws Exception
//	{
//		try	
//		{
//			String sql = "INSERT INTO `sensorlog` (`LogDate`, `SensorId`, `NewIsVacant`) VALUES (?, ?, ?);";
//
//			PreparedStatement updateStatement = getConnection().prepareStatement(sql);
//
//			updateStatement.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
//			updateStatement.setInt(2, model.getSensorId());
//			updateStatement.setBoolean(3, model.getNewIsVacant());
//
//			int count = updateStatement.executeUpdate();
//			if (count == 0)
//				throw new Exception("SensorLog.insert failed.");
//		}
//		finally
//		{
//	      CloseConnection();
//		}
//		
//	}
	
	
	
	
	
}
