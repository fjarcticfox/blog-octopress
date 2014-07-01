---
layout: post
title: "Ubuntu SSH 服务开启"
date: 2014-06-27 12:31:02 +0800
comments: true
categories: [ubuntu, ssh]
---

## 开启 SSH 服务

* openssh-client，客户端，用于登陆其他服务器，ubuntu 默认已经安装，如果未安装则执行以下命令：

```sh

sudo apt-get install openssh-client

```

* openssh-server，服务端，本机对外开放 SSH 服务

```sh

# 安装 openssh-server
sudo apt-get install openssh-server

# 确认 ssh server 是否启动，sshd 表示 ssh server 启动成功
ps -e | grep ssh

# 启动 ssh server 服务，ssh server 的配置文件位于 `/etc/ssh/sshd_config`，在这里可以定义 SSH 的服务端口，默认为22
sudo /etc/init.d/ssh start
# 或
service ssh start

```