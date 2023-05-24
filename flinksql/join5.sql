select transcom.title, transcom.description,  mta.VehicleRef,  
DISTANCE_BETWEEN(CAST(transcom.latitude as STRING), CAST(transcom.latitude as STRING), mta.VehicleLocationLatitude, mta.VehicleLocationLongitude) as miles, 
mta.StopPointName, mta.Bearing, mta.DestinationName, mta.ExpectedArrivalTime, mta.VehicleLocationLatitude, mta.VehicleLocationLongitude, 
mta.ArrivalProximityText, mta.DistanceFromStop, mta.AimedArrivalTime, mta.`Date`, mta.ts, mta.uuid, mta.EstimatedPassengerCapacity, mta.EstimatedPassengerCount
from  `sr1`.`default_database`.`mta`  /*+ OPTIONS('scan.startup.mode' = 'earliest-offset') */ mta
FULL OUTER JOIN `sr1`.`default_database`.`transcom`  /*+ OPTIONS('scan.startup.mode' = 'earliest-offset') */ transcom 
ON (transcom.latitude >= CAST(mta.VehicleLocationLatitude as float) - 0.3) 
AND (transcom.longitude >= CAST(mta.VehicleLocationLongitude as float) - 0.3) 
AND (transcom.latitude <= CAST(mta.VehicleLocationLatitude as float) + 0.3) 
AND (transcom.longitude <= CAST(mta.VehicleLocationLongitude as float) + 0.3) 
WHERE  mta.VehicleRef is not null  
AND transcom.title is not null
AND DISTANCE_BETWEEN(CAST(transcom.latitude as STRING), CAST(transcom.latitude as STRING), mta.VehicleLocationLatitude, mta.VehicleLocationLongitude) <= 120
