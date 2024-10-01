FROM maven:3.9.7-eclipse-temurin-17 As Build
RUN  git clone https://github.com/shagun72/spring-petclinic.git
RUN cd spring-petclinic && mvn clean package
FROM amazoncorretto:17-alpine-jdk
RUN mkdir/spc && chown nobody /spc
USER nobody
WORKDIR /spc
COPY --from=build --chown=nobody:nobody spring-petclinic/target/spring-petclinic-3.3.0-SNAPSHOT.jar /spc/spring-petclinic.jar
EXPOSE 8080
CMD [ "java","-jar","spring-petclinic.jar"]