### SQL Stream Builder (Flink SQL)


````
select mta.VehicleRef,  mta.StopPointName, mta.Bearing, mta.DestinationName, mta.ExpectedArrivalTime, mta.VehicleLocationLatitude, mta.VehicleLocationLongitude, 
mta.ArrivalProximityText, mta.DistanceFromStop, mta.AimedArrivalTime, mta.`Date`, mta.ts, mta.uuid, mta.EstimatedPassengerCapacity, mta.EstimatedPassengerCount
from  `sr1`.`default_database`.`mta`

````


### Test SSB REST API

```
jupyter notebook
http://localhost:8888/tree

import json
import pandas

df = pandas.read_json('http://localhost:18131/api/v1/query/5204/mta?key=2730dfe0-1e2d-4f74-866a-52f372531d60')
df.info()
df

```

### Reference

* https://www.cloudera.com/downloads/cdf/csp-community-edition.html
* https://towardsdatascience.com/json-and-apis-with-python-fba329ef6ef0
