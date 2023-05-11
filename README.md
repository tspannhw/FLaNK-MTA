# FLaNK-MTA
MTA Data Sources


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


### GTFS Real-Time Feed

* https://api.mta.info/GTFS.pdf


### Data

* http://web.mta.info/developers/developer-data-terms.html#data
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

### More Data


* To get the list of and metadata for the agencies covered by MTA Bus Time, use: http://bustime.mta.info/api/where/agencies-with-coverage.xml?key=YOUR_KEY_HERE
* To get the list of and metadata for the MTA NYCT and MTABC routes covered by MTA Bus Time, use: http://bustime.mta.info/api/where/routes-for-agency/MTA%20NYCT.xml?key=YOUR_KEY_HERE
* For information on one specific stop served by MTA Bus Time, use: http://bustime.mta.info/api/where/stop/MTA_STOP-ID.xml?key=YOUR_KEY_HERE
* For information on the stops that serve a route, use <a href="http://bustime.mta.info/api/where/stops-for-route/MTA%20NYCT_M1.json?key=YOUR_KEY_HERE&includePolylines=false&version=2">http://bustime.mta.info/api/where/stops-for-route/MTA%20NYCT_M1.json?key=YOUR_KEY_HERE&includePolylines=false&version=2</a>{{/html}}
* For information on stops near a location, use http://bustime.mta.info/api/where/stops-for-location.json?lat=40.748433&lon=-73.985656&latSpan=0.005&lonSpan=0.005&key=YOUR_KEY_HERE
* https://data.ny.gov/browse?category=Transportation&utf8=%E2%9C%93
