package CometPark.models;

import java.util.Date;

public class SensorLog {
	
	private long logId;
	private Date logDate;
	private int sensorId;
	private boolean newIsVacant;
	
	public long getLogId() {
		return logId;
	}
	public void setLogId(long logId) {
		this.logId = logId;
	}
	public Date getLogDate() {
		return logDate;
	}
	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}
	public int getSensorId() {
		return sensorId;
	}
	public void setSensorId(int sensorId) {
		this.sensorId = sensorId;
	}
	public boolean getNewIsVacant() {
		return newIsVacant;
	}
	public void setNewIsVacant(boolean newIsVacant) {
		this.newIsVacant = newIsVacant;
	}

}
