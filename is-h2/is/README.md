# Create Config Maps
$ oc create cm config-carbon --from-file=./configs/carbon.xml -n wso2is
$ oc create cm config-keystore --from-file=./configs/keystores/wso2carbon.jks -n wso2is
$ oc create cm config-client-truststore --from-file=./configs/keystores/client-truststore.jks -n wso2is

# Run Deployment
$ oc apply -f kube/is-service.yaml