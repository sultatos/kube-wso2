# set to latest Alpine
FROM openjdk:8u201-jdk-alpine3.9

# set user configurations
ARG USER=wso2carbon
ARG USER_ID=802
ARG USER_GROUP=wso2
ARG USER_GROUP_ID=802
ARG USER_HOME=/home/${USER}
# set dependant files directory
ARG FILES=./files
# set wso2 product configurations
ARG WSO2_SERVER=wso2is
ARG WSO2_SERVER_VERSION=5.7.0
ARG WSO2_SERVER_PACK=${WSO2_SERVER}-${WSO2_SERVER_VERSION}
ARG WSO2_SERVER_HOME=${USER_HOME}/${WSO2_SERVER_PACK}
ENV ENV=${USER_HOME}"/.ashrc"

# install required packages
RUN  apk add --update --no-cache \
     curl \
     netcat-openbsd && \
     rm -rf /var/cache/apk/*

# create a user group and a user
RUN  addgroup -g ${USER_GROUP_ID} ${USER_GROUP}; \
     adduser -u ${USER_ID} -D -g '' -h ${USER_HOME} -G ${USER_GROUP} ${USER} ;

# create java prefs dir
# this is to avoid warning logs printed by FileSystemPreferences class
RUN mkdir -p ${USER_HOME}/.java/.systemPrefs && \
    mkdir -p ${USER_HOME}/.java/.userPrefs  && \
    chmod -R 755 ${USER_HOME}/.java && \
    chown -R ${USER}:${USER_GROUP} ${USER_HOME}/.java

# copy wso2 product distribution unzipped file to user's home directory and set ownership
COPY --chown=wso2carbon:wso2 ${FILES}/${WSO2_SERVER_PACK}/ ${WSO2_SERVER_HOME}/

# Create user stores directory.
RUN mkdir -p ${WSO2_SERVER_HOME}/repository/deployment/server/userstores && \
    chmod -R 755 ${WSO2_SERVER_HOME}/repository/deployment/server/userstores && \
    chown -R ${USER}:${USER_GROUP} ${WSO2_SERVER_HOME}/repository/deployment/server/userstores

# copy init script to user home
COPY --chown=wso2carbon:wso2 init.sh ${USER_HOME}/

# copy connector jar to the server as a third party library
COPY --chown=wso2carbon:wso2 ${FILES}/ojdbc8.jar ${WSO2_SERVER_HOME}/repository/components/lib/
COPY --chown=wso2carbon:wso2 ${FILES}/postgresql-*.jar ${WSO2_SERVER_HOME}/repository/components/lib/
COPY --chown=wso2carbon:wso2 ${FILES}/PDUserStoreManager-1.0.0.jar ${WSO2_SERVER_HOME}/repository/components/dropins/

# add libraries for Kubernetes membership scheme based clustering
ADD --chown=wso2carbon:wso2 https://repo1.maven.org/maven2/dnsjava/dnsjava/2.1.8/dnsjava-2.1.8.jar ${WSO2_SERVER_HOME}/repository/components/lib/
ADD --chown=wso2carbon:wso2 https://repo1.maven.org/maven2/org/wso2/carbon/kubernetes/artifacts/kubernetes-membership-scheme/1.0.5/kubernetes-membership-scheme-1.0.5.jar ${WSO2_SERVER_HOME}/repository/components/dropins/

# set environment variables
ENV WSO2_SERVER_HOME=${WSO2_SERVER_HOME} \
    WORKING_DIRECTORY=${USER_HOME} \
    JAVA_OPTS="-Djava.util.prefs.systemRoot=${USER_HOME}/.java -Djava.util.prefs.userRoot=${USER_HOME}/.java/.userPrefs"

# set the user and work directory
USER ${USER_ID}
WORKDIR ${USER_HOME}

# expose ports
EXPOSE 4000 9763 9443

# initiate container and start WSO2 Carbon server
ENTRYPOINT ["/home/wso2carbon/init.sh"]
