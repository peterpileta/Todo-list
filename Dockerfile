# Use official Tomcat base image
FROM tomcat:9.0-jdk17

# Remove the default ROOT app (optional)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file to the webapps folder
COPY target/module6-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port (default Tomcat port)
EXPOSE 8080
