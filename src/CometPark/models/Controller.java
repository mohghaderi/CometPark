package CometPark.models;

import java.util.Date;

public class Controller {

	private int controllerId;
	private Date lastLiveUpdate;
	private double lat;
	private double lng;
	
	
	public int getControllerId() {
		return controllerId;
	}
	public void setControllerId(int controllerId) {
		this.controllerId = controllerId;
	}
	public Date getLastLiveUpdate() {
		return lastLiveUpdate;
	}
	public void setLastLiveUpdate(Date lastLiveUpdate) {
		this.lastLiveUpdate = lastLiveUpdate;
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
	
	
	
}
