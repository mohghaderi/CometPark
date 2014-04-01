package CometPark.models;

import java.util.Date;

public class ParkingSpot {
	
	private int parkingSpotId;
	private int parkingLotId;
	private int spotNumber;
	private int permitLevelId;
	private double lat;
	private double lng;
	private boolean isVacant;
	private Date lastUpdate;
	
	
	
	public int getParkingSpotId() {
		return parkingSpotId;
	}
	public void setParkingSpotId(int parkingSpotId) {
		this.parkingSpotId = parkingSpotId;
	}
	public int getParkingLotId() {
		return parkingLotId;
	}
	public void setParkingLotId(int parkingLotId) {
		this.parkingLotId = parkingLotId;
	}
	public int getSpotNumber() {
		return spotNumber;
	}
	public void setSpotNumber(int spotNumber) {
		this.spotNumber = spotNumber;
	}
	public int getPermitLevelId() {
		return permitLevelId;
	}
	public void setPermitLevelId(int permitLevelId) {
		this.permitLevelId = permitLevelId;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public boolean getIsVacant() {
		return isVacant;
	}
	public void setIsVacant(boolean isVacant) {
		this.isVacant = isVacant;
	}
	public Date getLastUpdate() {
		return lastUpdate;
	}
	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}
	
	
	
	
	
	
}
