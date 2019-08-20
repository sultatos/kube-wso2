#!/usr/bin/env bash

# Login and create project.
oc login -u developer -p developer
oc new-project wso2

# Docker
docker login -u developer -p $(oc whoami -t) 172.30.1.1:5000
docker tag is 172.30.1.1:5000/wso2/is
docker push 172.30.1.1:5000/wso2/is

# Create service account.
oc create serviceaccount wso2svc-account -n wso2

# Create config maps
oc create cm config-carbon --from-file=./configs/carbon.xml -n wso2

# Create RBAC
oc apply -f kube/rbac.yaml -n wso2

# Create service
oc apply -f kube/is-service.yaml -n wso2

# Create route
oc apply -f kube/is-route.yaml -n wso2

# Create deployment
oc apply -f kube/is-deployment.yaml -n wso2