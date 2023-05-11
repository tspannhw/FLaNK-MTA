### Attribute List

````

StopPointRef,ExpectedDepartureTime,DataFrameRef,DestinationName,ExpectedArrivalTime,LineRef,VehicleLocationLongitude,DirectionRef,ArrivalProximityText,EstimatedPassengerCapacity,AimedArrivalTime,PublishedLineName,DatedVehicleJourneyRef,Monitored,ProgressStatus,EstimatedPassengerCount,VehicleLocationLatitude,VehicleRef,ProgressRate,StopPoint,VisitNumber,StopPointName,Bearing,OriginAimedDepartureTime,JourneyPatternRef,RecordedAtTime,OperatorRef,BlockRef,DistanceFromStop,SituationSimpleRef1,SituationSimpleRef2,SituationSimpleRef3,SituationSimpleRef4,SituationSimpleRef5,Date,DestinationRef,OriginRef,NumberOfStopsAway

````

### Destination Topic

````
mta
````

### KAFKABROKERS

````
kafka:9092

````

### KAFKACLIENTID

````
nifi-mta-local

````

### MTA_URL

````
http://api.prod.obanyc.com/api/siri/vehicle-monitoring.json?key=GETAKEY&version=2
````

### SCHEMANAME

````
mta
````

### SQLQUERY

````
SELECT * FROM FLOWFILE
````
