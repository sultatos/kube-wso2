FROM openjdk:8u201-jdk-alpine3.9
MAINTAINER agogoi@wso2.com

# Variables
ARG WSO2_SERVER_HOME=/opt/wso2/wso2is-5.7.0

# Create group (wso2) and add user (wso2carbon).
RUN  addgroup -g 802 wso2
RUN  adduser -u 802 -D -G wso2 wso2carbon

# Copy the necessary product zip.
COPY files/wso2is-5.7.0 ${WSO2_SERVER_HOME}
COPY init.sh /opt/wso2

# Add libraries for Kubernetes membership scheme based clustering
ADD --chown=wso2carbon:wso2 https://repo1.maven.org/maven2/dnsjava/dnsjava/2.1.8/dnsjava-2.1.8.jar ${WSO2_SERVER_HOME}/repository/components/lib/
ADD --chown=wso2carbon:wso2 https://repo1.maven.org/maven2/org/wso2/carbon/kubernetes/artifacts/kubernetes-membership-scheme/1.0.5/kubernetes-membership-scheme-1.0.5.jar ${WSO2_SERVER_HOME}/repository/components/dropins/

# Give permission to the user.
RUN chown -R wso2carbon:wso2 /opt/wso2

# Switch to user wso2carbon.
USER wso2carbon

# Set environment variables.
ENV WSO2_SERVER_HOME=${WSO2_SERVER_HOME}

# Set working directory
WORKDIR /opt/wso2/wso2is-5.7.0

# Expose ports
EXPOSE 4000 9763 9443

ENTRYPOINT ["/opt/wso2/init.sh"]
