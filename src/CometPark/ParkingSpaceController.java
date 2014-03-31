package CometPark;

import java.util.ArrayList;
import CometPark.models.ParkingSpace;

public class ParkingSpaceController {
	
	
	
	public String FindFreeParkingSpacesJson() {
		ArrayList<ParkingSpace> list = new ArrayList<ParkingSpace>();
		
		LoadFreeParkingSpaceFromDatabase(list);
		return ConvertArrayListParkingSpaceToJson(list);
	}
	
	
	
	
	


	private void LoadFreeParkingSpaceFromDatabase(ArrayList<ParkingSpace> list) {
		// Lot H
		list.add(CreateNewParkingSpace(1, 32.98709,-96.752503));
		
		// Lot H
		list.add(CreateNewParkingSpace(2, 32.987092,-96.752556));
		
		// Lot B
		list.add(CreateNewParkingSpace(3, 32.988759, -96.744825));

		// Lot B
		list.add(CreateNewParkingSpace(4, 32.988716,-96.744769));
	}
	
	
	private ParkingSpace CreateNewParkingSpace(int id, double lat, double lng)
	{
		ParkingSpace ps = new ParkingSpace();
		ps.Id = id;
		ps.Lat = lat;
		ps.Lng = lng;
		return ps;
	}
	
	private String ConvertArrayListParkingSpaceToJson(ArrayList<ParkingSpace> list) {
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("{\"markers\":");
		sb.append("[");
		
		int count = list.size();
		
		for(int i = 0; i < list.size(); i++)
		{
			ParkingSpace item = list.get(i);
			sb.append("{");
			
			sb.append("\"lat\":").append(item.Lat);
			sb.append(",");
			sb.append("\"lng\":").append(item.Lng);
			sb.append(",");
			sb.append("\"id\":").append(item.Id);
			
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
