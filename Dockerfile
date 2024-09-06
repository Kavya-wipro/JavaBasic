FROM tomcat:latest
RUN PWD && ls
COPY . /usr/local/tomcat/webapps
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
