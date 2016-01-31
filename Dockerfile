#
# ReportServer
#

FROM aibano/tomcat-java-7
MAINTAINER Osama Alaiban, megdam@gmail.com

# Copy the file from host to container
RUN mkdir /usr/local/tomcat/webapps/reportserver
ADD RS2.2.2-5639-reportserver.zip /usr/local/tomcat/webapps/reportserver

# Copy the environment file from host to container
ADD setenv.sh /usr/local/tomcat/bin

# Copy database connection configuration file from host to container
ADD persistence.xml /usr/local/tomcat/webapps/reportserver/WEB-INF/classes/META-INF/

RUN apt-get update && \
    apt-get install -y zip && \
    unzip /usr/local/tomcat/webapps/reportserver/RS2.2.2-5639-reportserver.zip -d /usr/local/tomcat/webapps/reportserver
