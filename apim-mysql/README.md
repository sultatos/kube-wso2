```
oc create configmap config-apim --from-file=./apim/configs/api-manager.xml
oc create configmap config-datasource --from-file=./apim/configs/master-datasources.xml
oc create configmap config-registry --from-file=./apim/configs/registry.xml
oc create configmap config-usermgt --from-file=./apim/configs/user-mgt.xml


oc create configmap init-data --from-file=./mysql/scripts
```
