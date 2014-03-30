<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%><%@ page import="java.util.List" %><%@ page import="CometPark.ControllerAccessApi" %><%


String msg = "";
String sidString = request.getParameter("sid");
String isVacantString = request.getParameter("isVacant");
if (sidString == null || isVacantString == null)
{
	msg = "sid and isVacant parameters can not be null";
}
else
{
	// parsing information and updating through API
	ControllerAccessApi api = new ControllerAccessApi();
	int sid = -1;
	boolean isVacant = false;


	try
	{

		sid = Integer.parseInt(sidString);
		isVacant = Boolean.parseBoolean(isVacantString);

		api.ChangeSpaceStatus(sid, isVacant);
		msg = "OK. Sensor: " + String.valueOf(sid) + ", IsVacant: " + String.valueOf(isVacant);
	}
	catch(Exception ex)
	{
		msg = "Error: " + ex.getMessage();
	}
}


%><%= msg %>