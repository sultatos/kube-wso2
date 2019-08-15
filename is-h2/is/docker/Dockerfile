FROM openjdk:8u201-jdk-alpine3.9
MAINTAINER agogoi@wso2.com

# Create group (wso2) and add user (wso2carbon).
RUN  addgroup -g 802 wso2
RUN  adduser -u 802 -D -G wso2 wso2carbon

# Copy the necessary product zip.
COPY files/wso2is-5.7.0 /opt/wso2/wso2is-5.7.0


# Give permission to the user.
RUN chown -R wso2carbon:wso2 /opt/wso2

# Switch to user wso2carbon.
USER wso2carbon

# Set working directory
WORKDIR /opt/wso2/wso2is-5.7.0

# Expose ports
EXPOSE 4000 9763 9443

ENTRYPOINT ["bin/wso2server.sh"]
