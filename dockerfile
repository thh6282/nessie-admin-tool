FROM openjdk:21-jdk-slim

WORKDIR /app

COPY nessie-server-admin-tool-0.92.1-runner.jar .

ENV NESSIE_VERSION_STORE_TYPE=JDBC
ENV QUARKUS_DATASOURCE_DB_KIND=postgresql
ENV QUARKUS_DATASOURCE_ACTIVE=true
ENV QUARKUS_DATASOURCE_DEV_SERVICES_ENABLED=true
ENV QUARKUS_DATASOURCE_USERNAME=nessiecatalog
ENV QUARKUS_DATASOURCE_PASSWORD=VnUAfNXLvsoLT5N2phvdKebGhkeryx4yYCOnDuR
ENV QUARKUS_DATASOURCE_URL=jdbc:postgresql://172.16.100.166:30327/nessiecatalog
ENV NESSIE_VERSION_STORE_PERSIST_JDBC_DATASOURCE=postgresql

# Create nessie.zip using the CMD commands during the RUN step

CMD /bin/sh -c "java \
  -Dquarkus.log.level=DEBUG \
  -Dnessie.version.store.type=${NESSIE_VERSION_STORE_TYPE} \
  -Dquarkus.datasource.postgresql.db-kind=${QUARKUS_DATASOURCE_DB_KIND} \
  -Dquarkus.datasource.postgresql.active=${QUARKUS_DATASOURCE_ACTIVE} \
  -Dquarkus.datasource.postgresql.devservices.enabled=${QUARKUS_DATASOURCE_DEV_SERVICES_ENABLED} \
  -Dquarkus.datasource.postgresql.username=${QUARKUS_DATASOURCE_USERNAME} \
  -Dquarkus.datasource.postgresql.password=${QUARKUS_DATASOURCE_PASSWORD} \
  -Dquarkus.datasource.postgresql.jdbc.url=${QUARKUS_DATASOURCE_URL} \
  -Dnessie.version.store.persist.jdbc.datasource=${NESSIE_VERSION_STORE_PERSIST_JDBC_DATASOURCE} \
  -jar nessie-server-admin-tool-0.92.1-runner.jar export --single-branch-current-content main --max-file-size=50000000 --output-buffer-size=65536 --path=nessie && \
  java \
  -Dquarkus.log.level=DEBUG \
  -Dnessie.version.store.type=${NESSIE_VERSION_STORE_TYPE} \
  -Dquarkus.datasource.postgresql.db-kind=${QUARKUS_DATASOURCE_DB_KIND} \
  -Dquarkus.datasource.postgresql.active=${QUARKUS_DATASOURCE_ACTIVE} \
  -Dquarkus.datasource.postgresql.devservices.enabled=${QUARKUS_DATASOURCE_DEV_SERVICES_ENABLED} \
  -Dquarkus.datasource.postgresql.username=${QUARKUS_DATASOURCE_USERNAME} \
  -Dquarkus.datasource.postgresql.password=${QUARKUS_DATASOURCE_PASSWORD} \
  -Dquarkus.datasource.postgresql.jdbc.url=${QUARKUS_DATASOURCE_URL} \
  -Dnessie.version.store.persist.jdbc.datasource=${NESSIE_VERSION_STORE_PERSIST_JDBC_DATASOURCE} \
  -jar nessie-server-admin-tool-0.92.1-runner.jar import --erase-before-import --path /app/nessie"

