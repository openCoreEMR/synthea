##
# It says something about the Java ecosystem
# that we are two degrees of obsolete product names
# away from "java" at this point.
FROM eclipse-temurin:11-jre-alpine AS base


FROM base AS deploy
ARG SYNTHEA_VERSION=master-branch-latest
RUN mkdir /opt/synthea
ADD https://github.com/synthetichealth/synthea/releases/download/${SYNTHEA_VERSION}/synthea-with-dependencies.jar /opt/synthea
COPY synthea /usr/local/bin/synthea
ENTRYPOINT ["/usr/local/bin/synthea"]
