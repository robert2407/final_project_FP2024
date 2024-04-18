FROM openjdk:11
ADD springboot /springboot
WORKDIR /springboot
RUN ./gradlew build --no-daemon
ENTRYPOINT java -jar build/libs/spring-boot-FiiPractic-1.0.jar