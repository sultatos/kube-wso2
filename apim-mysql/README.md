```
oc create configmap config-apim --from-file=./configs/api-manager.xml
oc create configmap config-datasource --from-file=./configs/master-datasources.xml
oc create configmap config-registry --from-file=./configs/registry.xml
oc create configmap config-usermgt --from-file=./configs/user-mgt.xml


oc create configmap init-data --from-file=./scripts
```
