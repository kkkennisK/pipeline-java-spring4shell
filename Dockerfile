##
## Build
##
FROM docker.io/maven:3.8.4-openjdk-11-slim AS build

WORKDIR /helloworld/

ADD pom.xml /helloworld
RUN mvn dependency:go-offline

ADD src/ /helloworld/src
RUN mvn clean package

##
## Run
## Pin our tomcat version to something that has not been updated to remove the vulnerability
FROM tomcat:9.0.59-jre11-openjdk-slim

#  Deploy to tomcat
COPY --from=build /helloworld/target/helloworld.war /usr/local/tomcat/webapps/

#  Ability to debug tomcat
ENV JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:8000"
EXPOSE 8080
EXPOSE 8000
CMD ["catalina.sh", "jpda", "run"]
