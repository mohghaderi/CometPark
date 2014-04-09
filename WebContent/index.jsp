<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    
    <script type="text/javascript"
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAuvAUEwdvrM4v49pnVIaWPNrUM_R9rpIw&sensor=true">
    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
    <!--  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>-->



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
    USGSOverlay.prototype = new google.maps.OverlayView();
    
    
      function initialize() {
    	  console.log( "initialize" );
    	  
          //detectBrowser();
        var mapOptions = {
          center: new google.maps.LatLng(32.985494,-96.750948),
          zoom: 16
        };
        map = new google.maps.Map(document.getElementById("map-canvas"),
            mapOptions);
        
        OverlayParkingImage();

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
    		  
    		  var color = '#00FF00';
    		  
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

   
   
   
   function OverlayParkingImage() {
	   // The photograph is courtesy of the U.S. Geological Survey.
	   var srcImage = 'images/ParkingLot2.jpg';
	   
	   
	   var swBound = new google.maps.LatLng(32.98574, -96.753686);
	   var neBound = new google.maps.LatLng(32.986432, -96.752150);
	   var bounds = new google.maps.LatLngBounds(swBound, neBound);
	   
	   // The custom USGSOverlay object contains the USGS image,
	   // the bounds of the image, and a reference to the map.
	   overlay = new USGSOverlay(bounds, srcImage, map);
   }
   

   /** @constructor */
   function USGSOverlay(bounds, image, map) {

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
   USGSOverlay.prototype.onAdd = function() {

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

   USGSOverlay.prototype.draw = function() {

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
   USGSOverlay.prototype.onRemove = function() {
     this.div_.parentNode.removeChild(this.div_);
     this.div_ = null;
   };
   
   
   
      
      google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
  	<div><button onclick="findFreeParkingSpaces()">Find free parking spots</button></div>
    <div id="map-canvas"></div>
  </body>
</html>