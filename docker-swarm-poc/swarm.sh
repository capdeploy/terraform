##On manager
hostnamectl set-hostname --static manger
vi /etc/hosts #add hostname ip

##On workers
hostnamectl set-hostname --static worker01
hostnamectl set-hostname --static worker02
vi /etc/hosts #add hostname ip

#On all
##Install Docker CE
apt-get update && apt-get awscli install apt-transport-https ca-certificates curl gnupg-agent software-properties-common net-tools vim -y
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" -y
apt-get update && apt-get install docker-ce docker-ce-cli -y
systemctl start docker
systemctl enable docker
usermod -aG docker ${USER}

#On manager
newgrp docker
docker swarm init --advertise-addr `ifconfig | grep 192.168 | awk '{print $2}'` > /tmp/swarm.out
token=`grep token /tmp/swarm.out | awk '{print $5'} | grep -v to`
#grab token for workers

#On workers
docker swarm join --token $token `grep manager /etc/hosts | awk '{print $1}'`:2377

#Helpful cmds
docker node ls
docker service create --name <servicename> -p 8080:80 <image>
docker service ls
docker service scale <servicename>=<n+2>

#on master
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 491147561046.dkr.ecr.us-east-1.amazonaws.com
docker pull 491147561046.dkr.ecr.us-east-1.amazonaws.com/nginxrp:local-latest

#on manager - Portainer gui https://docs.portainer.io/start/install-ce/server/swarm/linux
curl -L https://downloads.portainer.io/ce2-19/portainer-agent-stack.yml -o portainer-agent-stack.yml
docker stack deploy -c portainer-agent-stack.yml portainer
echo "login using https://172.16.2.111:9443"