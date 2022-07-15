# angadisachin2/otel-java-postgress-poc:latest
# https://github.com/sachin-net/OTEL-with-java-postgress
FROM maven:3.5.2-jdk-8-alpine

#COPY spring-petclinic-2.6.0-SNAPSHOT.jar /

COPY spring-petclinic-rest-2.6.2.jar /
COPY opentelemetry-javaagent.jar /

ENV OTEL_SERVICE_NAME="petclinic"

ENV OTEL_TRACES_EXPORTER="otlp,logging"

# Send traces to OpenTelemetry collector
ENV OTEL_EXPORTER_OTLP_ENDPOINT="http://otel-collector.otel-collector.svc.cluster.local:55680"

# Connect to Postgres
ENV POSTGRES_URL="jdbc:postgresql://database-private-subnet-postgresql.cqsj5czhbzgk.ap-south-1.rds.amazonaws.com:5432/postgres"
ENV POSTGRES_USER="master"
ENV POSTGRES_PASS="xxxxxxxxx"

ENTRYPOINT ["java","-Xmx4g","-javaagent:opentelemetry-javaagent.jar","-Dspring.profiles.active=postgresql,spring-data-jpa","-jar","spring-petclinic-rest-2.6.2.jar"]
