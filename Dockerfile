#
# ReportServer
#

FROM aibano/tomcat-docker
MAINTAINER Osama Alaiban, megdam@gmail.com

# Copy the file from host to container
RUN mkdir /usr/local/tomcat/webapps/reportserver

# Copy the environment file from host to container. In order for the 
# In case you want to increase the HEAP uncomment the below line.
# ADD setenv.sh /usr/local/tomcat/bin
RUN wget -P /usr/local/tomcat/bin/ http://raw.githubusercontent.com/aibano/reportserver-docker/master/setenv.sh

# Copy database connection configuration file from host to container
# ADD persistence.xml /usr/local/tomcat/webapps/reportserver/WEB-INF/classes/META-INF/
RUN wget -P /usr/local/tomcat/webapps/reportserver/WEB-INF/classes/META-INF/ http://raw.githubusercontent.com/aibano/reportserver-docker/master/persistence.xml

RUN apt-get update && \
    apt-get install -y zip && \
    wget -P /usr/local/tomcat/webapps/reportserver/ http://sourceforge.net/projects/dw-rs/files/bin/2.2/RS2.2.2-5639-reportserver.zip && \
    unzip /usr/local/tomcat/webapps/reportserver/RS2.2.2-5639-reportserver.zip -d /usr/local/tomcat/webapps/reportserver
