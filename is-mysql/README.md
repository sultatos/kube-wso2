
# MySQL
## Create config maps
cd kube-wso2/is-mysql
is-mysql>kubectl create configmap init-data --from-file=./mysql/scripts



# Identity Server
## Create config maps
cd kube-wso2/is-mysql
is-mysql>kubectl create configmap config-datasource --from-file=./is/configs/master-datasources.xml
is-mysql>kubectl create configmap config-usermgt --from-file=./is/configs/user-mgt.xml
is-mysql>kubectl create configmap config-identity --from-file=./is/configs/identity.xml
is-mysql>kubectl create configmap config-ldap --from-file=./is/configs/embedded-ldap.xml


## Create deployment
cd kube-wso2/is-mysql
is-mysql> kubectl create -f ./is/kube/is-deployment.yaml

