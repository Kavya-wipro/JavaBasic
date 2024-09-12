FROM tomcat:latest
RUN apt-get update && apt-get install -y maven
WORKDIR /usr/local/tomcat
RUN pwd && ls
COPY */webapp.war /usr/local/tomcat/webapps
RUN mvn test
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
