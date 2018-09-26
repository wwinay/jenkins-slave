On machine where you want to run the jenkins slave......

add below contents for ExecStart section or just comment the existing one and create below line in /lib/systemd/system/docker.service file.

ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:4243



save the changes and restart the docker.....



sudo systemctl daemon-reload

sudo service docker restart



- Then check the connection using below command, you can see the api version...



curl http://localhost:4243/version





------------



Now time is to create jenkins-slave image......run below commands on host machine....



docker pull ubuntu

docker run -it ubuntu /bin/bash



Once docker container starts run below commands in container....







apt-get update

 apt-get install openssh-server

      apt-get install openjdk-8-jdk openjdk-8-jre

    useradd jenkins

      mkdir -p /home/jenkins

      userdel jenkins -r

     useradd -d /home/jenkins jenkins

   su - jenkins

   cp /etc/skel/.* /home/jenkins/

     chown -R jenkins:jenkins /home/jenkins/

   /usr/sbin/sshd

    mkdir /var/run/sshd

   /usr/sbin/sshd

  apt-get install curl

   curl -fsSL https://get.docker.com/ | sh

usermod -aG docker jenkins

    exit





once done....commit the container into image



docker ps -a   --- you will get the container id



docker commit <container id> jenkins-slave .  --- this will create an image



docker images





in jenkins configuration for docker.....we need to do as per the screenshots attached...





Once done, run a job and you will see the container over there as per the screenshot





We will discuss it tomorrow...



Thank you.... !!!


3 Attachments

