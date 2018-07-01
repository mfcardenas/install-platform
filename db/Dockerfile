FROM mysql:5.7
COPY ./my.cnf /etc/mysql/conf.d/

#RUN mkdir -p /root/home/
#COPY ./init.sh /root/home/
#
#RUN bash /root/home/init.sh

COPY ./init.sql /docker-entrypoint-initdb.d/

#RUN mkdir -p /root/home/
#COPY ./createdb.sh /root/home/
#RUN chmod +x /root/home/createdb.sh
#RUN /root/home/createdb.sh
