Utilizing Real-Time Transit Data for Travel Optimization.


There are a lot of factors involved in determining how you can find our way around and avoid delays, bad weather, dangers and expenses. In this article we will focus on public transport in the largest transit system in the United States, the MTA, the is focused around New York City. Utilizing public and semi-public data feeds, this can be extended to most city and metropolitan areas around the world.


Photo by Sabri Tuzcu on Unsplash
If you don’t need a deep dive, grab the source code, sign up for an MTA developer account and start running.

GitHub - tspannhw/FLaNK-MTA: MTA Data Sources
MTA Data Sources as well as other New York, New Jersey and Pennsylvania Data NYC Traffic Cameras TRANSCOM Feeds…
github.com


Photo by Michael Jin on Unsplash
Once we get our first sample data back from the MTA, we will want to see how we should transform, convert, enrich and finalize it for usage in streaming tables with Flink SQL, but also keep that same contract with Kafka consumers, Iceberg tables and other users of this data. A consistent data contract starts with a data schema defining names, nullability and type.


Schema Registry for our schema
{
 "type": "record",
 "name": "mta",
 "namespace": "org.apache.nifi",
 "fields": [
  {
   "name": "StopPointRef",
   "type": [
    "string",
    "null"
   ]
  },
 ...
  {
   "name": "uuid",
   "type": [
    "string",
    "null"
   ]
  }
 ]
}
The easiest and most widely used option is an Apache Avro schema in JSON format. So we’ll use that and everyone can be happy with our consistency. You can get the full schema from the github repo.

PARAMETERS
When you build a NiFi flow, you should parameterize anything you may want to change when you deploy it to another environment or production. This is a great way to make this reusable. We do that for ReadyFlows. Do this and profit!


Attribute List
StopPointRef,ExpectedDepartureTime,DataFrameRef,DestinationName,ExpectedArrivalTime,LineRef,VehicleLocationLongitude,DirectionRef,ArrivalProximityText,EstimatedPassengerCapacity,AimedArrivalTime,PublishedLineName,DatedVehicleJourneyRef,Monitored,ProgressStatus,EstimatedPassengerCount,VehicleLocationLatitude,VehicleRef,ProgressRate,StopPoint,VisitNumber,StopPointName,Bearing,OriginAimedDepartureTime,JourneyPatternRef,RecordedAtTime,OperatorRef,BlockRef,DistanceFromStop,SituationSimpleRef1,SituationSimpleRef2,SituationSimpleRef3,SituationSimpleRef4,SituationSimpleRef5,Date,DestinationRef,OriginRef,NumberOfStopsAway
Destination Topic
mta
KAFKABROKERS
kafka:9092
KAFKACLIENTID
nifi-mta-local
MTA_URL
http://api.prod.obanyc.com/api/siri/vehicle-monitoring.json?key=GETAKEY&version=2
You will need to sign up for the MTA Developer program to get a key.

SCHEMANAME
mta
SQLQUERY
SELECT * FROM FLOWFILE

NiFi DataFlow
The Flow starts here…





Send our data to Kafka
Now that you have seen the high-level flow, let’s walk through the settings for each processor.

Step 1: InvokeHTTP — Get the REST Data

If you need to add a sensitive property to your call.


Step 2: QueryRecord

Step 3: SplitRecord

Step 4: EvaluateJSONPath — Get Fields we want

Step 5: AttributesToJSON — Build our new file format

Step 6: UpdateRecord — Add timestamp and primary key

Step 7: UpdateAttribute — Set Schema Name and JSON

Step 8 — Produce events to Apache Kafka topic “mta”

We send records as Apache Avro with Cloudera annotated schema, so it is read super fast in Flink SQL.

Kafka Brokers and Destination Topic names are parameters, we also have a parameter for the schema registry in the AvroRecordSetWriterSchema Writer so we can easily publish to production.

Step 9 — Retry if error

You can decide what you want to do if Kafka is not available or if your data is bad. You could send it to S3, Slack, Email, Iceberg, local files or just keep it in a NiFi queue. We can also centralize our error handling. We will figure that out as we build this application out.

Now if we intend to move this application into a scalable production environment, a better option is to build utilizing Cloudera DataFlow Designer and start from a pre-tested ReadyFlow. (DataFlow SuperPower)



Apache NiFi Flows

To Load to Cloudera Data Flow
cdp df import-flow-definition \
  --name "MTA" \
  --description "MTA" \
  --file "<<PATH_TO_UPDATE>>/MTA.json" \
  --comments "Initial Version"
NiFi Toolkit
cd nifi-toolkit-1.20.0 
bin/cli.sh
session set nifi.props base.props
nifi list-param-contexts -u https://localhost:8443 -ot simple
NiFi Production Deployment as a DataFlow on Kubernetes — First Deploy

Name it




NiFi Production Deployment as a DataFlow on Kubernetes — Monitoring

Top Level Deployment Monitoring for all of my flows


During Deployment You Set Your Parameters That You Can Change After Deployment As Well


References
https://www.datainmotion.dev/2020/09/devops-working-with-parameter-contexts.html
https://nifi.apache.org/docs/nifi-docs/html/toolkit-guide.html#nifi_CLI
https://docs.cloudera.com/cdp-public-cloud/cloud/cli/topics/mc-installing-cdp-client.html
https://nifi.apache.org/docs/nifi-docs/html/toolkit-guide.html
https://docs.cloudera.com/cdf-datahub/7.2.14/registry-export-import-nifi-cli/topics/cdf-datahub-connect-registry-nifi-cli.html
https://nifi.apache.org/docs/nifi-docs/html/walkthroughs.html#:~:text=On%20most%20modern%20OS%2C%20double,in%20CN%3Dmy_username_OU%3DNiFi.

Streams Messaging Manager for Kafka Management and Visibility
Thanks to our schema, we can see and inspect our MTA events very easily inside of SMM so we know our data will be good for Kafka consumers like Flink SQL, Spark, NiFi and Spring.

SQL Stream Builder (Flink SQL)
select mta.VehicleRef,  mta.StopPointName, mta.Bearing, mta.DestinationName, mta.ExpectedArrivalTime, mta.VehicleLocationLatitude, mta.VehicleLocationLongitude, 
mta.ArrivalProximityText, mta.DistanceFromStop, mta.AimedArrivalTime, mta.`Date`, mta.ts, mta.uuid, mta.EstimatedPassengerCapacity, mta.EstimatedPassengerCount
from  `sr1`.`default_database`.`mta`

Flink SQL via SQL Stream Builder

Once we have a built a query that works, we can instantly add a REST output sink for it.


Click Create Materialized View and pick your query, patterns, fields and hit Create.
Set your key for the REST API.


Test SSB REST API
The raw data is made available for any REST consumer including JavaScript web pages, Python code and more.


SSB REST Feed for our Flink SQL query
To start a local Jupyter notebook, just type the following:

jupyter notebook
http://localhost:8888/tree
import json
import pandas
df = pandas.read_json('http://localhost:18131/api/v1/query/5204/mta?key=2730dfe0-1e2d-4f74-866a-52f372531d60')
df.info()
df
We can work with our streaming data via REST as JSON in a Jupyter Notebook. The example code I used is shown above and also stored in the github repo.


Jupyter Notebook for reading MTA event streams via REST and Pandas

Reference
https://www.cloudera.com/downloads/cdf/csp-community-edition.html
https://towardsdatascience.com/json-and-apis-with-python-fba329ef6ef0
https://dzone.com/articles/tracking-aircraft-in-real-time-with-apache-pulsar
https://github.com/tspannhw/FLiP-Py-ADS-B
https://github.com/tspannhw/pulsar-adsb-function
https://medium.com/@tspann/tracking-aircraft-in-real-time-with-open-source-554124125011
https://github.com/tspannhw/FLaNK-TravelAdvisory/blob/main/steps.md
Developer Docs
https://bustime.mta.info/wiki/Developers/SIRIIntro
https://bustime.mta.info/wiki/Developers/SIRIVehicleMonitoring
http://web.mta.info/developers/turnstile.html
https://new.mta.info/developers
http://web.mta.info/developers/resources/nyct/EES/EENotes.pd
http://web.mta.info/developers/resources/nyct/EES/ElevEscDefinitions.pdf
http://developer.onebusaway.org/modules/onebusaway-application-modules/current/api/where/index.html
https://bustime.mta.info/wiki/Developers/CancelledTripAPIFeatures
https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/vehicle-positions.md
https://github.com/OneBusAway/onebusaway-gtfs-realtime-api
http://web.mta.info/developers/developer-data-terms.html#data
https://github.com/MobilityData/mobility-database-catalogs/tree/main/catalogs/sources/gtfs/realtime
https://docs.cloudera.com/data-visualization/7/ref-admin-api/topics/viz-admin-api-curl-format.html
https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/python/README.md
https://swiftly-inc.stoplight.io/docs/realtime-standalone/d08fc97489edb-swiftly-api-reference
http://www3.septa.org/#/
https://realtime.septa.org/schedules
https://dev.socrata.com/foundry/data.cityofnewyork.us/i4gi-tjb9
https://data.cityofnewyork.us/Transportation/Real-Time-Traffic-Speed-Data/qkm5-nuaq
GTFS Real-Time Feed
https://api.mta.info/GTFS.pdf
Data
http://web.mta.info/status/serviceStatus.txt
http://web.mta.info/developers/data/nyct/turnstile/turnstile_230506.txt
http://web.mta.info/status/ServiceStatusSubway.xml
http://web.mta.info/status/ServiceStatusBus.xml
http://web.mta.info/developers/data/nyct/plannedwork.xml
http://web.mta.info/developers/data/lirr/lirr_gtfs.json
http://web.mta.info/developers/data/lirr/lirr_gtfs_header.json
https://data.ny.gov/resource/i9wp-a4ja.json
https://data.cityofnewyork.us/resource/i4gi-tjb9.json
Bicycle Count https://data.cityofnewyork.us/resource/uczf-rk3c.json
https://data.ny.gov/resource/vxuj-8kew.json
http://web.mta.info/developers/fare.html
https://data.cityofnewyork.us/resource/xjfq-wh2d.json
https://data.cityofnewyork.us/resource/erdf-2akx.json
https://data.cityofnewyork.us/resource/8vv7-7wx3.json
https://data.cityofnewyork.us/resource/h9gi-nx95.json
https://data.cityofnewyork.us/resource/f55k-p6yu.json
http://web.mta.info/developers/data/nyct/subway/StationComplexes.csv
GTFS Real-Time Data
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-ace
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-g
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-nqrw
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-bdfm
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-jz
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-l
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-si
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/lirr%2Fgtfs-lirr
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/mnr%2Fgtfs-mnr
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/camsys%2Fall-alerts
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/camsys%2Fsubway-alerts
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/camsys%2Fbus-alerts
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/camsys%2Flirr-alerts
https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/camsys%2Fmnr-alerts
https://github.com/MobilityData/mobility-database-catalogs/blob/main/catalogs/sources/gtfs/realtime/us-new-york-nyc-ferry-gtfs-rt-tu-1638.json
https://gtfsrt.prod.obanyc.com/tripUpdates
https://gtfsrt.prod.obanyc.com/alerts

More Data is Streaming

More Data
To get the list of and metadata for the agencies covered by MTA Bus Time, use: http://bustime.mta.info/api/where/agencies-with-coverage.xml?key=YOUR_KEY_HERE
To get the list of and metadata for the MTA NYCT and MTABC routes covered by MTA Bus Time, use: http://bustime.mta.info/api/where/routes-for-agency/MTA%20NYCT.xml?key=YOUR_KEY_HERE
For information on one specific stop served by MTA Bus Time, use: http://bustime.mta.info/api/where/stop/MTA_STOP-ID.xml?key=YOUR_KEY_HERE
For information on the stops that serve a route, use http://bustime.mta.info/api/where/stops-for-route/MTA%20NYCT_M1.json?key=YOUR_KEY_HERE&includePolylines=false&version=2{{/html}}
For information on stops near a location, use http://bustime.mta.info/api/where/stops-for-location.json?lat=40.748433&lon=-73.985656&latSpan=0.005&lonSpan=0.005&key=YOUR_KEY_HERE
https://data.ny.gov/browse?category=Transportation&utf8=%E2%9C%93
Data References
https://github.com/KatsuteDev/OneMTA
http://siri.org.uk/schema/schemas.htm
Thanks for following this initial build, next steps to add more data streams and identify the best way around by looking at MTA, NJ Transit, roads, planes and boats.

Until then time to REST.


Apache Nifi
Cloudera Dataflow
Apache Kafka
Apache Flink
Open Source
