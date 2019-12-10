FROM bde2020/hive:2.3.2-postgresql-metastore

ENV SQOOP_HOME /opt/sqoop
ENV PATH $SQOOP_HOME/bin:$PATH

COPY sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz /opt/sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz
ADD mysql-connector-java-5.1.38.jar $SQOOP_HOME/
ADD sqoop-env.sh $SQOOP_HOME/

RUN set -ex \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && tar -zxf sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz \
    && rm sqoop-1.4.7.bin__hadoop-2.6.0.tar.gz \
    && mv sqoop-1.4.7.bin__hadoop-2.6.0 /opt/sqoop \
    && mv $SQOOP_HOME/mysql-connector-java-5.1.38.jar $SQOOP_HOME/lib/ \
    && mv $SQOOP_HOME/sqoop-env.sh $SQOOP_HOME/conf/ \ 
    && cp /opt/hive/lib/hive-exec-2.3.2.jar ${SQOOP_HOME}/lib