FROM tomcat:latest
WORKDIR webapps
COPY target/my-app-1.0-SNAPSHOT.jar .
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
