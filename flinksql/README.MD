### SQL Stream Builder (Flink SQL)


````
select mta.VehicleRef,  mta.StopPointName, mta.Bearing, mta.DestinationName, mta.ExpectedArrivalTime, mta.VehicleLocationLatitude, mta.VehicleLocationLongitude, 
mta.ArrivalProximityText, mta.DistanceFromStop, mta.AimedArrivalTime, mta.`Date`, mta.ts, mta.uuid, mta.EstimatedPassengerCapacity, mta.EstimatedPassengerCount
from  `sr1`.`default_database`.`mta`

````

### Reference

* https://www.cloudera.com/downloads/cdf/csp-community-edition.html
