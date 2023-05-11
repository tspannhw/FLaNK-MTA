### Apache NiFi Flows


### To Load to Cloudera Data Flow

````

cdp df import-flow-definition \
  --name "MTA" \
  --description "MTA" \
  --file "<<PATH_TO_UPDATE>>/MTA.json" \
  --comments "Initial Version"
  
  
  ````

### NiFi Toolkit

````
nifi-toolkit-1.20.0 bin/cli.sh

session set nifi.props base.props


````
  
### References

* https://www.datainmotion.dev/2020/09/devops-working-with-parameter-contexts.html
* https://nifi.apache.org/docs/nifi-docs/html/toolkit-guide.html#nifi_CLI
* https://docs.cloudera.com/cdp-public-cloud/cloud/cli/topics/mc-installing-cdp-client.html
* https://nifi.apache.org/docs/nifi-docs/html/toolkit-guide.html
* https://docs.cloudera.com/cdf-datahub/7.2.14/registry-export-import-nifi-cli/topics/cdf-datahub-connect-registry-nifi-cli.html
