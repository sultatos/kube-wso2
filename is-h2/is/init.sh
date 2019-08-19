#!/usr/bin/env bash

# Login and create project.
oc login -u developer -p developer
oc new-project wso2

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



# Utils
alias dc="oc get dc"
alias pods="oc get pods"
alias svc="oc get svc"
alias cm="oc get cm"