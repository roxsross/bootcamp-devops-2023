#!/bin/bash
TRIVY_REPORT=trivy-results.json
ALLOW_DEPLOY=2
ALLOW_FAILURE=true
######
NUM_CRITICAL=$(grep CRITICAL $TRIVY_REPORT | wc -l)
NUM_HIGH=$(grep HIGH $TRIVY_REPORT | wc -l)
NUM_MEDIUM=$(grep MEDIUM $TRIVY_REPORT | wc -l)
NUM_LOW=$(grep LOW $TRIVY_REPORT | wc -l)
BASE=$(cat $TRIVY_REPORT | jq '.Metadata.OS | "\(.Family):\(.Name)"' | sed 's/"//g')
echo " $IMAGE | $BASE | $NUM_CRITICAL | $NUM_HIGH | $NUM_MEDIUM | $NUM_LOW " 

if [ $NUM_HIGH -ge $ALLOW_DEPLOY ]; then
      echo "DENY DEPLOY TO PRODUCCION"
      echo "Total Vulnerabilities Critical: $NUM_CRITICAL"
      echo "Total Vulnerabilities High: $NUM_HIGH"
      exit 1
else
       echo "ALLOW DEPLOY TO PRODUCCION"        
fi 