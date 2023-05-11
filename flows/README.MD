### Apache NiFi Flows


### To Load to Cloudera Data Flow

````

cdp df import-flow-definition \
  --name "MTA" \
  --description "MTA" \
  --file "<<PATH_TO_UPDATE>>/MTA.json" \
  --comments "Initial Version"
  
  
  ````
  
### References

* https://www.datainmotion.dev/2020/09/devops-working-with-parameter-contexts.html
* https://nifi.apache.org/docs/nifi-docs/html/toolkit-guide.html#nifi_CLI
* https://docs.cloudera.com/cdp-public-cloud/cloud/cli/topics/mc-installing-cdp-client.html
