FROM gcr.io/distroless/java:11
ENV JAVA_TOOL_OPTIONS -XX:+ExitOnOutOfMemoryError
COPY app/reposilite-backend/target/reposilite*.jar /app/reposilite.jar
CMD ["/app/reposilite.jar"]
