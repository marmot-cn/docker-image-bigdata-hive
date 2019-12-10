FROM bde2020/hive:2.3.2-postgresql-metastore

ENV SQOOP_HOME /opt/sqoop
ENV PATH $SQOOP_HOME/bin:$PATH

ADD sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz /opt/sqoop
ADD mysql-connector-java-5.1.38.jar $SQOOP_HOME/lib/
ADD sqoop-env.sh $SQOOP_HOME/conf/

RUN set -ex \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && cp /opt/hive/lib/hive-exec-2.3.2.jar ${SQOOP_HOME}/lib
