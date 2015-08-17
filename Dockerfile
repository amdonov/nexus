FROM debian:jessie
RUN apt-get update && apt-get install -y curl default-jre
RUN curl -k -o nexus.tgz https://sonatype-download.global.ssl.fastly.net/nexus/oss/nexus-2.11.4-01-bundle.tar.gz && tar xvfz nexus.tgz -C /opt && rm nexus.tgz
# Allow nexus to run as any UID for Openshift
RUN chmod -R 777 /opt/sonatype-work/nexus /opt/nexus-2.11.4-01/logs /opt/nexus-2.11.4-01/tmp /opt/nexus-2.11.4-01/bin/jsw/linux-x86-64
EXPOSE 8081
VOLUME /opt/sonatype-work/nexus
CMD /opt/nexus-2.11.4-01/bin/nexus start && tail -f /opt/nexus-2.11.4-01/logs/wrapper.log
