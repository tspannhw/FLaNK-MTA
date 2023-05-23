function DISTANCE_BETWEEN(lat1, lon1, lat2, lon2) {
  function toRad(x) {
    return x * Math.PI / 180;
  }

  // https://community.cloudera.com/t5/Community-Articles/Flink-SSB-Credit-Card-Fraud-Detection-Demo/ta-p/334792?es_id=55b2d12b4d
  lat1 = parseFloat(lat1);
  lon1 = parseFloat(lon1);
  lat2 = parseFloat(lat2);
  lon2 = parseFloat(lon2);
  
  var R = 6371; // km
  
  var x1 = lat2 - lat1;
  var dLat = toRad(x1);
  var x2 = lon2 - lon1;
  var dLon = toRad(x2)
  var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
    Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) *
    Math.sin(dLon / 2) * Math.sin(dLon / 2); 
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  var d = R * c;
  
  // convert to miles
  return (d / 1.60934);
}
DISTANCE_BETWEEN($p0, $p1, $p2, $p3)


// DISTANCE_BETWEEN(40.625249, -73.960783, 40.780693, -73.980105)
