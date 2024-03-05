FROM jetbrains/teamcity-minimal-agent:2023.11.4

ARG jdkUrl='https://corretto.aws/downloads/latest/amazon-corretto-21-x64-linux-jdk.tar.gz' 

USER root

RUN apt-get update; \
    apt-get install -y binutils; \
    mv /opt/java/openjdk /opt/buildagent/jre; \
    curl -LfsSo /tmp/openjdk.tar.gz ${jdkUrl}; \
    mkdir /opt/java/openjdk; \ 
    cd /opt/java/openjdk; \
    tar -xf /tmp/openjdk.tar.gz --strip-components=1; \
    chown -R root:root /opt/java; \
    rm -rf /tmp/openjdk.tar.gz; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*;

USER buildagent
