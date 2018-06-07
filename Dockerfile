From tomcat:8-jre8
MAINTAINER "ctallada@osius.com"
EXPOSE 8080
# Copy to images tomcat path
ADD target/RestFrameNewApp.war /usr/local/tomcat/webapps/
#ADD target/SpringKube.jar SpringKube.jar
#ENTRYPOINT ["java","-jar","SpringKube.jar"]
CMD ["catalina.sh -c trap : TERM INT; sleep infinity & wait", "run"]
