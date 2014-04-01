package CometParkTest;

import java.util.ArrayList;

import org.junit.Test;

import CometPark.ParkingSpotController;
import CometPark.models.ParkingSpot;
import junit.framework.TestCase;


public class ParkingSpotControllerTest extends TestCase {
	
	@Test
	public void testGetById()
	{
		ParkingSpotController da = new ParkingSpotController();

		try {
			
			int id = 1;
			
			ParkingSpot ps = da.getById(id);
			assertEquals(id, ps.getParkingSpotId());
			assertEquals(32.98709, ps.getLat());
			assertEquals(-96.752503, ps.getLng());
			assertEquals(100, ps.getSpotNumber());
			// and rest
			
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	
	
	@Test
	public void testGetList()
	{
		ParkingSpotController da = new ParkingSpotController();
		ArrayList<ParkingSpot> list;
		try {
			list = da.getList();
			assertTrue(list.size() > 1);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	
	@Test
	public void testSetSpotIsVacant()
	{
		ParkingSpotController da = new ParkingSpotController();

		try {
			int id = 2;
			ParkingSpot ps = da.getById(id);
			
			// one from false to true and one from true to false
			
			// set isVacant to its not
			boolean isVacant = ps.getIsVacant();
			da.setIsVacant(id, !isVacant);
			
			// check if it has changed
			ParkingSpot ps2 = da.getById(id);
			assertEquals(!isVacant, ps2.getIsVacant());

			// returning to its previous status
			da.setIsVacant(id, isVacant);

			// check if it has changed
			ParkingSpot ps3 = da.getById(id);
			assertEquals(isVacant, ps3.getIsVacant());

		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	
	@Test
	public void testGetFreeSpacesList()
	{
		ParkingSpotController da = new ParkingSpotController();

		try {
			ArrayList<ParkingSpot> list = da.getFreeSpacesList();
			
			boolean expected = true;
			
			for(int i = 0; i < list.size(); i++)
			{
				boolean actual = list.get(i).getIsVacant();
				assertEquals(expected, actual);
			}
			

		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
	


	
	
	
	
	
}
