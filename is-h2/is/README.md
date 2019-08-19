# Minishift Configuration
$ oc login -u system:admin -n wso2is
$ oc adm policy add-scc-to-user anyuid -z default -n wso2is

# Create Config Maps
$ oc create cm config-carbon --from-file=./configs/carbon.xml -n wso2is
$ oc create cm config-keystore --from-file=./configs/keystores/wso2carbon.jks -n wso2is
$ oc create cm config-client-truststore --from-file=./configs/keystores/client-truststore.jks -n wso2is

# Create Service Account
$ oc create serviceaccount wso2svc-account -n wso2is
# Run Deployment
$ oc apply -f kube/rbac.yaml -n wso2is
$ oc apply -f kube/is-service.yaml -n wso2is


# Docker
$ docker tag is 172.30.1.1:5000/wso2is/is