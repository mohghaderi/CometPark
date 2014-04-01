package CometPark;

public class ControllerAccessApi {

	public void ChangeSpaceStatus(int spotId, boolean isVacant) throws Exception {
		
		ParkingSpotController ctrl = new ParkingSpotController();
		ctrl.setIsVacant(spotId, isVacant);
	}
	
}
