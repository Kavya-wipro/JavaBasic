FROM tomcat:latest
RUN apt-get update && apt-get install -y maven
WORKDIR /usr/local/tomcat
RUN pwd && ls
COPY */webapp.war /usr/local/tomcat/webapps
COPY . /usr/local/tomcat/maven_project
WORKDIR /usr/local/tomcat/maven_project/JavaBasic
RUN pwd && ls -la
RUN ls -l 
RUN ls -la /usr/local/tomcat/maven_project
RUN mvn -X test
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
RUN ls -l 
RUN ls -l */*-reports/
RUN ls -l target/surefire-reports/
RUN ls -l target/failsafe-reports/
RUN ls -l target/custom-reports/
RUN ls -l */*-reports/
CMD ["catalina.sh", "run"]
