
apt-get update && apt-get upgrade -y
apt-get install default-jre default-jdk -y


wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.16.1-linux-x86_64.tar.gz


wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.16.1-linux-x86_64.tar.gz.sha512
shasum -a 512 -c elasticsearch-7.16.1-linux-x86_64.tar.gz.sha512
cd /opt && tar xvfz ~/elasticsearch-7.16.1-linux-x86_64.tar.gz

groupadd elasticsearch && useradd elasticsearch -g elasticsearch -p elasticsearch

chown -R elasticsearch:elasticsearch elasticsearch && chown -R elasticsearch:elasticsearch elasticsearch-7.16.1/

ln -s elasticsearch-7.16.1 elasticsearch
sysctl -w vm.max_map_count=262144
su - elasticsearch

edit /ets/hosts
edit elasticsearch/config/elasticsearch.yml