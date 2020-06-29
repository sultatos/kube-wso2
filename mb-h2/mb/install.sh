#!/usr/bin/env bash

oc apply -f kube/mb-deployment.yaml -n wso2
oc apply -f kube/mb-service.yaml -n wso2