FROM openjdk:8-jre

EXPOSE 20741

RUN apt-get update && apt-get install -y unzip

WORKDIR /opt/sepia-stt

# Use ADD to download and unzip automatically
ADD https://github.com/SEPIA-Framework/sepia-stt-server/releases/download/v1.5.1/sepia-stt-server-v1.5.1.zip .

RUN unzip sepia-stt-server-v1.5.1.zip && \
    rm sepia-stt-server-v1.5.1.zip

WORKDIR /opt/sepia-stt/sepia-stt-server

CMD ["java", "-jar", "stt-server-1.5.1.jar"]

