FROM maven:3-openjdk-11 as builder
RUN curl -L -o source.tar.gz https://github.com/dzikoysk/reposilite/archive/refs/tags/2.9.20.tar.gz
RUN tar xavf source.tar.gz --strip-components=1
RUN mvn clean package

FROM gcr.io/distroless/java:11
ENV JAVA_TOOL_OPTIONS -XX:+ExitOnOutOfMemoryError
COPY --from=builder reposilite-backend/target/reposilite*.jar /app/reposilite.jar
WORKDIR /data
CMD ["/app/reposilite.jar"]
