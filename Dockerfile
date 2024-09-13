FROM tomcat:latest
RUN apt-get update && apt-get install -y maven
WORKDIR /usr/local/tomcat
RUN pwd && ls
COPY */webapp.war /usr/local/tomcat/webapps
COPY . /harness/JavaBasic
WORKDIR /harness/JavaBasic
RUN pwd && ls -la
RUN ls -l /harness/JavaBasic/
RUN rm -rf /root/.m2/repository && mvn -X test -U
RUN ls -l server/target/surefire-reports/
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps


CMD ["catalina.sh", "run"]
