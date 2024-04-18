FROM gradle AS builder
COPY springboot /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build --no-daemon
FROM openjdk:11
COPY --from=builder /home/gradle/src/build/libs/spring-boot-FiiPractic-1.0.jar /app/
WORKDIR /app
ENTRYPOINT ["java", "-jar", "spring-boot-FiiPractic-1.0.jar"]
