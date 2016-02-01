#
# ReportServer
#

FROM aibano/tomcat-docker
MAINTAINER Osama Alaiban, megdam@gmail.com

# Copy the file from host to container
RUN mkdir /usr/local/tomcat/webapps/reportserver

# Copy the environment file from host to container
ADD setenv.sh /usr/local/tomcat/bin

# Copy database connection configuration file from host to container
ADD persistence.xml /usr/local/tomcat/webapps/reportserver/WEB-INF/classes/META-INF/

RUN apt-get update && \
    apt-get install -y zip && \
    wget -P /usr/local/tomcat/webapps/reportserver/ http://sourceforge.net/projects/dw-rs/files/bin/2.2/RS2.2.2-5639-reportserver.zip && \
    unzip /usr/local/tomcat/webapps/reportserver/RS2.2.2-5639-reportserver.zip -d /usr/local/tomcat/webapps/reportserver
