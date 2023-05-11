# FLaNK-MTA 

MTA Data Sources as well as other New York, New Jersey and Pennsylvania Data


### Other Related Datasources (especially with Latitude, Longitude, City Name, Zip Code, Country, State, Location)

* NYC Traffic Cameras
* TRANSCOM Feeds 
* Government Status
* Social Media (facebook, twitter, mastodon, bluesky, reddit, youtube, RSS, ...)
* Air Quality (2 sources)
* ADSB Plane Tracking (Lat,Long)
* Weather (Lat, Long, Zip)
* RSS Feeds
* News Feeds
* CitiBike
* Government Feeds
* NJ Transit Bus, Rail, Light Rail, Travel Advisories as RSS/XML
* PA Traffic Cameras
* Weather Cameras

### Developer Docs

* https://bustime.mta.info/wiki/Developers/SIRIIntro
* https://bustime.mta.info/wiki/Developers/SIRIVehicleMonitoring
* http://web.mta.info/developers/turnstile.html
* https://new.mta.info/developers
* http://web.mta.info/developers/resources/nyct/EES/EENotes.pd
* http://web.mta.info/developers/resources/nyct/EES/ElevEscDefinitions.pdf
* http://developer.onebusaway.org/modules/onebusaway-application-modules/current/api/where/index.html
* https://bustime.mta.info/wiki/Developers/CancelledTripAPIFeatures
* https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/vehicle-positions.md
* https://github.com/OneBusAway/onebusaway-gtfs-realtime-api
* http://web.mta.info/developers/developer-data-terms.html#data
* https://github.com/MobilityData/mobility-database-catalogs/tree/main/catalogs/sources/gtfs/realtime
* https://docs.cloudera.com/data-visualization/7/ref-admin-api/topics/viz-admin-api-curl-format.html
* https://github.com/MobilityData/gtfs-realtime-bindings/blob/master/python/README.md
* https://swiftly-inc.stoplight.io/docs/realtime-standalone/d08fc97489edb-swiftly-api-reference
* http://www3.septa.org/#/
* https://realtime.septa.org/schedules


### GTFS Real-Time Feed

* https://api.mta.info/GTFS.pdf


### Data

* http://web.mta.info/status/serviceStatus.txt
* http://web.mta.info/developers/data/nyct/turnstile/turnstile_230506.txt
* http://web.mta.info/status/ServiceStatusSubway.xml
* http://web.mta.info/status/ServiceStatusBus.xml
* http://web.mta.info/developers/data/nyct/plannedwork.xml
* http://web.mta.info/developers/data/lirr/lirr_gtfs.json
* http://web.mta.info/developers/data/lirr/lirr_gtfs_header.json
* https://data.ny.gov/resource/i9wp-a4ja.json
* https://data.cityofnewyork.us/resource/i4gi-tjb9.json
* Bicycle Count https://data.cityofnewyork.us/resource/uczf-rk3c.json
* https://data.ny.gov/resource/vxuj-8kew.json
* http://web.mta.info/developers/fare.html
* https://data.cityofnewyork.us/resource/xjfq-wh2d.json
* https://data.cityofnewyork.us/resource/erdf-2akx.json
* https://data.cityofnewyork.us/resource/8vv7-7wx3.json
* https://data.cityofnewyork.us/resource/h9gi-nx95.json
* https://data.cityofnewyork.us/resource/f55k-p6yu.json
* http://web.mta.info/developers/data/nyct/subway/StationComplexes.csv
* https://gtfsrt.prod.obanyc.com/tripUpdates
* https://gtfsrt.prod.obanyc.com/alerts

### GTFS Real-Time Data

* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-ace
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-g
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-nqrw
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-bdfm
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-jz
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-l
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-si
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/lirr%2Fgtfs-lirr
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/mnr%2Fgtfs-mnr
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/camsys%2Fall-alerts
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/camsys%2Fsubway-alerts
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/camsys%2Fbus-alerts
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/camsys%2Flirr-alerts
* https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/camsys%2Fmnr-alerts
* https://github.com/MobilityData/mobility-database-catalogs/blob/main/catalogs/sources/gtfs/realtime/us-new-york-nyc-ferry-gtfs-rt-tu-1638.json


### More Data

* To get the list of and metadata for the agencies covered by MTA Bus Time, use: http://bustime.mta.info/api/where/agencies-with-coverage.xml?key=YOUR_KEY_HERE
* To get the list of and metadata for the MTA NYCT and MTABC routes covered by MTA Bus Time, use: http://bustime.mta.info/api/where/routes-for-agency/MTA%20NYCT.xml?key=YOUR_KEY_HERE
* For information on one specific stop served by MTA Bus Time, use: http://bustime.mta.info/api/where/stop/MTA_STOP-ID.xml?key=YOUR_KEY_HERE
* For information on the stops that serve a route, use <a href="http://bustime.mta.info/api/where/stops-for-route/MTA%20NYCT_M1.json?key=YOUR_KEY_HERE&includePolylines=false&version=2">http://bustime.mta.info/api/where/stops-for-route/MTA%20NYCT_M1.json?key=YOUR_KEY_HERE&includePolylines=false&version=2</a>{{/html}}
* For information on stops near a location, use http://bustime.mta.info/api/where/stops-for-location.json?lat=40.748433&lon=-73.985656&latSpan=0.005&lonSpan=0.005&key=YOUR_KEY_HERE
* https://data.ny.gov/browse?category=Transportation&utf8=%E2%9C%93

### TODO

* Make a SODA Processors for NiFi https://dev.socrata.com/consumers/getting-started.html

### References

* https://github.com/KatsuteDev/OneMTA
* http://siri.org.uk/schema/schemas.htm
