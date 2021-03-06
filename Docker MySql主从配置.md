> reference ： [https://segmentfault.com/a/1190000013159922](https://segmentfault.com/a/1190000013159922)

#### 主从配置
##### 主
* my.cnf
```aidl
[mysqld]
log-bin=mysql-bin
server-id=1
innodb_flush_log_at_trx_commit=1
sync_binlog=1
```

```aidl
docker run --name mysql_master -p 3306:3306 -v C:\Users\xingwang.mo\Documents\docker\mysql57\mysqlData\master\cnf\conf.d\my.cnf:/etc/mysql/my.cnf -e MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7

docker exec -it mysql_master bash

mysql -u root -p

CREATE USER 'docker'@'%' IDENTIFIED BY '123456';
GRANT all ON *.* TO 'docker'@'%';
flush privileges;
show master status;

```

##### 从
* my.cnf
```aidl
[mysqld]
server-id=2
```

docker run --name mysql_slave -p 3307:3306 -v C:\Users\xingwang.mo\Documents\docker\mysql57\mysqlData\slave\cnf\conf.d\my.cnf:/etc/mysql/my.cnf -e  MYSQL_ROOT_PASSWORD=123456 -d mysql:5.7

docker exec -it mysql_slave bash

mysql -u root -p


CHANGE MASTER TO    MASTER_HOST='172.17.0.2',  MASTER_USER='docker', MASTER_PASSWORD='123456',  MASTER_LOG_FILE='mysql-bin.000004',    MASTER_LOG_POS=154;

START SLAVE;

show slave status\G;

#### 启动主从

* 主从同时创建用户并且授权
```aidl
CREATE USER 'docker'@'%' IDENTIFIED BY '123456';
GRANT all ON *.* TO 'docker'@'%';
flush privileges;
```



* 从库操作连接到主库
```aidl
CHANGE MASTER TO
MASTER_HOST='172.17.0.2',
MASTER_PORT=3306,
MASTER_USER='docker',
MASTER_PASSWORD='123456';

start slave user='docker' password='123456';
stop SLAVE;

show slave status;
```



#### test
```aidl
create database test;
use test;
create table tx_config(
  id bigint auto_increment comment '规则id'
    primary key,
  config_name varchar(100) not null comment '规则名称',
  create_time datetime null comment '创建时间'
)engine =innodb comment '规则配置表' charset=utf8
;
```