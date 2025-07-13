FROM openjdk:8-jre

EXPOSE 20741

# Create working directory
RUN apt-get update && \
    apt-get install -y wget unzip && \
    mkdir -p /opt/sepia-stt

WORKDIR /opt/sepia-stt

# Download and extract the STT server
RUN wget https://github.com/SEPIA-Framework/sepia-stt-server/releases/download/v1.5.1/sepia-stt-server-v1.5.1.zip && \
    unzip sepia-stt-server-v1.5.1.zip && \
    rm sepia-stt-server-v1.5.1.zip

WORKDIR /opt/sepia-stt/sepia-stt-server

# Start the server
CMD ["java", "-jar", "stt-server-1.5.1.jar"]
