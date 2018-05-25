From tomcat:8-jre8
MAINTAINER "ctallada@osius.com"
EXPOSE 8282
# Copy to images tomcat path
ADD target/RestFrameWorkUtility-1.0.0.war /usr/local/tomcat/webapps/newapp.war
#ADD target/SpringKube.jar SpringKube.jar
#ENTRYPOINT ["java","-jar","SpringKube.jar"]
CMD ["catalina.sh", "run"]
 

