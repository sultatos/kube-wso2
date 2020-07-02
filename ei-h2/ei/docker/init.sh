#!/bin/sh

set -e

#docker_container_ip=$(awk 'END{print $1}' /etc/hosts)
#echo "#######Docker container IP#######" + ${docker_container_ip}
#sed -i "s#<parameter\ name=\"localMemberHost\".*<\/parameter>#<parameter\ name=\"localMemberHost\">${docker_container_ip}<\/parameter>#" ${WSO2_SERVER_HOME}/repository/conf/axis2/axis2.xml
sh ${WSO2_SERVER_HOME}/bin/integrator.sh "$@"