var map;

function initialize() {
  var mapOptions = {
    zoom: 1,
    center: new google.maps.LatLng(51.4788,  0.0106),
    mapTypeId: google.maps.MapTypeId.SATELLITE
  };  

  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  
  // Create a script tag and set the USGS URL as the source.
  // Append this tag to the document's <head>.
  var script = document.createElement('script');
  //script.src = 'http://earthquake.usgs.gov/earthquakes/feed/geojsonp/2.5/week';
   script.src = '/data/bubbles_geo.json';
  document.getElementsByTagName('head')[0].appendChild(script);
}

window.eqfeed_callback = function(results) {
  for (var i = 0; i < results.features.length; i++) {
    var earthquake = results.features[i];
    var coords = earthquake.geometry.coordinates;
    var latLng = new google.maps.LatLng(coords[1],coords[0]);
    var marker = new google.maps.Marker({
      position: latLng,
      map: map,
      icon: getCircle(earthquake),
      title: earthquake.data.tooltip_contents
    });
    var infowindow = new google.maps.InfoWindow({
        content: earthquake.data.tooltip_contents ,
        maxWidth: 200,
        position: marker.getPosition()
      });
    google.maps.event.addListener(marker, 'click', function() {
      alert("tip" + earthquake.data.tooltip_contents);
      infowindow.open(map,marker);
    });
  }
  
}

function getCircle(mark) {
  return {
    path: google.maps.SymbolPath.CIRCLE,
    fillColor: mark.data.background_color,
    fillOpacity: mark.data.background_opacity,
    radius: mark.data.weight,
    scale: 10,
    strokeColor: mark.data.border_color,
    strokeWeight:  mark.data.border_weight
  };
}