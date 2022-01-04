# Pull base Tomcat image
FROM tomcat:9-jdk11-openjdk
LABEL version="1.0"
LABEL description="Guidewire tomcat server with H2 databasae"

# Copy guidewire war file to tomcat path
ADD cc.war /usr/local/tomcat/webapps/

# extract war guidewire war file
RUN unzip /usr/local/tomcat/webapps/cc.war -d /usr/local/tomcat/webapps/cc/
RUN rm /usr/local/tomcat/webapps/*.war

# Copy the new config files for the docker image
COPY suite-config.xml /usr/local/tomcat/webapps/cc/modules/configuration/config/suite/
COPY config.xml /usr/local/tomcat/webapps/cc/modules/configuration/config/
COPY database-config.xml /usr/local/tomcat/webapps/cc/modules/configuration/config/


#Add h2 database files -Commented this out to create a blank database to start with
RUN mkdir -p /tmp/guidewire/v10
ADD cc.mv.db /tmp/guidewire/v10/

#add tomcat cache options
COPY setenv.sh /usr/local/tomcat/bin/
COPY ojdbc10.jar /usr/local/tomcat/webapps/cc/WEB-INF/lib/

#expose the application port from tomcat
EXPOSE 8080/tcp
