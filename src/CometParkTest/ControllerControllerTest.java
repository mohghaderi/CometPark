package CometParkTest;

import java.util.ArrayList;

import org.junit.Test;

import CometPark.ControllerController;
import CometPark.models.Controller;
import junit.framework.TestCase;

public class ControllerControllerTest extends TestCase {
	
	@Test
	public void testGetList()
	{
		ControllerController da = new ControllerController();
		ArrayList<Controller> list;
		try {
			list = da.getList();
			assertTrue(list.size() > 0);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	@Test
	public void testInsert()
	{
		int controllerId = 1000;
		Controller model = new Controller();
		model.setControllerId(controllerId);
		model.setLat(32.989962);
		model.setLng(-96.744858);
		
		ControllerController da = new ControllerController();

		try {
			da.insert(model);
			Controller savedController = da.getById(controllerId);
			assertTrue(savedController != null);
			da.delete(controllerId);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	
	
}
