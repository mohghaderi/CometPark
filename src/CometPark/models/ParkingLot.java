package CometPark.models;

public class ParkingLot {
	
	private int parkingLotId;
	private String parkingLotName;
	private double centerLat;
	private double centerLng;
	
	
	public int getParkingLotId() {
		return parkingLotId;
	}
	public void setParkingLotId(int parkingLotId) {
		this.parkingLotId = parkingLotId;
	}
	public String getParkingLotName() {
		return parkingLotName;
	}
	public void setParkingLotName(String parkingLotName) {
		this.parkingLotName = parkingLotName;
	}
	public double getCenterLat() {
		return centerLat;
	}
	public void setCenterLat(double centerLat) {
		this.centerLat = centerLat;
	}
	public double getCenterLng() {
		return centerLng;
	}
	public void setCenterLng(double centerLng) {
		this.centerLng = centerLng;
	}
	
	
	
}
