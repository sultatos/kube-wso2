#!/usr/bin/env bash

# Login and create project.
oc login -u developer -p developer
oc new-project wso2is

# Create service account.
oc create serviceaccount wso2svc-account -n wso2is

# Create config maps
oc create cm config-carbon --from-file=./configs/carbon.xml -n wso2is
oc create cm config-keystore --from-file=./configs/keystores/wso2carbon.jks -n wso2is
oc create cm config-client-truststore --from-file=./configs/keystores/client-truststore.jks -n wso2is

# Create RBAC
oc apply -f kube/rbac.yaml -n wso2is

# Create service
oc apply -f kube/is-service.yaml -n wso2is


# Utils
alias dc="oc get dc"
alias pods="oc get pods"
alias svc="oc get svc"
alias cm="oc get cm"