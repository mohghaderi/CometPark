package CometParkTest;

import java.util.ArrayList;

import junit.framework.TestCase;

import org.junit.Test;

import CometPark.ControllerController;
import CometPark.SensorLogController;
import CometPark.models.Controller;
import CometPark.models.SensorLog;

public class SensorLogControllerTest extends TestCase {

	@Test
	public void testGetList()
	{
		SensorLogController da = new SensorLogController();
		ArrayList<SensorLog> list;
		try {
			list = da.getList();
			assertTrue(list.size() > 1);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	
	
}
