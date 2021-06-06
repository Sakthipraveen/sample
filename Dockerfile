FROM tomcat:latest
WORKDIR webapps
COPY target/my-app-1.0-SNAPSHOT.war .
RUN rm -rf ROOT && mv my-app-1.0-SNAPSHOT.war ROOT.war
ENTRYPOINT ["sh", "/usr/local/tomcat/bin/startup.sh"]
