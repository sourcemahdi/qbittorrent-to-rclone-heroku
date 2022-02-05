FROM anasty17/mltb:latest
# FROM anasty17/mltb-oracle:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]

FROM developeranaz/qbittorrent2rclone:beta1
#FROM developeranaz/qbittorrent-rclone-heroku
#RUN apt update 
#RUN apt install unzip 
#RUN apt install qbittorrent-nox -y
#curl -y
#RUN apt install rclone -y
COPY entrypoint.sh /entrypoint.sh 
COPY qBconf.tar.gz /qBconf.tar.gz
RUN tar xvf /qBconf.tar.gz
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
