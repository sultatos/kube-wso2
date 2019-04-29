
# PostgreSQL

## Create config maps
cd kube-wso2/is-postgres
is-postgres>kubectl create configmap init-data --from-file=./postgres/scripts

## Create deployment
cd kube-wso2/is-postgres
is-postgres>kubectl create -f ./postgres/kube/postgres-deployment.yaml

## Create service
cd kube-wso2/is-postgres
is-postgres>kubectl create -f ./postgres/kube/postgres-service.yaml


# Identity Server

## Create config maps
cd kube-wso2/is-postgres
is-postgres>kubectl create configmap config-datasource --from-file=./is/configs/master-datasources.xml
is-postgres>kubectl create configmap config-usermgt --from-file=./is/configs/user-mgt.xml
is-postgres>kubectl create configmap config-identity --from-file=./is/configs/identity.xml
is-postgres>kubectl create configmap config-ldap --from-file=./is/configs/embedded-ldap.xml


## Create deployment
cd kube-wso2/is-postgres
is-postgres>kubectl create -f ./is/kube/is-deployment.yaml

## Create service
cd kube-wso2/is-postgres
is-postgres>kubectl create -f ./is/kube/is-service.yaml
