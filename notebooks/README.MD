# notebooks

````
jupyter notebook
http://localhost:8888/tree

import json
import pandas

df = pandas.read_json('http://localhost:18131/api/v1/query/5204/mta?key=2730dfe0-1e2d-4f74-866a-52f372531d60')
df.info()
df

````
