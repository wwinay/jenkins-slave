FROM ubuntu
RUN apt-get update -y
RUN apt-get install curl openssh-server openjdk-8-jdk openjdk-8-jre apt-utils -y
RUN mkdir -p /home/jenkins
RUN useradd -d /home/jenkins jenkins
RUN cp /etc/skel/.* /home/jenkins/ &> /dev/null
RUN chown -R jenkins:jenkins /home/jenkins/
RUN mkdir -p /var/run/sshd
RUN curl -fsSL https://get.docker.com/ | sh
RUN usermod -aG docker jenkins
CMD ["/usr/sbin/sshd"]
