sudo apt update 

sudo apt install -y apt-transport-https ca-certificates curl software-properties-common  

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -      

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"   

sudo apt update                                                                                                                     

apt-cache policy docker-ce                                                                                                          

sudo apt install -y docker-ce                                                                                                          

sudo systemctl status docker

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

echo "RUN apt -y update && apt -y install mysql-server
COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

ENV MYSQL_ROOT_PASSWORD=123456

#CMD /usr/bin/mysqld &>/dev/null
CMD ["mysqld"]
" >> Dockerfile

docker build mysqlmysql .

docker run -p3306:3306 mysqlmysql




echo "version: '3.3'
services:
  wordpress:
    image: wordpress:latest
    restart: always
    links:
      - db:mysqlmysql
    ports:
      - "8000:80"
    working_dir: /var/www/html
    volumes:
      - "/opt/wp-content:/var/www/html/wp-content"
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: wordpress
      WORDPRESS_DB_NAME: wordpress 
  db:
    image: mysql:5.7
    restart: always
    volumes:
      - "/opt/mysql:/var/lib/mysql"
    environment:
      MYSQL_ROOT_PASSWORD: secret
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: wordpress" >> docker-compose.yml 

sudo mkdir /opt/mysql

sudo mkdir /opt/wp-content

sudo chmod 777 /opt/wp-content

sudo docker-compose up -d

sudo docker ps



