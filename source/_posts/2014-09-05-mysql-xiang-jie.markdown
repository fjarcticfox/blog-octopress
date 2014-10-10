---
layout: post
title: "MySQL 详解"
date: 2014-09-05 10:16:53 +0800
comments: true
categories: [mysql]
---

<!-- more -->

## 下载安装及配置

### OS X 环境


### Windows 环境

Windows 下有可采用两种方式安装 MySQL 服务。

* ZIP Archive

    1. 下载 ZIP 压缩包，解压至对应目录下
    2. 配置环境变量 MYSQL_HOME，以及增加 MySQL 的 bin 目录到 path 变量中


* MSI Installer
    
    1. 下载 MSI 安装包，按提示进行安装


## MySQL 常用命令

```sh

# mysqld，数据库启动命令
mysqld

# mysql，数据库链接命令
mysql

# status，查看数据库状态
mysql> status
--------------
mysql  Ver 14.14 Distrib 5.6.20, for Win64 (x86_64)

Connection id:          13
Current database:
Current user:           ODBC@localhost
SSL:                    Not in use
Using delimiter:        ;
Server version:         5.6.20 MySQL Community Server (GPL)
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    gbk
Conn.  characterset:    gbk
TCP port:               3306
Uptime:                 14 min 32 sec

Threads: 5  Questions: 348  Slow queries: 0  Opens: 68  Flush tables: 1  Open tables: 61  Queries per second avg: 0.399
--------------

# 查看数据库列表
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| test               |
+--------------------+
4 rows in set (0.00 sec)

# 数据库切换（切换至 mysql 数据库）
mysql> use mysql;

# 查看库中数据表列表
mysql> show tables;

# 查看 mysql 数据库用户
mysql> select * from mysql.user;

# 




```