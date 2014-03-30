package CometPark;

public class ControllerAccessApi {

	public void ChangeSpaceStatus(int sid, boolean isVacant) throws Exception {
		
		if (sid < 1 || sid > 4)
			throw new Exception("SensorID " + String.valueOf(sid) + " is not defined.");
		
		
	}
	
}
