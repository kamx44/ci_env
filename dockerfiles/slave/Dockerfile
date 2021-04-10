FROM ubuntu:18.04
WORKDIR /home
COPY *.jar agent.jar
RUN apt-get update && apt-get install -y \
    curl \
    openjdk-11-jdk \
    git \
    maven
RUN adduser --disabled-password --gecos '' jenkins
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io
ENTRYPOINT ["/usr/bin/java","-jar","agent.jar","-jnlpUrl"]
CMD ["http://192.168.33.33:8880/computer/Slave1/jenkins-agent.jnlp","-secret","bc34df5c30c84a000fde7313c7c5c034bf1f1b9400b1b93631dc058cf35901b5","-workDir","/home"]