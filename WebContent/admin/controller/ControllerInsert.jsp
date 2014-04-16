<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="CometPark.ControllerController" %>
    <%@ page import="CometPark.models.*" %>


<%! 

	public String createAlert(boolean success, String msg) {
		
		if (success == true)
			return "<div class=\"alert alert-success\">" + msg + "</div>";
		else
			return "<div class=\"alert alert-danger\">" + msg + "</div>";		
	}

%>


<%
	String alertComponent = "";
	Controller model = new Controller();

	String ControllerIDString = request.getParameter("ControllerId");
	

	
	boolean isPostMethod = request.getMethod().equals("POST");
	if (isPostMethod) {
		
		// TODO: add better exception handling and management here.
		// TODO: make form submission using Ajax
		// TODO: define scenario for navigating to other pages after submission
		try
		{
			ControllerController ctrl = new ControllerController();
			
			
			model.setControllerId(Integer.parseInt(request.getParameter("ControllerId")));
			model.setLat(Double.parseDouble(request.getParameter("Lat")));
			model.setLng(Double.parseDouble(request.getParameter("Lng")));
			
			ctrl.insert(model);
			alertComponent += createAlert(true, "Information inserted successfully!");
		}
		catch (Exception ex)
		{
			alertComponent += createAlert(false, ex.getMessage());
			ex.printStackTrace();
		}
		
	}


%>

    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>Controller Insert</title>
	
	<link rel="stylesheet" type="text/css" href="../../plugins/bootstrap/css/bootstrap.min.css" />
	<script src="../../plugins/jquery/jquery.js" type="text/javascript"></script>

</head>
<body>

	<!--  Created using:   http://bootsnipp.com/forms?version=3 -->

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Controller Insert</h3>
  </div>
  <div class="panel-body">
  
  	<%= alertComponent %>
		
	<form class="form-horizontal" method="POST">
	<fieldset>
	
	<!-- Form Name -->
	<!-- <legend>Controller Insert</legend> -->
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="ControllerId">Controller ID</label>  
	  <div class="col-md-4">
	  <input id="ControllerId" name="ControllerId" type="text" placeholder="Controller ID" class="form-control input-md" required="" value="${param.ControllerId}">
	    
	  </div>
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="Lat">Latitude</label>  
	  <div class="col-md-5">
	  <input id="Lat" name="Lat" type="text" placeholder="Latitude" class="form-control input-md" required="" value="${param.Lat}">
	    
	  </div>
	</div>
	
	<!-- Text input-->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="Lng">Longitude</label>  
	  <div class="col-md-5">
	  <input id="Lng" name="Lng" type="text" placeholder="Longitude" class="form-control input-md" required="" value="${param.Lng}">
	  <span class="help-block"><a target="_blank" href="http://itouchmap.com/latlong.html">use itouchmap.com to find latitude and longitude</a></span>  
	  </div>
	</div>
	
	<!-- Button -->
	<div class="form-group">
	  <label class="col-md-4 control-label" for="submit"></label>
	  <div class="col-md-4">
	    <button id="submit" name="submit" class="btn btn-primary">Submit</button>
	  </div>
	</div>
	
	</fieldset>
	</form>

  </div>
  <div class="panel-footer">&nbsp;</div>
</div>
	
	
	<script src="../../plugins/bootstrap/js/bootstrap.min.js"></script>
	
</body>
</html>