FROM adoptopenjdk:11-jre-hotspot

WORKDIR /app

COPY target/springboot-restful-webservices.jar /app/springboot-restful-webservices.jar

ENTRYPOINT ["java", "-jar", "springboot-restful-webservices.jar"]