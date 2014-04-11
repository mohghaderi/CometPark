<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuvAUEwdvrM4v49pnVIaWPNrUM_R9rpIw&sensor=true">
    </script>
    <!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script> -->
    <!--  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>-->
	
	<script type="text/javascript" src="plugins/jquery/jquery.js"></script>


    <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map-canvas { height: 100% }
      .iwContainer { 
		  width: 120px; 
		  height: 40px; 
		} 
    </style>

    <script type="text/javascript">
    
    var map = null;
    var markersArray = [];
    var infoWindowsArray = [];
    
      function initialize() {
    	  console.log( "initialize" );
    	  
          //detectBrowser();
        var mapOptions = {
          center: new google.maps.LatLng(32.985494,-96.750948),
          zoom: 16
        };
        map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);

      }
      
      function detectBrowser() {
    	  var useragent = navigator.userAgent;
    	  var mapdiv = document.getElementById("map-canvas");

    	  if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1 ) {
    	    mapdiv.style.width = '100%';
    	    mapdiv.style.height = '100%';
    	  } else {
    	    mapdiv.style.width = '600px';
    	    mapdiv.style.height = '800px';
    	  }
    	}
      
      function findFreeParkingSpaces() {
    	  
    	  //http://jquery-ui-map.googlecode.com/svn/trunk/demos/jquery-google-maps-json.html
    	  $.getJSON( 'FreeParkingSpacesJsonView.jsp', showMarkers).done(function() {
    		    console.log( "second success" );
    	  })
    	  .fail(function() {
    	    console.log( "error" );
    	  })
    	  .always(function() {
    	    console.log( "complete" );
    	  });
    	  
      }
      
      function showMarkers(data) {
    	  
    	  clearOverlays();
    	  
    	 $.each( data.markers, function(i, mInfo) {
    		  var myLatlng = new google.maps.LatLng(mInfo.lat,mInfo.lng);
    		  //var myLatlng = new google.maps.LatLng(32.985494,-96.750948);
    		  var marker = new google.maps.Marker({
    		      position: myLatlng,
    		      map: map,
    		      icon: 'images/locationpointer.png',
    		      title: "parking"
    		  });
    		  
    		  markersArray.push(marker);
    		  
    		  // DEVELOPER NOTE: Google Info BUG. It won't show small info windows; so, I defined iwContainer css class
    		  var infoContent = "<div class='iwContainer'>Spot:" + mInfo.spotNumber + "</div>";
    		  //var infoContent = "Spot:" + mInfo.spotNumber + "";
    		  
        	  var infowindow = new google.maps.InfoWindow({
        	      content: infoContent
        	  });
        	  infoWindowsArray.push(infowindow);

        	  google.maps.event.addListener(marker, 'click', function() {
        		    infowindow.open(map,marker);
        		    //TODO: close all other info windows
        		    //for(var i = 0; i < infoWindowsArray.length; i++) {
        		    //	infoWindowsArray[i].close();
        		   	//}
        		  });
    		  
    		  
			}); 
      }
      
   // Removes the overlays from the map, but keeps them in the array
      function clearOverlays() {

	    for (var i = 0; i < markersArray.length; i++) {
           markersArray[i].setMap(null);
         }
         markersArray = [];
         infoWindowsArray = [];
      }

   
      
      google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
  	<div><button onclick="findFreeParkingSpaces()">Find free parking spots</button></div>
    <div id="map-canvas"></div>
  </body>
</html>