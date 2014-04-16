<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	<script type="text/javascript" src="plugins/jquery/jquery-ui-custom.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="themes/redmond/jquery-ui-1.8.2.custom.css" />

    <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map-canvas { height: 100% }
      #mainBody { height: 100%; width:100%; }
      .iwContainer { 
		  width: 120px; 
		  height: 40px; 
		} 
    </style>

    <script type="text/javascript">
    
    var map = null;
    var markersArray = [];
    var infoWindowsArray = [];
    var updateTimer = null;
    ParkingLotAOverlay.prototype = new google.maps.OverlayView();
    
    
      function initialize() {
    	  console.log( "initialize" );
    	  
          //detectBrowser();
          
        // utdallas view
        //var mapOptions = {
        //  center: new google.maps.LatLng(32.985494,-96.750948),
        //  zoom: 16
        //};
        
        // parking A view 
        var mapOptions = {
          center: new google.maps.LatLng(32.98606,-96.752914),
          zoom: 20
        };
        
        map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
        
        OverlayParkingImage();
        
        showAllParkingSpots();
        startUpdateTimer();
      }
      
      function startUpdateTimer() {
    	  updateTimer = setInterval( function () {findFreeParkingSpaces();}, 1000); // update every one second
      }
      
      function stopUpdateTimer() {
    	  clearInterval(updateTimer);
      }
      
      function detectBrowser() {
    	  var useragent = navigator.userAgent;
    	  var mapdiv = document.getElementById("map-canvas");

    	  //if (useragent.indexOf('iPhone') != -1 || useragent.indexOf('Android') != -1 ) {
    	    mapdiv.style.width = '100%';
    	    mapdiv.style.height = '100%';
    	  //} else {
    	  //  mapdiv.style.width = '600px';
    	  //  mapdiv.style.height = '800px';
    	  //}
    	}
      
      function findFreeParkingSpaces() {
    	  //TODO: Performance can be increased by getting only updated results
    	  //Avoided because this project is an educational one.
    	  showAllParkingSpots();
      }
      
      
      function showAllParkingSpots() {
    	  //http://jquery-ui-map.googlecode.com/svn/trunk/demos/jquery-google-maps-json.html
    	  $.getJSON( 'ParkingSpacesAllJsonView.jsp', showMarkers).done(function() {
    		    console.log( "getAllParkingSpacesJson success" );
    		    $("#dialog-modal").dialog('close'); // automatically closes the error dialog! (TODO: don't close it if it is not exists)
    	  })
    	  .fail(function() {
    	    console.log( "error" );
    	    //stopUpdateTimer();  //TODO: Stop the timer and let the user to start it again.
    	    $( "#dialog-modal" ).dialog({
    	        closeOnEscape: false,
    	        open: function(event, ui) { $(".ui-dialog-titlebar-close", ui.dialog || ui).hide(); },
    	        height: 140,
    	        modal: true
    	      });
    	  })
    	  .always(function() {
    	    console.log( "complete" );
    	  });
      }
      
      
      function showMarkers(data) {
    	  
    	if (areMarkersUpdatable(data)) {
    		updateMarkers(data);
		}
    	else {
    		clearMarkers();
	    	createMarkers(data);
    	}
    	
      }
      
      
      
      function areMarkersUpdatable(data) {
    	  return data.markers.length == markersArray.length;
    	  // TODO: add more advanced method such as checking id of parking spots
      }
      
      function createMarkers(data) {
    	  
    	  $.each( data.markers, function(i, mInfo) {
    		  //var myLatlng = new google.maps.LatLng(mInfo.lat,mInfo.lng);
    		  //var myLatlng = new google.maps.LatLng(32.985494,-96.750948);
    		  var color = getVacancyColor(mInfo.isVacant);  
    		  
			    var markerOptions = {
			      strokeColor: color,
			      strokeOpacity: 0.8,
			      strokeWeight: 2,
			      fillColor: color,
			      fillOpacity: 0.35,
			      map: map,
			      //center: myLatlng,
			      //radius: 0.9
			      bounds: new google.maps.LatLngBounds(
			    	      new google.maps.LatLng(mInfo.lat - 0.000019, mInfo.lng - 0.000009),
			    	      new google.maps.LatLng(mInfo.lat + 0.000018, mInfo.lng + 0.000009))
			    };

    		  
    		  //var marker = new google.maps.Circle(markerOptions);
    		  var marker = new google.maps.Rectangle(markerOptions);
    		  
    		  markersArray.push(marker);
    		  
			});
      }
      
      function getVacancyColor(isVacant) {
		  var color = '#00FF00'; // GREEN = not vacant color
		  if (isVacant == false)
			  color = '#FF0000';  // RED = vacant color
		  return color;
      }
      
      function updateMarkers(data) {
    	  
    	  $.each( data.markers, function(i, mInfo) {
    		  var color = getVacancyColor(mInfo.isVacant);
    		  if (markersArray[i].strokeColor != color)
    		  {
        		  markersArray[i].strokeColor = color;
        		  markersArray[i].fillColor = color;
        		  markersArray[i].setMap(null);
        		  markersArray[i].setMap(map);
    		  }
			});
      }
      
      
            
   // Removes the overlays from the map
      function clearMarkers() {

	    for (var i = 0; i < markersArray.length; i++) {
           markersArray[i].setMap(null);
         }
         markersArray = [];
         infoWindowsArray = [];
      }

   
   
   
   // ************************** Overlay Parking Lot Image ********************************
   // Used Google examples
   
   
   function OverlayParkingImage() {
	   
	   var srcImage = 'images/ParkingLot3.jpg';
	   
	   
	   var swBound = new google.maps.LatLng(32.98574, -96.753686);
	   var neBound = new google.maps.LatLng(32.986432, -96.752150);
	   var bounds = new google.maps.LatLngBounds(swBound, neBound);
	   
	   // The custom ParkingLotAOverlay object contains the ParkingLotA image,
	   // the bounds of the image, and a reference to the map.
	   overlay = new ParkingLotAOverlay(bounds, srcImage, map);
   }
   

   /** @constructor */
   function ParkingLotAOverlay(bounds, image, map) {

     // Initialize all properties.
     this.bounds_ = bounds;
     this.image_ = image;
     this.map_ = map;

     // Define a property to hold the image's div. We'll
     // actually create this div upon receipt of the onAdd()
     // method so we'll leave it null for now.
     this.div_ = null;

     // Explicitly call setMap on this overlay.
     this.setMap(map);
   }

   /**
    * onAdd is called when the map's panes are ready and the overlay has been
    * added to the map.
    */
   ParkingLotAOverlay.prototype.onAdd = function() {

     var div = document.createElement('div');
     div.id = "parkigLotOverlay";
     div.style.borderStyle = 'none';
     div.style.borderWidth = '0px';
     div.style.position = 'absolute';

     // Create the img element and attach it to the div.
     var img = document.createElement('img');
     img.src = this.image_;
     img.style.width = '100%';
     img.style.height = '100%';
     img.style.position = 'absolute';
     div.appendChild(img);

     this.div_ = div;

     // Add the element to the "overlayLayer" pane.
     var panes = this.getPanes();
     panes.overlayLayer.appendChild(div);
   };

   ParkingLotAOverlay.prototype.draw = function() {

     // We use the south-west and north-east
     // coordinates of the overlay to peg it to the correct position and size.
     // To do this, we need to retrieve the projection from the overlay.
     var overlayProjection = this.getProjection();

     // Retrieve the south-west and north-east coordinates of this overlay
     // in LatLngs and convert them to pixel coordinates.
     // We'll use these coordinates to resize the div.
     var sw = overlayProjection.fromLatLngToDivPixel(this.bounds_.getSouthWest());
     var ne = overlayProjection.fromLatLngToDivPixel(this.bounds_.getNorthEast());

     // Resize the image's div to fit the indicated dimensions.
     var div = this.div_;
     div.style.left = sw.x + 'px';
     div.style.top = ne.y + 'px';
     div.style.width = (ne.x - sw.x) + 'px';
     div.style.height = (sw.y - ne.y) + 'px';
   };

   // The onRemove() method will be called automatically from the API if
   // we ever set the overlay's map property to 'null'.
   ParkingLotAOverlay.prototype.onRemove = function() {
     this.div_.parentNode.removeChild(this.div_);
     this.div_ = null;
   };
   
         
      google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
  	<div id="mainBody">
  		<button onclick="findFreeParkingSpaces();" style="display:none">Find free parking spots</button>
	    <div id="map-canvas"></div>
  	</div>
  	<div id="dialog-modal" title="Error">
	  <p>Error in getting data from the server. Please try again later. 
	  </p>
	</div>
  </body>
</html>