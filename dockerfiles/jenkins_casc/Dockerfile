FROM jenkins/jenkins:jdk11

COPY plugins.txt /usr/share/jenkins/plugins.txt

#RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/plugins.txt --verbose

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

RUN rm -rf /usr/local/jenkins-casc.yaml
COPY jenkins-casc.yaml /usr/local/jenkins-casc.yaml

ENV CASC_JENKINS_CONFIG /usr/local/jenkins-casc.yaml