# Create service
oc apply -f kube/ei-service.yaml -n wso2

# Create deployment
oc apply -f kube/ei-deployment.yaml -n wso2