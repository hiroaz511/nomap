function initMap() {
  var map;
  var target = document.getElementById('map');
  var geocoder = new google.maps.Geocoder();
  var marker;

  geocoder.geocode({
    address: document.getElementById("shop-address").innerHTML
  }, function(results, status){
    if (status !== 'OK'){
      alert('Failed: ' + status);
      return;
    }
    if (results[0]) {
        map = new google.maps.Map(target, {
        center:results[0].geometry.location,
        zoom: 15,
        streetViewControl: false,
        mapTypeControl: false,
      });
        marker = new google.maps.Marker({
        position: map.getCenter(),
        map: map,
        title: document.getElementById("shop-name").innerHTML,
        animation: google.maps.Animation.BOUNCE
      });
    } else {
      alert('No resurlts');
      return;
    }
  });
}
