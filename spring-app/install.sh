#!/usr/bin/env bash

oc login -u developer -p developer
docker login -u developer -p $(oc whoami -t) 172.30.1.1:5000

docker tag anupamgogoi/pizza-app:1.0.0 172.30.1.1:5000/wso2/pizza-app:1.0.0
docker push 172.30.1.1:5000/wso2/pizza-app:1.0.0

# Service
oc apply -f kube/pizza-service.yaml -n wso2

# Create route
# oc apply -f kube/is-route.yaml -n wso2

# Create deployment
oc apply -f kube/pizza-deployment.yaml -n wso2