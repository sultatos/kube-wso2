#!/bin/sh

set -e

docker_container_ip=$(awk 'END{print $1}' /etc/hosts)
sed -i "s#<parameter\ name=\"localMemberHost\".*<\/parameter>#<parameter\ name=\"localMemberHost\">${docker_container_ip}<\/parameter>#" ${WSO2_SERVER_HOME}/repository/conf/axis2/axis2.xml
sh ${WSO2_SERVER_HOME}/bin/wso2server.sh "$@"